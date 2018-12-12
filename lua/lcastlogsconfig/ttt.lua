--TTT hooks
if SERVER then
	function LcastLogsTTTStringRole(Ply)
		local Role = Ply:GetRole()
		if Role == ROLE_TRAITOR then
			return 'Traitor'
		elseif Role == ROLE_DETECTIVE then
			return 'Detective'
		elseif Role == ROLE_INNOCENT then
			return 'Innocent'
		else
			return 'Unknown'
		end
	end
	
	local function TTTLogs()
		if GAMEMODE.Name == "Trouble in Terrorist Town" then
			local Commands = {
				EquipOrdered = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Equipment Ordered',
					Hook = 'TTTOrderedEquipment',
					Hookname = 'LcastLogsTTTEquipOrdered'
				},
				DNAFound = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'DNA Found',
					Hook = 'TTTFoundDNA',
					Hookname = 'LcastLogsTTTDNAFound'
				},
				UsedHealthStation = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Used Health Station',
					Hook = 'TTTPlayerUsedHealthStation',
					Hookname = 'LcastLogsTTTUsedHealthStation'
				},
				BodyFound = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Body Found',
					Hook = 'TTTBodyFound',
					Hookname = 'LcastLogsTTTBodyFound'
				},
				RoundEnd = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Round Ended',
					Hook = 'TTTEndRound',
					Hookname = 'LcastLogsTTTRoundEnd'
				},
				PlayerDeath = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Player Death',
					Hook = 'PlayerDeath',
					Hookname = 'LcastLogsTTTDeath',
					OnRegFunc = function () hook.Remove('PlayerDeath', 'LcastLogsDeath') end
				},
				MetaData = 'ttt'
			}
			
			LcastLogsRegisterCommands(Commands)
			print('[LcastLogs] Finished extended loading for ttt.lua')
		end
	end
	hook.Add('OnGamemodeLoaded', 'LcastLogsTTTHooksInit', TTTLogs)
end