config = {

    -- Distance to load the bike stations in from
    loadDistance = 200.0,

    accessMachineDistance = 3,

    -- The distance between docks in metres
    distanceBetweenDocks = 2.0,

    useMachineKey = {0, 191},

    -- Key to return the bikes at the end of the rent
    returnBikeKey = {0, 38},


    -- Length of cooldown in seconds
    cooldownLength = 300,

    -- If a dock is empty for this long, it will automatically recreate a new bike (minute)
    replenishAfter = 10,

    models = {
        dock = `prop_bike_dock`,
        machine = `prop_cycle_terminal`,
        bike = `cruiser`,
    },

    -- Blip settings
    blipName = "Available Bikes: ", -- This shows how many bikes available at each dock
    blip = 226,
    blipShortRange = true,
    blipScale = 1.0,
    blipColour = 3,
    blipDisplay = 4,

    locations = {
        {
            -- The coordinates of the base unit (the item which the user interacts with to hire a bike)
            machineCoordinates = vector3(168.95793151855, -784.54144287109, 30.56356048584),
            -- The heading of the base unit
            machineHeading = 251.42901611328,
            -- The direction which the bike docks should be relative to the dock (left/right only)
            direction = "left",
            -- The number of docks at this particular station
            numberOfDocks = 5,
            -- Show blip on the map with how many bikes are available at this location
            showBlip = true,
        },
        {
            machineCoordinates = vector3(242.13397216797, -346.09448242188, 43.409996032715),
            machineHeading = 159.78268432617,
            direction = "left",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(411.02230834961, -665.95678710938, 28.291353225708),
            machineHeading = 0.26029822230339,
            direction = "left",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(-119.98204040527, -1168.7772216797, 24.893106460571),
            machineHeading = 266.04260253906,
            direction = "left",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(-326.59655761719, -865.53662109375, 30.628652572632),
            machineHeading = 353.15005493164,
            direction = "left",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(-818.43664550781, -1052.1641845703, 11.864109992981),
            machineHeading = 300.60357666016,
            direction = "left",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(-73.736305236816, -529.67749023438, 39.279010772705),
            machineHeading = 251.19369506836,
            direction = "left",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(251.06269836426, -244.3404083252, 52.98477935791),
            machineHeading = 337.75366210938,
            direction = "right",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(-689.74859619141, -375.50100708008, 33.229339599609),
            machineHeading = 339.1867980957,
            direction = "right",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(-1554.4866943359, -481.42150878906, 34.491672515869),
            machineHeading = 212.60423278809,
            direction = "left",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(225.43746948242, -1115.1977539063, 28.296672821045),
            machineHeading = 88.559883117676,
            direction = "right",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(382.13781738281, -1930.1628417969, 23.614547729492),
            machineHeading = 139.35487365723,
            direction = "left",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(681.25671386719, 34.377376556396, 83.271408081055),
            machineHeading = 149.18962097168,
            direction = "right",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(-200.51875305176, -542.96966552734, 33.705699920654),
            machineHeading = 69.80842590332,
            direction = "left",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(-530.71240234375, 279.20489501953, 82.022033691406),
            machineHeading = 84.700218200684,
            direction = "right",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(-1326.4405517578, -1345.0222167969, 3.5712778568268),
            machineHeading = 110.19537353516,
            direction = "left",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(-718.60034179688, 5822.8823242188, 16.203252792358),
            machineHeading = 345.77526855469,
            direction = "left",
            numberOfDocks = 4,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(-293.24383544922, 6253.521484375, 30.451107025146),
            machineHeading = 224.58767700195,
            direction = "right",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(1663.6527099609, 4834.3168945313, 41.124794006348),
            machineHeading = 277.77670288086,
            direction = "right",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(397.98718261719, 3589.5922851563, 32.293865203857),
            machineHeading = 175.87217712402,
            direction = "right",
            numberOfDocks = 5,
            showBlip = true,
        },
        {
            machineCoordinates = vector3(1128.7219238281, 2675.2312011719, 37.326286315918),
            machineHeading = 357.09091186523,
            direction = "right",
            numberOfDocks = 5,
            showBlip = true,
        }
    },

    translations = {
        press = "Press",
        machineKey = "INPUT_FRONTEND_RDOWN",
        returnKey = "INPUT_PICKUP",
        toHire = "to hire a bike",
        toReturn = "to return this bike",
        noFree = "~y~Alert~w~: There are no free docks to return this vehicle.",
        noneLeft = "~y~Alert~w~: There are no bikes left.the",
        bikeHired = "~g~Success~w~: You've hired a bike, it is unlocked and you can start using it.",
        bikeReturned = "~g~Success~w~: You've returned the bike, thanks.",
        cooldown = "~y~Alert~w~: You must wait before hiring another bike.",
        insufficientFunds = "~y~Alert~w~: You have insufficient funds.",
        onCooldown = "Cannot rent bike currently."

    },

    -- The amount to rent a bike, charged per cycle
    costToRent = 100,

    -- Choose the framework to use for paying for bikes
    -- Alternatively, you can add your own code snippet in sv_utils.lua
    framework = {
        usevRP = false,
        useESX = false,
        useQBcore = true,
    }

}