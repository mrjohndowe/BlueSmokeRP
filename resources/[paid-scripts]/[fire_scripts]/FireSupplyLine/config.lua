main = {
    commandName = "supplyline",
    supplyProp = `prop_supplyline`,
    defaultSeconds = 120, -- Before they need to connect to a supply line
    enableAcePermissions = false, -- Enable ace permissions for the supply line command
    supplyLineDistance = 10.0, -- To connect initially
    maximumDistance = 200.0, -- Furthest distance you can get away from a vehicle with a supply line
    connectToSupplyLineKey = {0, 191},
    helpKey = "INPUT_FRONTEND_RDOWN",
}

-- These are the job checks for the /supplyline command and also the ability to toggle on/off the tents
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
        enabled = true,
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
    setup = "setup",
    remove = "remove",
    supplyLineError = "~r~Error~w~: Use /supplyline setup or /supplyline remove",
    outsideVehicle = "~r~Error~w~: You must not be inside a vehicle",
    noVehicleFound = "~r~Error~w~: No vehicle found",
    supplyLineSetupAlready = "~r~Error~w~: A supply line is already setup on this vehicle",
    supplyLineSetup = "~g~Success~w~: Supply line setup",
    invalidVehicle = "~r~Error~w~: You cannot setup a supply line on this vehicle",
    supplyLineRemoved = "~g~Success~w~: Supply line removed",
    noSupplyLineFound = "~g~Success~w~: No supply line found",
    commandSuggestion = "Setup or remove a hose supply line",
    help = "Setup or remove a supply line",
    supplyLineConnected = "~g~Success~w~: You are now connected to this vehicle",
    supplyLineDisconnected = "~r~Notice~w~: You have now been disconnected from the supply line",
    limitedSupply = "~g~Success~w~: You now have a limited supply of water from the nearest vehicle",
    noSupply = "~r~Notice~w~: You have no active supply of water",
    supplyLine = "~b~Supply Line~w~: ",
    alreadySupplied = "~r~Notice~w~: This vehicle has already supplied you with water, setup a supply line for more",
    press = "Press ",
    toConnect = "to connect to this vehicle",
    oneHundred = "100",
}

vehicles = {
    {
        model = `enforcer`,
        bone = "",
        offSet = {2.0, -18.0, -1.2},
        rotation = {0.0, 0.0, 180.0},
    },
}