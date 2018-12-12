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
	
	LcastLogsFunctions['ttt'] = {
		EquipOrdered = function (Ply, Equip, IsItem)
							local Command = 'EquipOrdered'
							local Description = Ply:Name() .. ' bought ' .. Equip
							local Footer = Ply:Name() .. ' | ' .. LcastLogsTTTStringRole(Ply) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, DNAFound = function (Ply, Victim, Ent)
							local Command = 'DNAFound'
							local Description = Ply:Name() .. ' found the DNA of ' .. Victim:Name() .. ' (' .. Victim:SteamID() .. ') on ' .. Ent:GetName()
							local Footer = Ply:Name() .. ' | ' .. LcastLogsTTTStringRole(Ply) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, UsedHealthStation = function (Ply, Ent, Healed)
							local Command = 'UsedHealthStation'
							local Description = Ply:Name() .. ' healed for ' .. Healed
							local Footer = Ply:Name() .. ' | ' .. LcastLogsTTTStringRole(Ply) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, BodyFound = function (Ply, Victim, Ragdoll)
							local Command = 'BodyFound'
							local Description = Ply:Name() .. ' found the body of ' .. Victim:Name() .. ' (' .. Victim:SteamID() .. ')'
							local Footer = Ply:Name() .. ' | ' .. LcastLogsTTTStringRole(Ply) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, RoundEnd = function (WinningTeam)
							local Command = 'RoundEnd'
							local Description
							if WinningTeam == WIN_TRAITOR then
								Description = 'Traitors won!'
							elseif WinningTeam == WIN_INNOCENT then
								Description = 'Innocents won!'
							elseif WinningTeam == WIN_TIMELIMIT then
								Description = 'The round ran out of time.'
							end
							local Footer = 'Trouble in Terrorist Town'
							local Image = nil
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, PlayerDeath = function (Ply, EntInflict, EntAttack)
							local Command = 'PlayerDeath'
							local Description
							if EntAttack:IsPlayer() then
								if EntAttack == Ply then
									Description = Ply:Name() .. ' has committed suicide'
								else
									Description = Ply:Name() .. ' was killed by ' .. EntAttack:Name() .. ' (' .. EntAttack:SteamID() .. ' ' .. LcastLogsTTTStringRole(EntAttack) .. ') using ' .. EntInflict:GetClass()
								end
							else
								Description = Ply:Name() .. ' has died'
							end
							local Footer = Ply:Name() .. ' | ' .. LcastLogsTTTStringRole(Ply) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
	}
end