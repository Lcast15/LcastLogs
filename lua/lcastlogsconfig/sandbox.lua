--Sandbox hooks
if SERVER then
	local function SandboxLogs()
		if GAMEMODE.IsSandboxDerived then
			local Commands = {
				Toolgun = { --A user used the toolgun.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Toolgun',
					Hook = 'CanTool',
					Hookname = 'LcastLogsSBoxTool'
				},
				PropSpawn = { --A user spawned a prop.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Prop Spawn',
					Hook = 'PlayerSpawnedProp',
					Hookname = 'LcastLogsSBoxProp'
				},
				VehicleSpawn = { --A user spawned a vehicle.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Vehicle Spawn',
					Hook = 'PlayerSpawnedVehicle',
					Hookname = 'LcastLogsSBoxVehicle'
				},
				SWEPSpawn = { --A user spawned a SWEP.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'SWEP Spawn',
					Hook = 'PlayerSpawnedSWEP',
					Hookname = 'LcastLogsSBoxSWEPSpawn'
				},
				SWEPGive = { --A user gave themselves a SWEP.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'SWEP Given',
					Hook = 'PlayerGiveSWEP',
					Hookname = 'LcastLogsSBoxSWEPGive'
				},
				SENTSpawn = { --A user spawned a SENT.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'SENT Spawn',
					Hook = 'PlayerSpawnedSENT',
					Hookname = 'LcastLogsSBoxSENTSpawn'
				},
				EffectSpawn = { --A user spawned an effect.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Effect Spawn',
					Hook = 'PlayerSpawnedEffect',
					Hookname = 'LcastLogsSBoxEffectSpawn'
				},
				NPCSpawn = { --A user spawned an NPC.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'NPC Spawn',
					Hook = 'PlayerSpawnedNPC',
					Hookname = 'LcastLogsSBoxNPCSpawn'
				},
				RagdollSpawn = { --A user spawned a ragdoll.
					Enabled = true,
					Color = 'FFB900',
					Webhook = {'default'},
					Title = 'Ragdoll Spawn',
					Hook = 'PlayerSpawnedRagdoll',
					Hookname = 'LcastLogsSBoxRagdollSpawn'
				},
				MetaData = 'sandbox'
			}
			
			LcastLogsRegisterCommands(Commands)
			print('[LcastLogs] Finished extended loading for sandbox.lua')
		end
	end
	hook.Add('OnGamemodeLoaded', 'LcastLogsSandboxHooksInit', SandboxLogs)
end