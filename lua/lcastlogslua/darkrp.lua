--DarkRP hooks
if SERVER then
	LcastLogsFunctions['darkrp'] = {
		LawAdded = function (Number, Law)
							local Command = 'LawAdded'
							local Description = 'Law #' .. tostring(Number) .. ' was added: "' .. Law:gsub('"', "'") .. '"'
							local Footer = LcastLogsCommands[Command]['Footer']
							local Image = nil
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, LawRemoved = function (Number, Law)
							local Command = 'LawRemoved'
							local Description = 'Law #' .. tostring(Number) .. ' was removed: "' .. Law:gsub('"', "'") .. '"'
							local Footer = LcastLogsCommands[Command]['Footer']
							local Image = nil
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, LawReset = function (Ply)
							local Command = 'LawReset'
							local Description = Ply:Name() .. ' reset the laws.'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, AgendaUpdated = function (Ply, Agenda, Text)
							local Command = 'AgendaUpdated'
							if Ply then
								local Description = Ply:Name() .. ' changed the agenda to: "' .. Text:gsub('"', "'") .. '"'
								local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
								local Image = Ply.Avatar
								LcastLogsAddLog(Command, Description, Footer, Image)
							else
								local Description = 'The agenda changed to: `' .. Text:gsub("`", "'") .. '`'
								local Footer = LcastLogsCommands[Command]['Footer']
								local Image = nil
								LcastLogsAddLog(Command, Description, Footer, Image)
							end
						end
		, VarChange = function (Ply, Name, OldValue, NewValue)
							local Command = 'VarChange'
							local Image = Ply.Avatar
							local Description = Ply:Name() .. ' changed DarkRP variable ' .. Name .. ' from ' .. tostring(OldValue) .. ' to ' .. tostring(NewValue)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, LockpickStarted = function (Ply, Ent, Trace)
							local Command = 'LockpickStarted'
							local Image = Ply.Avatar
							local Description
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							if Ent:isDoor() then
								local Owner = Ent:getDoorOwner()
								Description = Ply:Name() .. ' started lockpicking ' .. Ent:GetClass() .. ' which is owned by ' .. Owner:Name() .. ' (' .. Owner:SteamID() .. ' | ' .. team.GetName(Owner:Team()) .. ')'
							else
								Description = Ply:Name() .. ' started lockpicking ' .. Ent:GetName()
							end
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, LotteryStarted = function (Ply, Amount)
							local Command = 'LotteryStarted'
							local Image = Ply.Avatar
							local Description = Ply:Name() .. ' started a lottery for ' .. DarkRP.formatMoney(Amount)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, LotteryEnded = function (Participants, Ply, Amount)
							local Command = 'LotteryEnded'
							if Ply then
								local Description = Ply:Name() .. ' won the lottery! They won ' .. DarkRP.formatMoney(Amount)
								local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
								local Image = Ply.Avatar
								LcastLogsAddLog(Command, Description, Footer, Image)
							else
								local Description = 'No one participated.'
								local Footer = LcastLogsCommands[Command]['Footer']
								local Image = nil
								LcastLogsAddLog(Command, Description, Footer, Image)
							end
						end
		, MoneyPrinterPrint = function (Ent, PrintedEnt)
							local Command = 'MoneyPrinterPrint'
							if Ent:GetOwner():IsPlayer() then
								local Ply = Ent:GetOwner()
								local Description = Ply:Name() .. '\'s money printer printed ' .. DarkRP.formatMoney(PrintedEnt:Getamount())
								local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
								local Image = Ply.Avatar
								LcastLogsAddLog(Command, Description, Footer, Image)
							else
								local Description = 'A money printer printed ' .. DarkRP.formatMoney(PrintedEnt:Getamount())
								local Footer = LcastLogsCommands[Command]['Footer']
								local Image = nil
								LcastLogsAddLog(Command, Description, Footer, Image)
							end
						end
		, MoneyPrinterCatchFire = function (Ent)
							local Command = 'MoneyPrinterCatchFire'
							if Ent:GetOwner():IsPlayer() then
								local Ply = Ent:GetOwner()
								local Description = Ply:Name() .. '\'s money printer caught fire.'
								local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
								local Image = Ply.Avatar
								LcastLogsAddLog(Command, Description, Footer, Image)
							else
								local Description = 'A money printer caught fire.'
								local Footer = LcastLogsCommands[Command]['Footer']
								local Image = nil
								LcastLogsAddLog(Command, Description, Footer, Image)
							end
						end
		, CoownerAdded = function (Ply, Ent, Coowner)
							local Command = 'CoownerAdded'
							local Description = Ply:Name() .. ' added ' .. Coowner:Name() .. ' (' .. Coowner:SteamID() .. ' | ' .. team.GetName(Coowner:Team()) .. ') as co-owner to a door.'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, CoownerRemoved = function (Ply, Ent, Coowner)
							local Command = 'CoownerRemoved'
							local Description = Ply:Name() .. ' removed ' .. Coowner:Name() .. ' (' .. Coowner:SteamID() .. ' | ' .. team.GetName(Coowner:Team()) .. ') as co-owner to a door.'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, DarkRPComm = function (Ply, Command, Args, Return)
							local LogCommand = 'DarkRPComm'
							local Description
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							if istable(Args) then
								Args = table.concat(Args, ' ')
							end
							if #Args > 0 then
								if !LcastLogsCommands[LogCommand]['ArgExceptions']:find(Command) then
									Description = Ply:Name() .. ' ran command "' .. Command:gsub('"', "'") .. '" with the arguments of "' .. Args .. '"'
									LcastLogsAddLog(LogCommand, Description, Footer, Image)
								end
							else
								if !LcastLogsCommands[LogCommand]['ArgExceptions']:find(Command) or !LcastLogsCommands[LogCommand]['NoArgExceptions']:find(Command) then
									Description = Ply:Name() .. ' ran command "' .. Command:gsub('"', "'") .. '"'
									LcastLogsAddLog(LogCommand, Description, Footer, Image)
								end
							end
						end
		, WeaponDropped = function (Ply, Ent, Weapon)
							local Command = 'WeaponDropped'
							local Description = Ply:Name() .. ' dropped ' .. Weapon:GetClass() .. ' (' .. Weapon:GetPrintName() .. ')'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, DoorRamUsed = function (Success, Ply, Trace)
							local Command = 'DoorRamUsed'
							local Description
							if Success then
								Description = Ply:Name() .. ' rammed a door.'
							else
								Description = Ply:Name() .. ' failed to ram a door.'
							end
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, HitAccepted = function (Hitman, Target, Customer)
							local Command = 'HitAccepted'
							local Description = Hitman:Name() .. ' accepted a hit on ' .. Target:Name() .. ' (' .. Target:SteamID() .. ' | ' .. team.GetName(Target:Team()) .. ') as requested by ' .. Customer:Name() .. ' (' .. Customer:SteamID() .. ' | ' .. team.GetName(Customer:Team()) .. ')'
							local Footer = Hitman:Name() .. ' | ' .. team.GetName(Hitman:Team()) .. ' | ' .. Hitman:SteamID() .. ' | ' .. Hitman:SteamID64() .. ' | ' .. Hitman:GetUserGroup()
							local Image = Hitman.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, HitCompleted = function (Hitman, Target, Customer)
							local Command = 'HitCompleted'
							local Description = Hitman:Name() .. ' completed a hit on ' .. Target:Name() .. ' (' .. Target:SteamID() .. ' | ' .. team.GetName(Target:Team()) .. ') as requested by ' .. Customer:Name() .. ' (' .. Customer:SteamID() .. ' | ' .. team.GetName(Customer:Team()) .. ')'
							local Footer = Hitman:Name() .. ' | ' .. team.GetName(Hitman:Team()) .. ' | ' .. Hitman:SteamID() .. ' | ' .. Hitman:SteamID64() .. ' | ' .. Hitman:GetUserGroup()
							local Image = Hitman.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, HitFailed = function (Hitman, Target, Reason)
							local Command = 'HitFailed'
							local Description = Hitman:Name() .. ' failed a hit on ' .. Target:Name() .. ' (' .. Target:SteamID() .. ' | ' .. team.GetName(Target:Team()) .. ') because ' .. Reason
							local Footer = Hitman:Name() .. ' | ' .. team.GetName(Hitman:Team()) .. ' | ' .. Hitman:SteamID() .. ' | ' .. Hitman:SteamID64() .. ' | ' .. Hitman:GetUserGroup()
							local Image = Hitman.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, LockpickCompleted = function (Ply, Success, Ent)
							local Command = 'LockpickCompleted'
							local Image = Ply.Avatar
							local Description
							local Result
							if Success then
								Result = ' successfully'
							else
								Result = ' unsuccessfully'
							end
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							if Ent:isDoor() then
								local Owner = Ent:getDoorOwner()
								Description = Ply:Name() .. Result .. ' completed lockpicking ' .. Ent:GetClass() .. ' which is owned by ' .. Owner:Name() .. ' (' .. Owner:SteamID() .. ' | ' .. team.GetName(Owner:Team()) .. ')'
							else
								Description = Ply:Name() .. Result .. ' completed lockpicking ' .. Ent:GetName()
							end
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, TaxPaid = function (Ply, TaxPerc, Wallet)
							local Command = 'TaxPaid'
							local Taxed = math.floor(Wallet * (TaxPerc / 100))
							local Description = Ply:Name() .. ' payed ' .. DarkRP.formatMoney(Taxed) .. ' in tax @ ' + tostring(TaxPerc) + '%.'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, NameChange = function (Ply, OldName, NewName)
							local Command = 'NameChange'
							local Description = OldName .. ' changed their RP name to ' .. NewName
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, JobChange = function (Ply, OldTeam, NewTeam)
							local Command = 'JobChange'
							local Description = Ply:Name() .. ' changed their job from ' .. team.GetName(OldTeam) .. ' to ' .. team.GetName(NewTeam)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, Demoted = function (Demoter, Demoted, Reason)
							local Command = 'Demoted'
							local Ply = Demoted
							local Description = Ply:Name() .. ' was demoted by ' .. Demoter:Name() .. ' (' .. Demoter:SteamID() .. ' | ' .. team.GetName(Demoter:Team()) .. ') for reason "' .. Reason:gsub('"', "'") .. '"'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, PlayerFirstJoin = function (Ply, Data)
							local Command = 'PlayerFirstJoin'
							local Description = Ply:Name() .. ' has joined the server for the first time!'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, ItemPocketed = function (Ply, Ent, Table)
							local Command = 'ItemPocketed'
							local Description
							if Ent:GetOwner():IsPlayer() then
								local Owner = Ent:GetOwner()
								Description = Ply:Name() .. ' has pocketed ' .. Ent:GetClass() .. ' which is owned by ' .. Owner:Name() .. ' (' .. Owner:SteamID() .. ' | ' .. team.GetName(Owner:Team()) .. ')'
							else
								Description = Ply:Name() .. ' has pocketed ' .. Ent:GetClass()
							end
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, ItemUnpocketed = function (Ply, Ent, ItemNum, ID)
							local Command = 'ItemUnpocketed'
							local Description
							if Ent:GetOwner():IsPlayer() then
								local Owner = Ent:GetOwner()
								Description = Ply:Name() .. ' has dropped ' .. Ent:GetClass() .. ' which is owned by ' .. Owner:Name() .. ' (' .. Owner:SteamID() .. ' | ' .. team.GetName(Owner:Team()) .. '), from their pocket'
							else
								Description = Ply:Name() .. ' has dropped ' .. Ent:GetClass() .. ' from their pocket'
							end
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, PropertyTax = function (Ply, Amount, CouldAfford)
							local Command = 'PropertyTax'
							local Description
							if CouldAfford then
								Description = Ply:Name() .. ' was taxed ' + DarkRP.formatMoney(Amount) + ' for their property. They could afford it.'
							else
								Description = Ply:Name() .. ' was taxed ' + DarkRP.formatMoney(Amount) + ' for their property. They couldn\'t afford it.'
							end
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, AFKDemoted = function (Ply) --i havent tested this because i couldn't get afk mode to activate
							local Command = 'AFKDemoted'
							local Description = Ply:Name() .. ' was demoted for being AFK'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, Arrested = function (Ply, Time, CP)
							local Command = 'Arrested'
							local Description
							--correct wording, conversion to minutes, and adding seconds to the description if it is converted.
							local TimeString
							if Time >= 60 then
								if Time / 60 ~= 1 then
									TimeString = tostring(Time / 60) .. ' minutes'
								else
									TimeString = tostring(Time / 60) .. ' minute'
								end
								
								Description = Ply:Name() .. ' was arrested for ' .. TimeString .. ' (' .. tostring(Time) .. ' seconds) by ' .. CP:Name() .. ' (' .. CP:SteamID() .. ' | ' .. team.GetName(CP:Team()) .. ')'
							else
								if Time ~= 1 then
									TimeString = tostring(Time) .. ' seconds'
								else
									TimeString = tostring(Time) .. ' second'
								end
								
								Description = Ply:Name() .. ' was arrested for ' .. TimeString .. ' by ' .. CP:Name() .. ' (' .. CP:SteamID() .. ' | ' .. team.GetName(CP:Team()) .. ')'
							end

							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, AmmoBought = function (Ply, AmmoTable, Ent, Price)
							local Command = 'AmmoBought'
							local Description = Ply:Name() .. ' bought ' .. AmmoTable.name .. ' for ' .. DarkRP.formatMoney(Price)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, CustEntBought = function (Ply, EntTable, Ent, Price)
							local Command = 'CustEntBought'
							local Description = Ply:Name() .. ' bought ' .. EntTable.name .. ' for ' .. DarkRP.formatMoney(Price)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, CustVehicleBought = function (Ply, VehicleTable, Ent, Price)
							local Command = 'CustVehicleBought'
							local Description = Ply:Name() .. ' bought ' .. VehicleTable.name .. ' for ' .. DarkRP.formatMoney(Price)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, DoorBought = function (Ply, Ent, Price)
							local Command = 'DoorBought'
							local Description
							if Ent:GetClass() == '' then
								Description = Ply:Name() .. ' bought a door for ' .. DarkRP.formatMoney(Price)
							else
								Description = Ply:Name() .. ' bought door ' .. Ent:GetClass() .. ' for ' .. DarkRP.formatMoney(Price)
							end
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, FoodBought = function (Ply, FoodTable, Ent, Price)
							local Command = 'FoodBought'
							local Description = Ply:Name() .. ' bought food item ' .. FoodTable.name .. ' for ' .. DarkRP.formatMoney(Price)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, PistolBought = function (Ply, WeaponTable, Ent, Price)
							local Command = 'PistolBought'
							local Description = Ply:Name() .. ' bought weapon ' .. WeaponTable.name .. ' for ' .. DarkRP.formatMoney(Price)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, ShipmentBought = function (Ply, ShipmentTable, Ent, Price)
							local Command = 'ShipmentBought'
							local Description = Ply:Name() .. ' bought a shipment of ' .. ShipmentTable.name .. ' for ' .. DarkRP.formatMoney(Price)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, VehicleBought = function (Ply, VehicleTable, Ent, Price)
							local Command = 'VehicleBought'
							local Description = Ply:Name() .. ' bought vehicle ' .. VehicleTable.name .. ' for ' .. DarkRP.formatMoney(Price)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, ChequeDropped = function (Dropper, Recipient, Amount, Ent)
							local Command = 'ChequeDropped'
							local Ply = Dropper
							local Description = Ply:Name() .. ' dropped a cheque to ' .. Recipient:Name() .. ' (' .. Recipient:SteamID() .. ' | ' .. team.GetName(Recipient:Team()) .. ') for ' .. DarkRP.formatMoney(Amount)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, MoneyDropped = function (Ply, Amount, Ent)
							local Command = 'MoneyDropped'
							local Description = Ply:Name() .. ' dropped ' .. DarkRP.formatMoney(Amount)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, EnteredLottery = function (Ply)
							local Command = 'EnteredLottery'
							local Description = Ply:Name() .. ' entered the lottery.'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, GaveMoney = function (Giver, Recipient, Amount)
							local Command = 'GaveMoney'
							local Ply = Giver
							local Description = Ply:Name() .. ' gave ' .. DarkRP.formatMoney(Amount) .. ' to ' .. Recipient:Name() .. ' (' .. Recipient:SteamID() .. ' | ' .. team.GetName(Recipient:Team()) .. ')'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, SalaryRecvd = function (Ply, Amount)
							local Command = 'SalaryRecvd'
							local Description = Ply:Name() .. ' recieved ' .. DarkRP.formatMoney(Amount) .. ' as their salary.'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, DoorSold = function (Ply, Ent, Amount)
							local Command = 'DoorSold'
							if Ent:GetClass() == '' then
								Description = Ply:Name() .. ' sold a door for ' .. DarkRP.formatMoney(Price)
							else
								Description = Ply:Name() .. ' sold door ' .. Ent:GetClass() .. ' for ' .. DarkRP.formatMoney(Price)
							end
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, ChequePickedUp = function (Ply, Recipient, Amount, Successful, Ent)
							local Command = 'ChequePickedUp'
							local Description = ''
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							if Successful then
								if Ply == Recipient then --just incase the server has some sort of mechanism for other players to pick up checks not addressed to them, the owner picking up their cheque is under hook "playerToreUpCheque"
									Description = Ply:Name() .. ' picked up a cheque worth ' .. DarkRP.formatMoney(Amount) .. ' that was addressed to them'
								else
									Description = Ply:Name() .. ' picked up a cheque worth ' .. DarkRP.formatMoney(Amount) .. ' that was addressed to ' .. Recipient:Name() .. ' (' .. Recipient:SteamID() .. ' | ' .. team.GetName(Recipient:Team()) .. ')'
								end
							elseif LcastLogsCommands[Command]['FailEnabled'] then
								Description = Ply:Name() .. ' attempted and failed to picked up a cheque worth ' .. DarkRP.formatMoney(Amount) .. ' that is addressed to ' .. Recipient:Name() .. ' (' .. Recipient:SteamID() .. ' | ' .. team.GetName(Recipient:Team()) .. ')'
							end
							if Description != '' then
								LcastLogsAddLog(Command, Description, Footer, Image)
							end
						end
		, MoneyPickedUp = function (Ply, Amount, Ent)
							local Command = 'MoneyPickedUp'
							local Description = Ply:Name() .. ' picked up ' .. DarkRP.formatMoney(Amount)
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, WeaponPickedUp = function (Ply, Ent, Weapon)
							local Command = 'WeaponPickedUp'
							local Description = Ply:Name() .. ' picked up ' .. Weapon:GetClass() .. ' (' .. Weapon:GetPrintName() .. ')'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, DarkRPAFK = function (Ply, AFK)
							local Command = 'DarkRPAFK'
							local Description
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							if AFK then
								Description = Ply:Name() .. ' has gone AFK.'
							else
								Description = Ply:Name() .. ' has returned from being AFK.'
							end
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, Starved = function (Ply, AFK)
							local Command = 'Starved'
							local Description = Ply:Name() .. ' has died of starvation.'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, ChequeToreUp = function (Ply, Recipient, Amount, Ent)
							local Command = 'ChequeToreUp'
							local Description = Ply:Name() .. ' tore up a cheque worth ' .. DarkRP.formatMoney(Amount) .. ' that was addressed to ' .. Recipient:Name() .. ' (' .. Recipient:SteamID() .. ' | ' .. team.GetName(Recipient:Team()) .. ')'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, UnArrested = function (Ply, Actor)
							local Command = 'UnArrested'
							local Description = Ply:Name() .. ' was un-arrested by ' .. Actor:Name() .. ' (' .. Actor:SteamID() .. ' | ' .. team.GetName(Actor:Team()) .. ')'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, UnWanted = function (Ply, Actor)
							local Command = 'UnWanted'
							local Description = Ply:Name() .. ' was un-wanted by ' .. Actor:Name() .. ' (' .. Actor:SteamID() .. ' | ' .. team.GetName(Actor:Team()) .. ')'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, UnWarranted = function (Ply, Actor)
							local Command = 'UnWarranted'
							local Description = Ply:Name() .. ' was un-warranted by ' .. Actor:Name() .. ' (' .. Actor:SteamID() .. ' | ' .. team.GetName(Actor:Team()) .. ')'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, Wanted = function (Ply, Actor, Reason)
							local Command = 'Wanted'
							local Description = Ply:Name() .. ' was made wanted by ' .. Actor:Name() .. ' (' .. Actor:SteamID() .. ' | ' .. team.GetName(Actor:Team()) .. ') for reason "' .. Reason:gsub('"', "'") .. '"'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, Warranted = function (Ply, Actor, Reason)
							local Command = 'Warranted'
							local Description = Ply:Name() .. ' was warranted by ' .. Actor:Name() .. ' (' .. Actor:SteamID() .. ' | ' .. team.GetName(Actor:Team()) .. ') for reason "' .. Reason:gsub('"', "'") .. '"'
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, WeaponsChecked = function (Ply, Target, Weapons)
							local Command = 'WeaponsChecked'
							local Description
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							
							if #Weapons >= 1 then
								local WeaponString = ''
								for k,v in pairs(Weapons) do
									if k ~= #Weapons then
										WeaponString = WeaponString .. v:GetName() .. ' (' .. v:GetPrintName() .. '), '
									else
										WeaponString = WeaponString .. v:GetName() .. ' (' .. v:GetPrintName() .. ')'
									end
								end
								Description = Ply:Name() .. ' weapons checked ' .. Target:Name() .. ' (' .. Target:SteamID() .. ' | ' .. team.GetName(Target:Team()) .. ') and found: ' .. WeaponString
							else
								Description = Ply:Name() .. ' weapons checked ' .. Target:Name() .. ' (' .. Target:SteamID() .. ' | ' .. team.GetName(Target:Team()) .. ') and found nothing'
							end
							
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, WeaponsConfiscated = function (Ply, Target, Weapons)
							local Command = 'WeaponsConfiscated'
							local Description
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							
							if #Weapons >= 1 then
								local WeaponString = ''
								for k,v in pairs(Weapons) do
									if k ~= #Weapons then
										WeaponString = WeaponString .. v:GetName() .. ' (' .. v:GetPrintName() .. '), '
									else
										WeaponString = WeaponString .. v:GetName() .. ' (' .. v:GetPrintName() .. ')'
									end
								end
								Description = Ply:Name() .. ' confiscated weapons from ' .. Target:Name() .. ' (' .. Target:SteamID() .. ' | ' .. team.GetName(Target:Team()) .. '). They confiscated: ' .. WeaponString
							else
								Description = Ply:Name() .. ' confiscated weapons from ' .. Target:Name() .. ' (' .. Target:SteamID() .. ' | ' .. team.GetName(Target:Team()) .. '). They confiscated nothing'
							end
							
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
		, WeaponsReturned = function (Ply, Target, Weapons)
							local Command = 'WeaponsReturned'
							local Description
							local Footer = Ply:Name() .. ' | ' .. team.GetName(Ply:Team()) .. ' | ' .. Ply:SteamID() .. ' | ' .. Ply:SteamID64() .. ' | ' .. Ply:GetUserGroup()
							local Image = Ply.Avatar
							
							if #Weapons >= 1 then
								local WeaponString = ''
								for k,v in pairs(Weapons) do
									if k ~= #Weapons then
										WeaponString = WeaponString .. v:GetName() .. ' (' .. v:GetPrintName() .. '), '
									else
										WeaponString = WeaponString .. v:GetName() .. ' (' .. v:GetPrintName() .. ')'
									end
								end
								Description = Ply:Name() .. ' returned weapons to ' .. Target:Name() .. ' (' .. Target:SteamID() .. ' | ' .. team.GetName(Target:Team()) .. '). They returned: ' .. WeaponString
							else
								Description = Ply:Name() .. ' returned weapons to ' .. Target:Name() .. ' (' .. Target:SteamID() .. ' | ' .. team.GetName(Target:Team()) .. '). They returned nothing'
							end
							
							LcastLogsAddLog(Command, Description, Footer, Image)
						end
	}
end