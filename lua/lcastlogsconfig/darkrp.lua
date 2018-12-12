--DarkRP hooks
if SERVER then
	local function DarkRPLogs()
		if GAMEMODE.Name == "DarkRP" then
			local Commands = {
				LawAdded = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Law Added',
					Footer = 'DarkRP',
					Hook = 'addLaw',
					Hookname = 'LcastLogsDRPLawAdded'
				},
				LawRemoved = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Law Removed',
					Footer = 'DarkRP',
					Hook = 'removeLaw',
					Hookname = 'LcastLogsDRPLawRemoved'
				},
				LawReset = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Laws Reset',
					Hook = 'resetLaws',
					Hookname = 'LcastLogsDRPLawsReset',
				},
				AgendaUpdated = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Agenda Changed',
					Footer = 'DarkRP', --This footer is used when a player responsible isn't availible.
					Hook = 'agendaUpdated',
					Hookname = 'LcastLogsDRPAgendaUpdated'
				},
				VarChange = { --Whenever a variable changes this is called. This includes balance changes, name changes, job changes, everything. Recommended this is disabled or sent to its own webhook.
					Enabled = false,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Variable Changed',
					Hook = 'DarkRPVarChanged',
					Hookname = 'LcastLogsDRPVarChanged'
				},
				LockpickStarted = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Lockpicking Started',
					Hook = 'lockpickStarted',
					Hookname = 'LcastLogsDRPLockpick'
				},
				LotteryStarted = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Lottery Started',
					Hook = 'lotteryStarted',
					Hookname = 'LcastLogsDRPLotteryStart'
				},
				LotteryEnded = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Lottery Ended',
					Footer = 'DarkRP', --This footer is used when no one won the lottery.
					Hook = 'lotteryEnded',
					Hookname = 'LcastLogsDRPLotteryEnd'
				},
				MoneyPrinterPrint = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Money Printed',
					Footer = 'DarkRP', --This footer is used when LcastLogs doesn't know the printers owner.
					Hook = 'moneyPrinterPrinted',
					Hookname = 'LcastLogsDRPMoneyPrinterPrint'
				},
				MoneyPrinterCatchFire = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Money Printer Caught Fire',
					Footer = 'DarkRP', --This footer is used when LcastLogs doesn't know the printers owner.
					Hook = 'moneyPrinterCatchFire',
					Hookname = 'LcastLogsDRPMoneyPrinterFire'
				},
				CoownerAdded = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Co-owner added',
					Hook = 'onAllowedToOwnAdded',
					Hookname = 'LcastLogsDRPCoownerAdded'
				},
				CoownerRemoved = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Co-owner removed',
					Hook = 'onAllowedToOwnRemoved',
					Hookname = 'LcastLogsDRPCoownerRemoved'
				},
				DarkRPComm = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'DarkRP Command',
					ArgExceptions = ';', --Commands here will not be logged at all. They are in "COMMAND;" format. always end with a semicolon.
					NoArgExceptions = ';', --Commands here will not be logged if they have no arguments. They are in "COMMAND;" format. always end with a semicolon.
					Hook = 'onChatCommand',
					Hookname = 'LcastLogsDRPCommand'
				},
				WeaponDropped = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Weapon Dropped',
					Hook = 'onDarkRPWeaponDropped',
					Hookname = 'LcastLogsDRPWeaponDrop'
				},
				DoorRamUsed = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Door Ram Used',
					Hook = 'onDoorRamUsed',
					Hookname = 'LcastLogsDRPDoorRamUsed'
				},
				HitAccepted = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Hit Accepted',
					Hook = 'onHitAccepted',
					Hookname = 'LcastLogsDRPHitAccepted'
				},
				HitCompleted = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Hit Completed',
					Hook = 'onHitCompleted',
					Hookname = 'LcastLogsDRPHitCompleted'
				},
				HitFailed = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Hit Failed',
					Hook = 'onHitFailed',
					Hookname = 'LcastLogsDRPHitFailed'
				},
				LockpickCompleted = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Lockpicking Completed',
					Hook = 'onLockpickCompleted',
					Hookname = 'LcastLogsDRPLockpickComplete'
				},
				TaxPaid = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Paid Tax',
					Hook = 'onPaidTax',
					Hookname = 'LcastLogsDRPPaidTax'
				},
				NameChange = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Name Changed',
					Hook = 'onPlayerChangedName',
					Hookname = 'LcastLogsDRPNameChange'
				},
				JobChange = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Job Changed',
					Hook = 'OnPlayerChangedTeam',
					Hookname = 'LcastLogsDRPTeamChange'
				},
				Demoted = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Player Demoted',
					Hook = 'onPlayerDemoted',
					Hookname = 'LcastLogsDRPDemote'
				},
				PlayerFirstJoin = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'First Join',
					Hook = 'onPlayerFirstJoined',
					Hookname = 'LcastLogsDRPFirstJoin'
				},
				ItemPocketed = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Item Pocketed',
					Hook = 'onPocketItemAdded',
					Hookname = 'LcastLogsDRPPocketAdd'
				},
				ItemUnpocketed = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Item Dropped',
					Hook = 'onPocketItemDropped',
					Hookname = 'LcastLogsDRPPocketDrop'
				},
				PropertyTax = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Property Taxed',
					Hook = 'onPropertyTax',
					Hookname = 'LcastLogsDRPPropertyTax'
				},
				AFKDemoted = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'AFK Demoted',
					Hook = 'playerAFKDemoted',
					Hookname = 'LcastLogsDRPAFKDemote'
				},
				Arrested = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Arrested',
					Hook = 'playerArrested',
					Hookname = 'LcastLogsDRPArrested'
				},
				AmmoBought = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Ammo Purchased',
					Hook = 'playerBoughtAmmo',
					Hookname = 'LcastLogsDRPAmmoBought'
				},
				CustEntBought = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Entity Purchased',
					Hook = 'playerBoughtCustomEntity',
					Hookname = 'LcastLogsDRPCustEntBought'
				},
				CustVehicleBought = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Custom Vehicle Purchased',
					Hook = 'playerBoughtCustomVehicle',
					Hookname = 'LcastLogsDRPCustVehicleBought'
				},
				DoorBought = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Door Purchased',
					Hook = 'playerBoughtDoor',
					Hookname = 'LcastLogsDRPDoorBought'
				},
				FoodBought = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Food Purchased',
					Hook = 'playerBoughtFood',
					Hookname = 'LcastLogsDRPFoodBought'
				},
				PistolBought = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Pistol Purchased',
					Hook = 'playerBoughtPistol',
					Hookname = 'LcastLogsDRPPistolBought'
				},
				ShipmentBought = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Shipment Purchased',
					Hook = 'playerBoughtShipment',
					Hookname = 'LcastLogsDRPShipmentBought'
				},
				VehicleBought = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Vehicle Purchased',
					Hook = 'playerBoughtVehicle',
					Hookname = 'LcastLogsDRPVehicleBought'
				},
				ChequeDropped = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Cheque Dropped',
					Hook = 'playerDroppedCheque',
					Hookname = 'LcastLogsDRPChequeDropped'
				},
				MoneyDropped = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Money Dropped',
					Hook = 'playerDroppedMoney',
					Hookname = 'LcastLogsDRPMoneyDropped'
				},
				EnteredLottery = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Player Entered Lottery',
					Hook = 'playerEnteredLottery',
					Hookname = 'LcastLogsDRPEnteredLottery'
				},
				GaveMoney = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Gave Money',
					Hook = 'playerGaveMoney',
					Hookname = 'LcastLogsDRPGaveMoney'
				},
				SalaryRecvd = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Salary Recieved',
					Hook = 'playerGetSalary',
					Hookname = 'LcastLogsDRPGetSalary'
				},
				DoorSold = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Door Sold',
					Hook = 'playerKeysSold',
					Hookname = 'LcastLogsDRPDoorSold'
				},
				ChequePickedUp = { --A user used the toolgun.
					Enabled = true,
					FailEnabled = true, --Should this log failed attempts to pick up cheques? MUST HAVE ENABLED TRUE OR THIS WONT APPLY!
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Cheque Picked Up',
					Hook = 'playerPickedUpCheque',
					Hookname = 'LcastLogsDRPChequePickUp'
				},
				MoneyPickedUp = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Money Picked Up',
					Hook = 'playerPickedUpMoney',
					Hookname = 'LcastLogsDRPMoneyPickUp'
				},
				WeaponPickedUp = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Weapon Picked Up',
					Hook = 'PlayerPickupDarkRPWeapon',
					Hookname = 'LcastLogsDRPWeaponPickUp'
				},
				DarkRPAFK = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'AFK Status',
					Hook = 'playerSetAFK',
					Hookname = 'LcastLogsDRPAFKStatus'
				},
				Starved = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Starved',
					Hook = 'playerStarved',
					Hookname = 'LcastLogsDRPStarved'
				},
				ChequeToreUp = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Cheque Torn Up',
					Hook = 'playerToreUpCheque',
					Hookname = 'LcastLogsDRPChequeTornUp'
				},
				UnArrested = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Un-arrested',
					Hook = 'playerUnArrested',
					Hookname = 'LcastLogsDRPUnArrested'
				},
				UnWanted = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Un-wanted',
					Hook = 'playerUnWanted',
					Hookname = 'LcastLogsDRPUnWanted'
				},
				UnWarranted = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Un-warranted',
					Hook = 'playerUnWarranted',
					Hookname = 'LcastLogsDRPUnWarranted'
				},
				Wanted = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Wanted',
					Hook = 'playerWanted',
					Hookname = 'LcastLogsDRPWanted'
				},
				Warranted = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Warranted',
					Hook = 'playerWarranted',
					Hookname = 'LcastLogsDRPWarranted'
				},
				WeaponsChecked = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Weapons Checked',
					Hook = 'playerWeaponsChecked',
					Hookname = 'LcastLogsDRPWeaponsChecked'
				},
				WeaponsConfiscated = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Weapons Confiscated',
					Hook = 'playerWeaponsConfiscated',
					Hookname = 'LcastLogsDRPWeaponsConfiscated'
				},
				WeaponsReturned = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Weapons Returned',
					Hook = 'playerWeaponsReturned',
					Hookname = 'LcastLogsDRPWeaponsReturned'
				},
				MetaData = 'darkrp'
			}
			
			LcastLogsRegisterCommands(Commands)
			print('[LcastLogs] Finished extended loading for darkrp.lua')
		end
	end
	hook.Add('OnGamemodeLoaded', 'LcastLogsDarkRPHooksInit', DarkRPLogs)
end