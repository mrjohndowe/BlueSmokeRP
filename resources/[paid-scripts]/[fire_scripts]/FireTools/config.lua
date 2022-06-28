main = {
    fanCommand = "fan",
    stabilisersCommand = "stabilisers",
    spreadersCommand = "spreaders",
    stabilisersModel = `prop_stabilisers`,
    fanModel = `prop_fan_fire`, -- prop_fan_fire
    spreadersModel = `prop_spreaders`,
    smokeRemovalRadius = 50.0,
    animDict = "weapons@heavy@minigun",
    animName = "idle_2_aim_right_med",
    boneId = 57005,
    delaySmokeRemoval = 20, -- delay smoke removal by 20 seconds
    fanSoundDistance = 30.0,
    spreadersSoundDistance = 25.0,
    spreadersSoundVolume = 0.2,
    fanSoundVolume = 0.2,
    commandFan = "fan",
    acePermissionsEnabled = false,
    offSet = {1.0, 0.4, 0.7},
    rotation = {0.0, 220.0, 200.0},
}

-- These are the job checks for all fire tool commands
jobCheck = {
    ESX = {
        enabled = false,
        checkJob = {
            enabled = true, -- Enable this to use ESX job check
            jobs = {"fire", "firefighter"} -- A user can have any of the following jobs, allowing you to add multiple
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
        enabled = false,
        checkJob = {
            enabled = false, -- Enable this to use QBCore job check
            jobs = {"ambulance"}, -- A user can have any of the following jobs, meaning you can add different jobs
        },
        checkPermission = {
            enabled = false, -- Enable this to use QBCore permission check
            permissions = {"god"}, -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
}


translations = {
    fanSuggestion = "Setup and use an extractor fan",
    fanHelp = "Setup or remove an extractor fan",
    stabilisersSuggestion = "Use stabilisers on the nearest vehicle",
    stabilisersHelp = "Setup or remove stabilisers on the nearest vehicle",
    spreadersSuggestion = "Get out and use hydraulic spreaders",
    fanRemoved = "~g~Success~w~: Fan removed",
    noFanFound = "~r~Error~w~: No fan found",
    fanSetup = "~g~Success~w~: Fan setup",
    noVehicleFound = "~r~Error~w~: No vehicle found",
    noStabilisersFound = "~r~Error~w~: No stabilisers found",
    outsideVehicle = "~r~Error~w~: You must not be inside a vehicle",
    stabilisersRemoved = "~g~Success~w~: Stabilisers removed",
    stabilisersSetupAlready = "~r~Error~w~: Stabilisers are already setup on this vehicle",
    vehicleNotFound = "Vehicle ~r~not found",
    vehicleDoorFound = "Vehicle ~g~door found",
    vehicleFound = "Vehicle ~b~found",
    setup = "setup",
    remove = "remove",
    stabilisersError = "~r~Error~w~: Use /stabilisers setup or /stabilisers remove",
    fanError = "~r~Error~w~: Use /fan setup or /fan remove",
    spreadersUsage = "Press ~b~ENTER ~w~to open or ~b~SPACE~w~ to break the vehicle door",
    stabilisersSetup = "~g~Success~w~: Stabilisers setup",
}