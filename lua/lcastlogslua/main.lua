--Main hooks
if SERVER then
	LcastLogsFunctions['main'] = {
		Connect = function (Name, IP)
							local Command = 'Connect'
							local Description = Name .. ' connected.'
							local Footer = Name
							local Image = nil
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, Disconnect = function (Ply)
							local Command = 'Disconnect'
							local Description = Ply:Name() .. ' disconnected.'
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, PlayerSpawn = function (Ply)
							local Command = 'PlayerSpawn'
							http.Fetch('http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=' .. LcastLogsSteamAPIKey .. '&steamids=' .. Ply:SteamID64(), function (Body, Length, Headers, Code)
								local Data = util.JSONToTable(Body)
								local Ply = player.GetBySteamID64(Data['response']['players'][1]['steamid'])
								Ply.Avatar = Data['response']['players'][1]['avatar']
								if LcastLogsCommands[Command]['Enabled'] then --this is because this hook will always run regardless if its enabled or disabled. disabling only stops it from logging the event.
									local Description = Ply:Name() .. ' spawned.'
									local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
									local Image = Ply.Avatar
									LcastLogsAddLog(Command, Description, Footer, Image)
								end
							end )
						end
		, SpeakGlobal = function (Ply, String, Team)
							if !Team then
								local Command = 'SpeakGlobal'
								local Description = String
								local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
								local Image = Ply.Avatar
								LcastLogsAddLog(Command, Description, Footer, Image)
							end
						end
		, SpeakTeam = function (Ply, String, Team)
							if Team then
								local Command = 'SpeakTeam'
								local Description = String
								local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
								local Image = Ply.Avatar
								LcastLogsAddLog(Command, Description, Footer, Image)
							end
						end
		, CVarChanged = function (CVar, CCVar, Ply, OldVal, NewVal)
							local Command = 'CVarChanged'
							local Description = Ply:Name() .. ' changed cvar ' .. CVar .. ' from ' .. OldVal .. ' to ' .. NewVal
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, PlayerDeath = function (Ply, EntInflict, EntAttack)
							local Command = 'PlayerDeath'
							local Description
							if EntAttack:IsPlayer() and EntAttack == Ply then
								Description = Ply:Name() .. ' has committed suicide'
							elseif EntAttack:IsPlayer() then
								Description = Ply:Name() .. ' was killed by ' .. EntAttack:Name() .. ' (' .. EntAttack:SteamID() .. ') using ' .. EntInflict:GetName()
							else
								Description = Ply:Name() .. ' has died'
							end
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, ServerInit = function()
							if GetConVarString('hostname') then
								LcastLogsAddLog('ServerInit', LcastLogsCommands['ServerInit']['Footer'], GetConVarString('hostname'), nil)
							else
								LcastLogsAddLog('ServerInit', LcastLogsCommands['ServerInit']['Footer'], "Garry's Mod", nil)
							end
						end
		
	}
end