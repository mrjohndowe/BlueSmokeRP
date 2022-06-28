main = {
    acePermissionsEnabled = false,
    jackCommandName = "jack",
    chockCommandName = "chock",
}

-- These are the job checks for the /jack and /chock commands
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

-- These allow you to translate the resource into another language
translations = {
    usingJack = "~r~Error~w~: You are currently using a jack. Press ENTER to stop.",
    nowControlling = "~g~Success~w~: You're now controlling the inflatable jack",
    jackInUse = "~r~Error~w~: This inflatable jack is in use",
    jackSetup = "~g~Success~w~: Inflatable jack setup",
    jackRemoved = "~g~Success~w~: Inflatable jack removed",
    noJackFound = "~r~Error~w~: No inflatable jack found",
    noVehicleFound = "~r~Error~w~: No vehicle found",
    chocksSetupAlready = "~r~Error~w~: This vehicle already has chocks setup",
    chocksSetup = "~g~Success~w~: Car chocks setup",
    chocksRemoved = "~g~Success~w~: Car chocks removed",
    noChocksFound = "~r~Error~w~: No car chocks found",
    adjustHeight = "Use ~INPUT_CELLPHONE_UP~ and ~INPUT_CELLPHONE_DOWN~ to adjust the height",
    adjustHeight2 = "~g~Success~w~: Use ARROW UP and ARROW DOWN to adjust the height. Press ENTER when done",
    stoppedControlling = "~g~Success~w~: You've stopped controlling the inflatable jack",
    setup = "setup",
    remove = "remove",
    jackCommandError = "~r~Error~w~: Use /jack setup or /jack remove",
    chockCommandError = "~r~Error~w~: Use /chock setup or /chock remove",
}