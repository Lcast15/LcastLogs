if SERVER then
	--The webhook URLs come from Discord, https://support.discordapp.com/hc/en-us/articles/228383668-Intro-to-Webhooks shows how to make one.
	-- AlertWhenRateLimited is either true if lcastlogs should tell staff if that webhook is rate limited, false if it shouldnt. just leave this true if youre not sure.
	LcastLogsWebhooks = {
		--example webhook:
		
		--ReallyCoolWebhook = {
		--	URL = 'https://discordapp.com/api/webhooks/123456789012345678/fgdgfds438fds1g8dfs-df1g5dfs-gf1g5f1s5g1dfgd-g15fdsg1fd-5sg1dfg5dsg1',
		--	AlertWhenRateLimited = true
		--}
		
		default = {
			URL = '',
			AlertWhenRateLimited = true
		}
	}
	
	--This script needs an image for each log to go in the bottom left, if an avatar isnt availible for whatever reason (before users load in, for example), this is used. You do not need to change this from Jeb's face.
	LcastLogsDefaultImage = 'https://steamuserimages-a.akamaihd.net/ugc/862865288952679407/425FA33DCFA552C430015522A20CD3C8E4C7AB6D/'
	
	--The Steam Web API Key from https://steamcommunity.com/dev/apikey
	LcastLogsSteamAPIKey = ''

end