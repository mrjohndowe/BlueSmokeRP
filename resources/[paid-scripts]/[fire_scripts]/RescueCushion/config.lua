main = {
    commandName = "rescuecushion",
    enableAcePermissions = false,
    cushionModel = `prop_rescue_cushion`,
    ragdollDuration = 10, -- Duration in seconds to ragdoll the player
    cooldownDuration = 60, -- Duration in seconds before the player can jump onto a rescue cushion again (recommended 60 seconds)
    -- The cooldownDuration is there to prevent these being abused, mainly on public servers.
    removeDistance = 15.0,
    setupOffset = {0.0, 4.5, 0.0},
}

-- These are the job checks for the /rescuecushion command
jobCheck = {
    ESX = {
        enabled = false,
        checkJob = {
            enabled = true, -- Enable this to use ESX job check
            jobs = {"fire"} -- A user can have any of the following jobs, allowing you to add multiple
        }
    },
    -- We've added vRP integration. All you need to do is enable it below. Then, configure if you wish to check for groups or permissions, or even both
    vRP = {
        enabled = false,
        checkGroup = {
            enabled = false, -- Enable this to use vRP group check
            groups = {"fire", "admin"}, -- A user can have any of the following groups, meaning you can add different jobs
        },
        checkPermission = {
            enabled = false, -- Enable this to use vRP permission check
            permissions = {"player.kick"} -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
    -- We've added QBCore integration. All you need to do is enable it below. Then, configure if you wish to check for jobs or permissions, or even both
    QBCore = {
        enabled = true,
        checkJob = {
            enabled = true, -- Enable this to use QBCore job check
            jobs = {"fire","police","ambulance"}, -- A user can have any of the following jobs, meaning you can add different jobs
        },
        checkPermission = {
            enabled = false, -- Enable this to use QBCore permission check
            permissions = {"god"}, -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
}


translations = {
    setup = "setup",
    remove = "remove",
    commandError = "~r~Error~w~: Use /rescuecushion setup or /rescuecushion remove",
    outsideVehicle = "~r~Error~w~: You must not be inside a vehicle",
    commandSuggestion = "Setup or remove a fire rescue cushion",
    commandHelp = "Setup or remove",
    cushionSetup = "~g~Success~w~: Rescue cushion setup",
    cushionRemoved = "~g~Success~w~: Rescue cushion removed",
    noCushionFound = "~r~Error~w~: No rescue cushion found",
}