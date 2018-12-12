--Sandbox hooks
if SERVER then
	LcastLogsFunctions['sandbox'] = {
		Toolgun = function (Ply, Trace, Tool)
							local Command = 'Toolgun'
							local Description = Ply:Name() .. ' used tool ' .. Tool .. ' on ' .. Trace['Entity']:GetModel()
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, PropSpawn = function (Ply, Model, Ent)
							local Command = 'PropSpawn'
							local Description = Ply:Name() .. ' spawned ' .. Ent:GetName() .. ' ' .. Model
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, VehicleSpawn = function (Ply, Ent)
							local Command = 'VehicleSpawn'
							local Description = Ply:Name() .. ' spawned ' .. Ent:GetName()
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, SWEPSpawn = function (Ply, Ent)
							local Command = 'SWEPSpawn'
							local Description = Ply:Name() .. ' spawned ' .. Ent:GetName()
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, SWEPGive = function (Ply, SWEPName, SWEPTable)
							local Command = 'SWEPGive'
							local Description = Ply:Name() .. ' gave themselves ' .. SWEPName
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, SENTSpawn = function (Ply, Ent)
							local Command = 'SENTSpawn'
							local Description = Ply:Name() .. ' spawned ' .. Ent:GetName()
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, EffectSpawn = function (Ply, Model, Ent)
							local Command = 'EffectSpawn'
							local Description = Ply:Name() .. ' spawned ' .. Ent:GetName() .. ' ' .. Model
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, NPCSpawn = function (Ply, Ent)
							local Command = 'NPCSpawn'
							local Description = Ply:Name() .. ' spawned ' .. Ent:GetName()
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, RagdollSpawn = function (Ply, Model, Ent)
							local Command = 'RagdollSpawn'
							local Description = Ply:Name() .. ' spawned ' .. Ent:GetName() .. ' ' .. Model
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
	}
end