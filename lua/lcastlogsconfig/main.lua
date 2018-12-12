--Main hooks
if SERVER then
	local Commands = {
		Connect = { --A user connected to the server, they have not yet spawned however.
			Enabled = true,
			Color = 'FF00F2',
			Webhook = {'default'},
			Title = 'Player Connect',
			Hook = 'PlayerConnect',
			Hookname = 'LcastLogsConnect'
		},
		Disconnect = { --A user disconnected from the server.
			Enabled = true,
			Color = 'FF00F2',
			Webhook = {'default'},
			Title = 'Player Disconnect',
			Hook = 'PlayerDisconnected',
			Hookname = 'LcastLogsDConnect'
		},
		PlayerSpawn = { --A user has connected to the server, and spawned.
			Enabled = true,
			Color = 'FF0000',
			Webhook = {'default'},
			Title = 'Player Spawned',
			Hook = 'PlayerAuthed',
			Hookname = 'LcastLogsSpawn'
		},
		SpeakGlobal = { --A user said something in chat (not team chat).
			Enabled = true,
			Color = 'FFB900',
			Webhook = {'default'},
			Title = 'Player Say (Global)',
			Hook = 'PlayerSay',
			Hookname = 'LcastLogsChatGlobal'
		},
		SpeakTeam = { --A user said something in team chat.
			Enabled = true,
			Color = 'FFB900',
			Webhook = {'default'},
			Title = 'Player Say (Team)',
			Hook = 'PlayerSay',
			Hookname = 'LcastLogsChatTeam'
		},
		CVarChanged = { --A user changed a server cvar.
			Enabled = true,
			Color = '575757',
			Webhook = {'default'},
			Title = 'CVar Changed',
			Hook = ULibReplicatedCvarChanged,
			Hookname = 'LcastLogsCVAR'
		},
		PlayerDeath = { --A user died.
			Enabled = true,
			Color = 'FFB900',
			Webhook = {'default'},
			Title = 'Player Death',
			Hook = 'PlayerDeath',
			Hookname = 'LcastLogsDeath'
		},
		ServerInit = { --The server started.
			Enabled = true,
			Color = 'FFB900',
			Webhook = {'default'},
			Title = 'Server Initialized',
			Footer = 'Server Initialized!',
			Hook = 'OnGamemodeLoaded',
			Hookname = 'LcastLogsServerInit'
		},
		MetaData = 'main'
	}
	
	LcastLogsRegisterCommands(Commands)
end