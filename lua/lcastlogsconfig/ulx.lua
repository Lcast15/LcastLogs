--ULX/ULib hooks
if SERVER then
	local Commands = {
		NameChange = { --A user changed their name.
			Enabled = true,
			Color = '5EFF00',
			Webhook = {'default'},
			Title = 'Name Change',
			Hook = 'ULibPlayerNameChanged',
			Hookname = 'LcastLogsULXNameChangeLog'
		},
		ULXCommandCalled = { --A user executed a ULX command.
			Enabled = true,
			Color = '5EFF00',
			Webhook = {'default'},
			Title = 'ULX Command',
			Hook = 'ULibCommandCalled',
			Hookname = 'LcastLogsULXCommandLog',
			ArgExceptions = 'ulx teleport;', --Commands here will not be logged at all. They are in "ULX COMMAND;" format. always end with a semicolon.
			NoArgExceptions = 'ulx noclip;ulx motd;', --Commands here will not be logged if they have no arguments. They are in "ULX COMMAND;" format. always end with a semicolon.
		},
		MetaData = 'ulx'
	}
	
	LcastLogsRegisterCommands(Commands)
end