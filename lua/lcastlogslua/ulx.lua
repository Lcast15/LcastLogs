--ULX/ULib hooks
if SERVER then
	LcastLogsFunctions['ulx'] = {
		NameChange = function (Ply, OldName, NewName)
							local Command = 'NameChange'
							local Description = OldName .. ' changed their name too "' .. NewName .. '"'
							local Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, ULXCommandCalled = function (Ply, Command, Args)
							local LogCommand = 'ULXCommandCalled'
							local Description
							local Footer
							local Image = Ply.Avatar
							if Ply:IsValid() then
								if #Args > 0 then
									if !LcastLogsCommands[LogCommand]['ArgExceptions']:find(Command..';') then
										Description = Ply:Name() .. ' ran command "' .. Command .. '" with the arguments of ' .. table.concat(Args, ' ')
										Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
										LcastLogsAddLog(LogCommand, Description, Footer, Image)
									end
								else
									if !LcastLogsCommands[LogCommand]['ArgExceptions']:find(Command..';') and !LcastLogsCommands[LogCommand]['NoArgExceptions']:find(Command..';') then
										Description = Ply:Name() .. ' ran command "' .. Command .. '"'
										Footer = Ply:Name() .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
										LcastLogsAddLog(LogCommand, Description, Footer, Image)
									end
								end
							end
						end
	}
end