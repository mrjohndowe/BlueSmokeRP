Config = {

BlipSprite = 237,
BlipColor = 26,
BlipText = nil,

UseLimitSystem = false, -- Enable if your esx uses limit system

CraftingStopWithDistance = false, -- Crafting will stop when not near workbench

ExperiancePerCraft = 5, -- The amount of experiance added per craft (100 Experiance is 1 level)

HideWhenCantCraft = false, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job

Categories = {
	['legal_weapons'] = {
		Label = 'Legal Weapons',
		Image = 'legal_weapons',
		Jobs = {}
	},
	['illegal_weapons'] = {
		Label = 'Illegal Weapons',
		Image = 'illegal_weapons',
		Jobs = {}
	},
	['wood_work'] = {
		Label = 'Wood Working',
		Image = 'wood_work',
		Jobs = {}
	},
	['electronics'] = {
		Label = 'Electronics',
		Image = 'electronicskit',
		Jobs = {}
	},
	['tools'] = {
		Label = 'Tools',
		Image = 'hammer',
		Jobs = {}
	},
	['car_parts'] = {
		Label = 'Car Parts',
		Image = 'car_parts',
		Jobs = {'mechanic'}
	},
	['alcohol'] = {
		Label = 'Alcohol & Wine',
		Image = 'beer',
		Jobs = {}
	},
	['plastics'] = {
		Label = 'Plastics',
		Image = 'plastic',
		Jobs = {}
	},
	['police_equipment'] = {
		Label = 'Police Equipment',
		Image = 'police_equipment',
		Jobs = {'police'}
	},
	['fire_ems_equipment'] = {
		Label = 'Fire & EMS Equipment',
		Image = 'fire_ems_equipment',
		Jobs = {'ambulance','fire'}
	},
	

	-- ['misc'] = {
		-- Label = 'MISC',
		-- Image = 'fishingrod',
		-- Jobs = {}
	-- },
	-- ['weapons'] = {
		-- Label = 'WEAPONS',
		-- Image = 'WEAPON_APPISTOL',
		-- Jobs = {}
	-- },
	-- ['medical'] = {
		-- Label = 'MEDICAL',
		-- Image = 'bandage',
		-- Jobs = {}
	-- }


},

PermanentItems = { -- Items that dont get removed when crafting
	['wrench'] = true,
	['scissors'] = true,
	['hammer'] = true,
},

Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque
	['weapon_dagger'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rubber_handle'] = 1,
			['steel_blade'] = 1,
			['wood'] = 3
		}
	},
	['weapon_bat'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['wood'] = 3
		}
	},
	['weapon_bottle'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['glass'] = 3
		}
	},
	['weapon_crowbar'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['metalscrap'] = 3
		}
	},
	['weapon_flashlight'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['electronickit'] = 1,
			['metalscrap'] = 3
		}
	},
	['weapon_golfclub'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['steel'] = 1,
			['plastic'] = 3,
			['rubber'] = 3
		}
	},
	['weapon_hammer'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rubber_handle'] = 1,
			['hammer_head'] = 1
		}
	},
	['weapon_hatchet'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rubber_handle'] = 1,
			['hammer_head'] = 1
		}
	},
	['weapon_knuckle'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['steel'] = 5,
		}
	},
	['weapon_knife'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['metal_blade'] = 1,
			['rubber_handle'] = 1
		}
	},
	['weapon_matchete'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['metal_blade'] = 2,
			['rubber_handle'] = 1
		}
	},
	['weapon_switchblade'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['metal_blade'] = 1,
			['rubber_handle'] = 1
		}
	},
	['weapon_nightstick'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['iron'] = 1,
			['aluminum'] = 3
		}
	},
	['weapon_wrench'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['steel'] = 1
		}
	},
	['weapon_battleaxe'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['metal_blade'] = 1,
			['steel'] = 2,
			['rubber_handle'] = 1,
			['wood'] = 2
		}
	},
	['weapon_poolcue'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['wood'] = 2
		}
	},
	['weapon_briefcase'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['wood'] = 2,
			['plastic'] = 2
		}
	},
	['weapon_briefcase_02'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['wood'] = 2,
			['plastic'] = 2
		}
	},
	['weapon_garbagebag'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['plastic'] = 2
		}
	},
	['weapon_handcuffs'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = false,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['steel'] = 2,
			['aluminum'] = 2
		}
	},
	['weapon_pistol'] = {
		Level = 1,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_pistol_mk2'] = {
		Level = 2,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_combatpistol'] = {
		Level = 1,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_appistol'] = {
		Level = 1,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_stungun'] = {
		Level = 1,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['electronickit'] = 1,
			['electricitycables'] = 1,
			['plastic'] = 2
		}
	},
	['weapon_pistol50'] = {
		Level = 1,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_snspistol'] = {
		Level = 1,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_heavypistol'] = {
		Level = 1,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_vintagepistol'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_flaregun'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_marksmanpistol'] = {
		Level = 3,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_revolver'] = {
		Level = 1,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_revolver_mk2'] = {
		Level = 2,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_doubleaction'] = {
		Level = 2,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_snspistol_mk2'] = {
		Level = 2,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_ceramicpistol'] = {
		Level = 2,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_navyrevolver'] = {
		Level = 2,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_gadgetpistol'] = {
		Level = 2,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['pistol_handle'] = 1,
			['pistol_frame'] = 1,
			['pistol_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_microsmg'] = {
		Level = 3,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['smg_handle'] = 1,
			['smg_frame'] = 1,
			['smg_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_smg'] = {
		Level = 3,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['smg_handle'] = 1,
			['smg_frame'] = 1,
			['smg_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_smg_mk2'] = {
		Level = 3,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['smg_handle'] = 1,
			['smg_frame'] = 1,
			['smg_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_assaultsmg'] = {
		Level = 3,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['smg_handle'] = 1,
			['smg_frame'] = 1,
			['smg_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_combatpdw'] = {
		Level = 3,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['smg_handle'] = 1,
			['smg_frame'] = 1,
			['smg_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_machinepistol'] = {
		Level = 3,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['smg_handle'] = 1,
			['smg_frame'] = 1,
			['smg_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_minismg'] = {
		Level = 3,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['smg_handle'] = 1,
			['smg_frame'] = 1,
			['smg_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_pumpshotgun'] = {
		Level = 4,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['shotgun_handle'] = 1,
			['shotgun_frame'] = 1,
			['shotgun_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_sawnoffshotgun'] = {
		Level = 4,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['shotgun_handle'] = 1,
			['shotgun_frame'] = 1,
			['shotgun_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_assaultshotgun'] = {
		Level = 4,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['shotgun_handle'] = 1,
			['shotgun_frame'] = 1,
			['shotgun_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_bullpupshotgun'] = {
		Level = 4,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['shotgun_handle'] = 1,
			['shotgun_frame'] = 1,
			['shotgun_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_musket'] = {
		Level = 0,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['shotgun_frame'] = 1,
			['shotgun_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_heavyshotgun'] = {
		Level = 4,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['shotgun_handle'] = 1,
			['shotgun_frame'] = 1,
			['shotgun_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_dbshotgun'] = {
		Level = 4,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['shotgun_handle'] = 1,
			['shotgun_frame'] = 1,
			['shotgun_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_autoshotgun'] = {
		Level = 4,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['shotgun_handle'] = 1,
			['shotgun_frame'] = 1,
			['shotgun_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_pumpshotgun_mk2'] = {
		Level = 4,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['shotgun_handle'] = 1,
			['shotgun_frame'] = 1,
			['shotgun_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_combatshotgun'] = {
		Level = 4,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['shotgun_handle'] = 1,
			['shotgun_frame'] = 1,
			['shotgun_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_assaultrifle'] = {
		Level = 5,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['rifle_frame'] = 1,
			['rifle_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_assaultrifle_mk2'] = {
		Level = 5,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['rifle_frame'] = 1,
			['rifle_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_carbinerifle'] = {
		Level = 5,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['rifle_frame'] = 1,
			['rifle_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_carbinerifle_mk2'] = {
		Level = 5,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['rifle_frame'] = 1,
			['rifle_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_advancedrifle'] = {
		Level = 5,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['rifle_frame'] = 1,
			['rifle_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_specialcarbine'] = {
		Level = 5,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['rifle_frame'] = 1,
			['rifle_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_bullpuprifle'] = {
		Level = 5,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['rifle_frame'] = 1,
			['rifle_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_compactrifle'] = {
		Level = 5,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['rifle_frame'] = 1,
			['rifle_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_specialcarbine_mk2'] = {
		Level = 5,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['rifle_frame'] = 1,
			['rifle_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_bullpuprifle_mk2'] = {
		Level = 5,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['rifle_frame'] = 1,
			['rifle_barrel'] = 1,
			['trigger'] = 1
		}
	},
	['weapon_militaryrifle'] = {
		Level = 5,
		Category = 'legal_weapons',
		isGun = true,
		Jobs = {},
		JobGrades = {},
		Amount = 1,
		SuccessRate = 100,
		Time = 10,
		Ingredients = {
			['rifle_stock'] = 1,
			['rifle_frame'] = 1,
			['rifle_barrel'] = 1,
			['trigger'] = 1
		}
	},
	
	
	
	
-- ['bandage'] = {
	-- Level = 0, -- From what level this item will be craftable
	-- Category = 'medical', -- The category item will be put in
	-- isGun = false, -- Specify if this is a gun so it will be added to the loadout
	-- Jobs = {'ambulance'}, -- What jobs can craft this item, leaving {} allows any job
	-- JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	-- Amount = 2, -- The amount that will be crafted
	-- SuccessRate = 100, -- 100% you will recieve the item
	-- requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	-- Time = 10, -- Time in seconds it takes to craft this item
	-- Ingredients = { -- Ingredients needed to craft this item
		-- ['clothe'] = 2, -- item name and count, adding items that dont exist in database will crash the script
		-- ['wood'] = 1
	-- }
-- }, 

-- ['WEAPON_APPISTOL'] = {
	-- Level = 2, -- From what level this item will be craftable
	-- Category = 'weapons', -- The category item will be put in
	-- isGun = true, -- Specify if this is a gun so it will be added to the loadout
	-- Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	-- JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	-- Amount = 1, -- The amount that will be crafted
	-- SuccessRate = 100, --  100% you will recieve the item
	-- requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	-- Time = 20, -- Time in seconds it takes to craft this item
	-- Ingredients = { -- Ingredients needed to craft this item
		-- ['copper'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		-- ['wood'] = 3,
		-- ['iron'] = 5
	-- }
-- }, 

-- ['fishingrod'] = {
	-- Level = 0, -- From what level this item will be craftable
	-- Category = 'misc', -- The category item will be put in
	-- isGun = false, -- Specify if this is a gun so it will be added to the loadout
	-- Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	-- JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	-- Amount = 3, -- The amount that will be crafted
	-- SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	-- requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	-- Time = 20, -- Time in seconds it takes to craft this item
	-- Ingredients = { -- Ingredients needed to craft this item
		-- ['wood'] = 3 -- item name and count, adding items that dont exist in database will crash the script
		
	-- }
},


--{coords = vector3(101.26113891602,6615.810546875,33.58126831054), jobs = {}, blip = true, recipes = {}, radius = 3.0 },
Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access

		{coords = vector3(1117.3, -1998.06, 35.52), jobs = {}, blip = true, BlipText = 'Legal Weapons', recipes = {}, radius = 3.0 } --Legal Weapons
},
 

Text = {

    ['not_enough_ingredients'] = 'You dont have enough ingredients',
    ['you_cant_hold_item'] = 'You cant hold the item',
    ['item_crafted'] = 'Item crafted!',
    ['wrong_job'] = 'You cant open this workbench',
    ['workbench_hologram'] = '[~b~E~w~] Workbench',
    ['wrong_usage'] = 'Wrong usage of command',
    ['inv_limit_exceed'] = 'Inventory limit exceeded! Clean up before you lose more',
    ['crafting_failed'] = 'You failed to craft the item!'

}

}



function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
