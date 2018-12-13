if SERVER then
	--load config, it has important values
	Msg('[LcastLogs] Loading Config.\n')
	include('lcastlogsconfig/config.lua')
	
	
	
	LcastLogsCommands = {}
	LcastLogsFunctions = {}
	
	--make the LcastLogsCaches
	LcastLogsCache = {}
	for k,v in pairs(LcastLogsWebhooks) do
		--state, regular cache, rate limit cache
		LcastLogsCache[k] = {state = 'reg', regcache = {}, rlcache = {}}
	end
	
	function LcastLogsColorsConverter(Commands)
		--convert colors from a well known and used format (hex) to the one discord wants (RGB Int)
		for k, v in pairs(Commands) do
			if k ~= 'MetaData' then
				v = v['Color']
				v = v:upper():gsub('#', '')
				if #v == #v:match('[0-9A-F]*') and (#v == 6 or #v == 3) then
					--the only reason 3 character values are supported is because it's part of the CSS standards ( https://www.w3.org/TR/CSS1/#color-units ) .
					if #v == 6 then
						RedColor,GreenColor,BlueColor=v:match('(..)(..)(..)')
					elseif #v == 3 then
						RedColor,GreenColor,BlueColor=v:match('(.)(.)(.)')
						RedColor = RedColor..RedColor
						GreenColor = GreenColor..GreenColor
						BlueColor = BlueColor..BlueColor
					end
					
					--formula is 256 x 256 x red + 256 x green + blue
					Commands[k]['Color'] = tonumber(RedColor, 16) * 65536 + tonumber(GreenColor, 16) * 256 + tonumber(BlueColor, 16)
					
				else
					--if we get to this stage its safe to assume the string isnt hex, or isnt the hex we were expecting.
					Commands[k]['Color'] = 0
				end
			end
		end
		--return the finished thing
		return Commands
	end
	
	function LcastLogsAddLog(Command, Desc, Footer, Icon)
		if Icon == nil then
			Icon = LcastLogsDefaultImage
		end
		
		--lcastlogs supports sending the same log record to multiple webhooks because why not
		for k, v in pairs(LcastLogsCommands[Command]['Webhook']) do
			table.insert(LcastLogsCache[v]['regcache'],
				{
					LcastLogsCommands[Command]['Title'],
					--custom un-javascriptsafer because for reasons beyond me using "Garry\'s Mod" in JSON is a sin and doesnt work?
					string.JavascriptSafe(Desc):gsub("[\\]'", "'"),
					string.JavascriptSafe(Footer):gsub("[\\]'", "'"),
					os.date("!%Y-%m-%dT%TZ"),
					Icon,
					LcastLogsCommands[Command]['Color']
				}
			)
		end
	end

	--this is the function is the one that compiles the tables into json for discord and sends it off to be sent off.
	function LcastLogsExecCache()
		for WH,P in pairs(LcastLogsCache) do
			if P['regcache'] ~= {} then
				local Count = 0
				local CurParams = '{"embeds":['
				local Params2Send = {}
				for k, v in pairs(LcastLogsCache[WH]['regcache']) do
					Count = Count + 1
					--learn about this here https://discordapp.com/developers/docs/resources/channel#embed-object
					Embed = '{"title": "' .. v[1] .. '","description": "' .. v[2] .. '","timestamp": "' .. v[4] .. '","color": ' .. v[6] .. ',"footer": {"text": "' .. v[3] .. '","icon_url": "' .. v[5] .. '"}}'
					
					if Count == 10 then --discord supports a maximum of 10 embeds per message, nice to know.
						CurParams = CurParams .. ',' .. Embed .. ']}'
						table.insert(Params2Send, CurParams)
						CurParams = '{"embeds":['
						Count = 0
					else
						if CurParams ~= '{"embeds":[' then
							CurParams = CurParams .. ',' .. Embed
						else				
							CurParams = CurParams .. Embed
						end
					end
				end
				if CurParams ~= '{"embeds":[' then
					CurParams = CurParams .. ']}'
					table.insert(Params2Send, CurParams)
				end
				--i dont remember why i built my own JSON builder instead of using the library that comes in GLua. i do know it works and it seems to work well, so fuck it why not.
				if LcastLogsCache[WH]['state'] == 'reg' then
					LcastLogsSendDiscordMessage(LcastLogsWebhooks[WH]['URL'], Params2Send)
				else
					for k, v in pairs(Params2Send) do
						--do this cause the regcache contains raw inputs whereas the rlcache (rate limit cache) contains fully built json payloads.
						table.insert(LcastLogsCache[WH]['rlcache'], v)
					end
				end
				--always clear the regular cache. always. it should always be sent either to discord, or to the rate limit cache.
				LcastLogsCache[WH]['regcache'] = {}
			end
		end
	end
	--5 seconds should
	timer.Create('LcastLogExec', 5, 0, LcastLogsExecCache)
	
	
	
	--this is its own function because asynchronous http means we cant stop after we hit a rate limit. to make asynchronous http act like its blocking (what we want) we only run the next request on a successful message. stupid, but works.
	function LcastLogsSendDiscordMessage(URL, Params, RL) --rl stands for rate limited
		if RL == true then --lua doesnt seem to support default paramater values so just to avoid any mistakes make sure its an enthusiastic yes, this message wants tea.
			Params = LcastLogsCache[WH]['rlcache']
			http.Post(URL, {payload_json=Params[1]},
				function(Result)
					if Result == '' then
						print('[LcastLogs] Sent a rate limited log message to Discord.')
						table.remove(LcastLogsCache[WH]['rlcache'], 1)
						if #LcastLogsCache[WH]['rlcache'] > 0 then
							LcastLogsSendDiscordMessage(URL, Params, true) --second parameter here doesnt actually matter cause we replace it cause this is a rate limited req
						else
							LcastLogsCache[WH]['state'] = 'reg'
							print('[LcastLogs] Successfully cleared rate limited cache on webhook "' .. WH .. '"!')
						end	
					else
						local ResultJSON = util.JSONToTable(Result)
						if ResultJSON['message'] == 'You are being rate limited.' then
							LcastLogsRateLimitedCacheTimer(WH, LcastLogsCache[WH]['rlcache'], ResultJSON['retry_after'])
						else
							print('[LcastLogs] An error occured while sending rate limited logs to Discord:')
							print(Result)
							print(v)
						end
					end
				end, function(Error)
					print('[LcastLogs] An error occured while sending rate limited logs to Discord:')
					print(Error)
				end
			)
		else
			--this was to solve a 411 issue but i figured out sometimes it gets paramaters with nothing in them, no idea why.
			--local Headers = {}
			--these arent in the same statement because i kept getting an error about not closing the { curly bracket even though i was closing it.
			--Headers['Content-Length'] = tostring(#Params[1]) --sometimes the gmod http library doesnt send a content-length header and then discord gets pissy and sends back one of Google's HTML error pages. technically this method of content length isnt actually how you do the content length header, but fuck it.
			
			
			if #Params ~= 0 then
				http.Post(URL, {payload_json=Params[1]},
					function(Result)
						if Result == '' then
							print('[LcastLogs] Sent a log message to Discord.')
							table.remove(Params, 1)
							if #Params > 0 then
								LcastLogsSendDiscordMessage(URL, Params)
							end
						else
							local ResultJSON = util.JSONToTable(Result)
							print(Result)
							print(ResultJSON)
							if ResultJSON['message'] == 'You are being rate limited.' then
								LcastLogsCache[WH]['state'] = 'rl'
								LcastLogsRateLimitedCacheTimer(WH, Params, ResultJSON['retry_after'])
							else
								print('[LcastLogs] An error occured while sending logs to Discord:')
								print(Result)
								print(v)
							end
						end
					end, function(Error)
						print('[LcastLogs] An error occured while sending logs to Discord:')
						print(Error)
					end, Headers
				)
			end
		end
	end
	
	--this function is my attempt to make sure we dont get a webhook deactivated for spamming it hard. if your server is creating enough logs to overwhelm a webhook please use another webhook and send some logs through it instead. this might mean having a webhook dedicated to your most common log type. lcastlogs supports the user of multiple web hooks, i'd suggest you use them.
	function LcastLogsRateLimitedCacheTimer(WH, Params, Delay)
		print('[LcastLogs] Discord is rate limiting requests on webhook "' .. WH .. '". This might mean that logs on that webhook will be lagged. For further support on how to avoid this, visit [Link to support page]')
		if LcastLogsWebhooks[WH]['AlertWhenRateLimited'] then
			--if you abuse a webhook too often this preference should probably be ignored but maybe in a future update.
			for x, Ply in pairs(player.GetAll()) do
				if Ply:IsAdmin() then
					Ply:SendLua('notification.AddLegacy("[LcastLogs] Webhook \"' .. WH .. '\" has exceeded its ratelimit. Support: [Link to support page]", NOTIFY_ERROR, "30")')
					Ply:SendLua('surface.PlaySound("Friends/message.wav")')
				end
			end
		end
											
		LcastLogsCache[WH]['rlcache'] = Params
		
		--discord retry_after values are in milliseconds, so convert and add a second for good measure.
		Delay = math.floor((Delay / 1000) + 1)
		
		--this is like this because i cant think of another way to tell the timer function what webhook its for.
		FuncString = [[
			timer.Simple(]] .. tostring(Delay) .. [[, function()
				local WH = ']] .. WH .. [['
				local RateLimited = false
				
				LcastLogsSendDiscordMessage(LcastLogsCache[WH]['URL'], {}, true)
			end)]]
		
		RunString(FuncString, 'LcastLogsRateLimitCircumventer', true)
	end
	
	--do the hooks
	function LcastLogsRegisterCommands(Commands)
		Commands = LcastLogsColorsConverter(Commands)
		if #file.Find('lcastlogsconfig/' .. Commands['MetaData'] .. '.lua', 'LUA') == 1 then
			include('lcastlogslua/' .. Commands['MetaData'] .. '.lua')
		else
			Msg('[LcastLogs] ERROR loading module: "' .. Commands['MetaData'] .. '". No function file found.\n')
			return
		end
		
		for k,v in pairs(Commands) do
			if k ~= 'MetaData' then
				LcastLogsCommands[k] = v
				if v['Enabled'] or k == 'PlayerSpawn' then --playerspawn must always be run as it sets the users avatar parameter which is used alot. if it is configured as disbaled the script just wont log the event but will still run it.
					hook.Add(v['Hook'], v['Hookname'], LcastLogsFunctions[Commands['MetaData']][k])
					if v['OnRegFunc'] then
						v.OnRegFunc()
					end
				end
			end
		end
	end
	
	--rate limit testing:
	--LcastLogsCommands['Test'] = {Webhook = {'default'}, Title = 'Test', Color = 0}
	--for i=1, 100, 1 do
	--	LcastLogsAddLog('Test', 'Test', 'Test', nil)
	--end
	
	--load additional modules
	local Files = file.Find('lcastlogsconfig/*.lua', 'LUA')
	if #Files > 1 then
		for k,v in ipairs(Files) do
			Msg('[LcastLogs] Loading module: ' .. v .. '\n')
			include('lcastlogsconfig/' .. v)
		end
	end
end