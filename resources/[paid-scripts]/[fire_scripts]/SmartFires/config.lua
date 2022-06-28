-- Please read our documentation before configuring
-- https://docs.londonstudios.net/
-- If you are still having issues, contact us

-- Discord link: https://discord.gg/AtPt9ND

main = {
    fireSpawnDistance = 200.0, -- This is the distance the player must be within to a fire to spawn in (for performance)
    smokeSpawnDistance = 500.0,-- This is the distance the player must be within to smoke to spawn in (for performance)
    usingHoseLS = true, -- Also enable this if you are using SmartHose or another hose system that works similar.
    distanceToSpawnFiresInFront = 4.0, -- Distance to spawn fires in front (to avoid player being damaged initially)
    maxWidthOfFiresMultipler = 1.2, -- Max width of fires. E.g, a 15 flame fire would have a maximum width of 22.5m (rounded to nearest integer)
    maximumFinalWidth = 20.0, -- This is the maximum width, incase the multiplier leads the maximum to be too big
    foam = {
        enabled = true,-- This will enable foam mode, allowing you to use /foam to spray foam through the hose (particles are the same, but fires will respond differently)
        -- Foam mode can only be enabled if you are using Hose LS above
    },
    minimumSizeToExtinguish = 0.5, -- This is the minimum size a fire can be whilst being put out before the script removes it completely

    useMythicNotify = false,

    distanceToExtinguish = 8.0,

    -- This section allows you to setup spreadable fires
    spreadableFires = {
        automaticFires = true, -- This will allow automatic fires to spread
        manualFires = true, -- This will set whether manual fires will spread by default (unless disabled manually when running the command)
        spreadTimer = 240, -- Fires will spread every 4 minutes (240 seconds)
        spreadDistance = 5.0, -- Distance fires can spread
    },

    automaticFires = {
        enabled = true,
        toggledOnInitially = true,
        enableLocationCommand = {
            enabled = true, -- The command will give you your current location to insert here, if enabled
            commandName = "mylocation",
            locationColour = "~b~", -- blue
        },
        -- This will enable the area of patrol settings, allowing you to choose an area of patrol where automatic fires will spawn, live in game
        -- If this setting is not enabled, you can still categorise coordinates and the script will just pick a random one out of any category
        enableAreaOfPatrolSettings = {
            enabled = false,
            defaultAreaOfPatrol = "city",
            setAreaOfPatrolCommand = {
                enabled = true,
                commandName = "setfiresaop",
                acePermissions = {
                    enabled = false,
                    -- This enables ace permissions on the toggle automatic fires command
                },
                -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
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
            },
        },
        -- Use lowercase for location categories
        locations = {
            ["city"] = {
                { coords = vector3(387.44, -832.87, 28.29), description = "Shop", type = "normal", size = 1.0, numberOfFlames = 3 }, -- If type and size is not defined, random will be picked
                { coords = vector3(297.92, -588.88, 42.82), description = "Hospital", numberOfFlames = 2 },
                { coords = vector3(312.11, -274.83, 53.45), description = "Bank", numberOfFlames = 4 },
                { coords = vector3(128.41, -214.85, 53.45), description = "Clothing Shop", numberOfFlames = 5 },
                { coords = vector3(-838.14, -354.27, 37.03), description = "Commercial Building", numberOfFlames = 2 },
                { coords = vector3(-203.76, -1115.88, 21.82), description = "Construction Site", numberOfFlames = 4 },
                { coords = vector3(754.81, -791.31, 25.23), description = "Junkyard", numberOfFlames = 1 },
                { coords = vector3(-8.9, -1565.02, 28.29), description = "Bin", numberOfFlames = 3 },
                { coords = vector3(20.16, -1505.84, 30.85), description = "Church", numberOfFlames = 2 },
                { coords = vector3(94.01, -1975.87, 19.61), description = "Car", numberOfFlames = 5 },
                { coords = vector3(-1149.11, -1999.84, 12.18), description = "Car Repair", numberOfFlames = 4 },
                { coords = vector3(-821.33, -1073.0, 10.33), description = "Clothing Shop", numberOfFlames = 6 },
                { coords = vector3(-603.48, -926.31, 22.87), description = "Weazel New", numberOfFlames = 2 },
                { coords = vector3(-1077.74, -242.57, 36.76), description = "LifeInvader", numberOfFlames = 5 },
                { coords = vector3(39.09, -625.93, 30.63), description = "Construction Zone", numberOfFlames = 4 },
                { coords = vector3(156.09, -906.75, 28.82), description = "Bin", numberOfFlames = 6 },
                { coords = vector3(264.11, -341.45, 44.02), description = "Trees", numberOfFlames = 5 },
                { coords = vector3(251.16, -49.64, 68.94), description = "Ammunation", numberOfFlames = 8 },
                { coords = vector3(314.85, 191.96, 103.06), description = "Theatre", numberOfFlames = 2 },
                { coords = vector3(-456.21, -352.12, 33.48), description = "Medical Center", numberOfFlames = 6 },
                { coords = vector3(-829.64, -106.33, 27.19), description = "Subway", numberOfFlames = 3 },
                { coords = vector3(-56.08, -1098.38, 25.43), description = "Cardealer", numberOfFlames = 2 },
                { coords = vector3(434.95, -641.97, 27.73), description = "Bus station", numberOfFlames = 2 },
                { coords = vector3(-51.1, -1663.23, 28.28), description = "Bin", numberOfFlames = 3 },
                { coords = vector3(-214.2, -1031.94, 29.14), description = "Subway", numberOfFlames = 4 },
                { coords = vector3(931.0, 37.32, 80.1), description = "Casino", numberOfFlames = 3 },
                { coords = vector3(903.31, -172.14, 73.07), description = "Taxi Station", numberOfFlames = 5 },
                { coords = vector3(826.69, -1026.24, 25.61), description = "Tank Station", numberOfFlames = 2 },
                { coords = vector3(489.74, -1320.82, 28.17), description = "Impound", numberOfFlames = 4 },
                { coords = vector3(339.91, -1401.18, 31.51), description = "Medical Center", numberOfFlames = 3 },
                { coords = vector3(163.29, -1477.54, 28.14), description = "Bin", numberOfFlames = 5 },
            },
            ["sandy"] = {
                -- Follow our documentation on adding locations and categories
                -- By default, we've only added some locations for the City
            },
        },
        fireTypesToSpawn = { -- Chance set out of 1
        -- To set the minimum and maximum automatic fire sizes, see each fire type individually
        -- The fire types listed here must all be valid fire types configured in the fireTypes section.
            { type = "normal", chance = 0.6},
            { type = "chemical", chance = 0.2},
            { type = "normal2", chance = 0.4},
            { type = "normal3", chance = 0.5},
            { type = "bonfire", chance = 0.1},
            { type = "electrical", chance = 0.2},
        },

        -- Below you can set the script to spawn in relation to the number of players currently on a certain job, e.g, firefighters
        -- If you aren't using a job check and just want fires to spawn randomly, ignore the job check section and just configure "frequencyOfFires" and "removeFiresAutomatically"
        -- Only enable one of the frameworks below if you want to spawn fires in relation to the number of players on a certain job
        main = {
            QBCore = { -- This enables the job check for QBCore
                enabled = true,
                jobs = {"ambulance", "firefighter"},
            },
            ESX = {  -- This enables the job check for ESX
                enabled = false,
                jobs = {"fire", "firefighter"},
            },
            vRP = {   -- This enables the job check for vRP
                enabled = false,
                groups = {"fire", "firefighter"},
                permissions = {}, -- Leave blank if you do not want to use permissions to spawn fires
            },
            -- This command is designed for standalone servers who still want to use automatic fires and spawn them according to the number of clocked on users
            clockOnSystem = {
                enabled = true,
                clockOnCommand = {
                    enabled = true, -- Disable this command if you are using a menu to trigger an event/export to clock people on instead
                    commandName = "clockfireon",
                    acePermissions = {
                        enabled = false,
                        -- This enables ace permissions on the clock on command
                    },
                },
                -- We do not need permission on the clock off command, as we have already checked it for them to clock on
                clockOffCommand = {
                    enabled = true,  -- Disable this command if you are using a menu to trigger an event/export to clock people off instead
                    commandName = "clockfireoff",
                },
            },
            startFiresWithLessThanMinimum = true, -- This determines whether fires should start below the minimum number of players per fire below
            playersPerFire = 3, -- This means that for every 3 players (or below) part of that group/job, we will spawn one fire (ignore this if you aren't using automatic fires)
            frequencyOfFires = 540, -- Fires will spawn every 540 seconds (9 minutes)
            removeFiresAutomatically = {
                enabled = true,
                timer = 900, -- 15 minutes will lead to the automatic removal of a fire if it is not extinguished already
            },
        },

        blips = {
            enabled = true,
            sprite = 436,
            colour = 49,
            scale = 1.0,
            shortRange = false,
            routeEnabled = true, -- This sets up a route on the map to the blip
            routeColour = 49,
        },
        
        -- These will be sent to players using jobs specified above (if you've enabled either ESX, vRP or QBCore above)
        -- Please note though, if you have not set the above up, it will be sent to all players
        -- Enable this if you aren't using any other alert system, such as our integrtation with the Inferno Pager system.
        inGameAlerts = {
            notification = true,
            sound = { -- https://wiki.rage.mp/index.php?title=Sounds (titles are the audio ref)
                enabled = true,
                soundName = "CONFIRM_BEEP",
                soundSet = "HUD_MINI_GAME_SOUNDSET",
            }
        },

        cdDispatch = {
            enabled = false,
            jobs = {'ambulance'},
            title = 'New Fire',
        },

        -- This allows integration with the Inferno Pager resource
        infernoPager = {
            enabled = true,
            pagersToTrigger = {"fire"}, -- These are the pagers to trigger
        },

        toggleAutomaticFiresCommand = {
            enabled = true,
            commandName = "toggleautofires",
            acePermissions = {
                enabled = false,
                -- This enables ace permissions on the toggle automatic fires command
            },
            -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
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
        },

        triggerAutomaticFireCommand = {
            enabled = true,
            commandName = "triggerautofire",
            acePermissions = {
                enabled = false,
                -- This enables ace permissions on the trigger automatic fires command
            },
            -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
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
        },
    },

    startFireCommand = {
        enabled = true,
        commandName = "startfire",
        acePermissions = {
            enabled = false,
            -- This enables ace permissions on the start fire command
        },
        -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
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
        enableMultipleFlames = true,
    },

    -- This allows you to enable Discord logging for the fires and smokes
    -- You must add your webhook in sv_utils.lua
    logging = {
        enabled = true,
        displayName = "Smart Fires",
        colour = 31487,
        title = "**New Log**",
        icon = "https://i.imgur.com/n3n7JNW.png",
        footerIcon = "https://i.imgur.com/n3n7JNW.png",
        dateFormat = "%d-%m-%Y %H:%M:%S", -- Day-Month-Year Hour-Minute-Second
    },



    -- The stop fire command can be run without any arguments, this will stop the closest fire.
    -- Alternatively, it takes an argument of a distance, eg, 4.0
    stopFireCommand = {
        enabled = true,
        commandName = "stopfire",
        maxNearestDistance = 150.0, -- If no argument is given for radius, this is the maximum distance the "nearest fire" can be
        maxSpecifiedRadius = 150.0, -- This is the maximum radius that can be specified to put fires out within nearby
        acePermissions = {
            enabled = false,
            -- This enables ace permissions on the stop fire command
        },
        -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
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
    },



    -- This command stops all fires
    stopAllFiresCommand = {
        enabled = true,
        commandName = "stopallfires",
        acePermissions = {
            enabled = false,
            -- This enables ace permissions on the stop fire command
        },
        -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
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
    },

    -- This command starts smoke manually
    startSmokeCommand = {
        enabled = true,
        commandName = "startsmoke",
        acePermissions = {
            enabled = false,
            -- This enables ace permissions on the start smoke command
        },
        -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
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
    },



    -- The stop smoke command can be run without any arguments, this will stop the closest smoke.
    -- Alternatively, it takes an argument of a distance, eg, 4.0
    stopSmokeCommand = {
        enabled = true,
        commandName = "stopsmoke",
        maxNearestDistance = 150.0, -- If no argument is given for radius, this is the maximum distance the "nearest smoke" can be
        maxSpecifiedRadius = 150.0, -- This is the maximum radius that can be specified to put smokes out within nearby
        acePermissions = {
            enabled = false,
            -- This enables ace permissions on the stop smoke command
        },
        -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
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
    },



    -- This command stops all smoke
    stopAllSmokeCommand = {
        enabled = true,
        commandName = "stopallsmoke",
        acePermissions = {
            enabled = false,
            -- This enables ace permissions on the stop smoke command
        },
        -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
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
    },
}

-- This configures the weapons used to put out either fires requiring water, or those requiring an extinguisher
weapons = {
    water = {
        model = `weapon_hose`, -- If you are using HoseLS, we do not recommend changing this
        name = "Hose",
        reduceBy = 0.65, -- This is how powerful it is, lower the number the better
        increaseBy = 1.3, --  This is how powerful it is against the wrong fire type, higher the number the more powerful
    },
    extinguisher = {
        model = `weapon_fireextinguisher`,
        name = "Fire Extinguisher",
        reduceBy = 0.76,  -- This is how powerful it is, lower the number the better
        increaseBy = 1.6, --  This is how powerful it is against the wrong fire type, higher the number the more powerful
    },
    foam = { -- This will only work if you are using HoseLS and have foam mode enabled in the main config section
        name = "Foam",
        reduceBy = 0.86,   -- This is how powerful it is, lower the number the better
        increaseBy = 1.3,  --  This is how powerful it is against the wrong fire type, higher the number the more powerful
    },
    waterMonitor = { -- This will only work if you have our Water Monitor resource
        name = "Water Monitor",
        reduceBy = 0.87,   -- This is how powerful it is, lower the number the better
        increaseBy = 1.3,  --  This is how powerful it is against the wrong fire type, higher the number the more powerful
    },
    deckGun = {
        name = "Deck Gun",
        reduceBy = 0.65,
        increaseBy = 1.3,
    },
}


-- Here you can translate all elements of the resource into another language
translations = {
    foamCommandName = "foam",
    foamCommandHelpText = "Toggle foam mode on your fire hose",
    startFireCommandHelpText = "Start a fire with a defined type and size",
    startFireParameterType = "Fire Type",
    startFireParameterSize = "Fire Size",
    startFireParameterSizeHelp = "Eg, 4.0",
    startFireCommandTypeSeparator = ", ",
    startSmokeCommandTypeSeparator = ", ",
    invalidFireTypeError = "~r~Error~w~: You must select a valid fire type.",
    invalidFireTypeAndSizeError = "~r~Error~w~: You must select a valid fire type and size.",
    invalidFireSizeError = "~r~Error~w~: You must select a valid fire size.",
    fireSizeAboveMaximumError = "~r~Error~w~: You have exceeded the maximum fire size for this type.",
    fireSizeBelowMinimumError = "~r~Error~w~: The fire size is below the minimum for this type.",
    stopFireCommandHelpText = "Stop the nearest fire or within a radius",
    stopFireCommandParameterName = "Radius",
    stopFireCommandParameterHelp = "Eg, 4.0 (optional)",
    noNearbyFireFound = "~r~Error~w~: No nearby fire found to stop",
    noNearbyFiresFoundInRadius = "~r~Error~w~: No nearby fires found to stop within the specified radius",
    specifiedRadiusTooLarge = "~r~Error~w~: No nearby fires found to stop within the specified radius",
    stopped = "~g~Success~w~: Stopped",
    fire = "fire.",
    fires = "fires.",
    smoke = "smoke.",
    smokes = "smokes.",
    nearbyFireStopped = "~g~Success~w~: The closest fire has been stopped.",
    stopAllFiresCommandHelpText = "Stop all fires",
    allFiresStopped = "~g~Success~w~: All fires have been stopped.",
    noFiresFound = "~r~Error~w~: No fires found to stop",
    invalidSmokeTypeAndSizeError = "~r~Error~w~: You must select a valid smoke type and size.",
    invalidSmokeTypeError = "~r~Error~w~: You must select a valid smoke type.",
    invalidSmokeSizeError = "~r~Error~w~: You must select a valid smoke size.",
    smokeSizeAboveMaximumError = "~r~Error~w~: You have exceeded the maximum smoke size for this type.",
    smokeSizeBelowMinimumError = "~r~Error~w~: The smoke size is below the minimum for this type.",
    startSmokeCommandHelpText = "Start smoke with a defined type and size",
    startSmokeParameterType = "Smoke Type",
    startSmokeParameterSize = "Smoke Size",
    startSmokeParameterSizeHelp = "Eg, 4.0",
    specifiedRadiusTooLargeSmoke = "~r~Error~w~: No nearby smoke found to stop within the specified radius",
    noNearbySmokeFoundInRadius = "~r~Error~w~: No nearby smoke found to stop within the specified radius",
    noNearbySmokeFound = "~r~Error~w~: No nearby smoke found to stop",
    nearbySmokeStopped = "~g~Success~w~: The closest smoke has been stopped.",
    stopSmokeCommandHelpText = "Stop the nearest smoke or within a radius",
    stopSmokeCommandParameterName = "Radius",
    stopSmokeCommandParameterHelp = "Eg, 4.0 (optional)",
    allSmokeStopped = "~g~Success~w~: All smoke has been stopped.",
    noSmokeFound = "~r~Error~w~: No smoke found to stop",
    stopAllSmokeCommandHelpText = "Stop all smoke",
    numberOfFlames = "Number of flames",
    numberOfFlamesParameterHelp = "Eg, 4",
    numberOfFlamesTooLargeError = "~r~Error~w~: Number of flames exceeds the maximum allowed.",
    multiFlamesNotAllowedFireType = "~r~Error~w~: Multiple flames are not allowed for this fire type.",
    numberOfFlamesTooLargeFireType = "~r~Error~w~: Number of flames exceeds the maximum allowed for this fire type.",
    foamModeDisabled = "Foam mode is now ~r~disabled~w~.",
    foamModeEnabled = "Foam mode is now ~g~enabled~w~.",
    allFiresStoppedManually = "All Fires Stopped Manually",
    streetName = "Street Name: ",
    smokeStoppedManually = "Smoke Stopped Manually",
    type = "Type: ",
    fireExtinguished = "Fire Extinguished",
    weapon = "Weapon: ",
    fireType = ", Fire Type: ",
    initialSize = ", Initial Size: ",
    multiFlameFireStartedManually = "Fire Started Manually (Multi Flame)",
    size = ", Size: ",
    fireStartedManually = "Fire Started Manually",
    smokeStartedManually = "Smoke Started Manually",
    fireStoppedManually = "Fire Stopped Manually",
    id = ", ID: ",
    radiusSpecified = ", Radius Specified: ",
    firesStopped = ", Fires Stopped: ",
    allSmokeStoppedManually = "All Smoke Stopped Manually",
    numberOfFlames2 = "Number of flames: ",
    fireDescription = "Fire",
    fireAlert ="~r~Alert~w~: New", -- additional information is added after this notification
    toggleFireCommandHelp = "Toggle automatic fires",
    automaticFiresEnabled ="~r~Alert~w~: Automatic fires enabled",
    automaticFiresDisabled ="~r~Alert~w~: Automatic fires disabled",
    automaticFiresEnabledLog = "Toggled automatic fires on",
    automaticFiresDisabledLog = "Toggled automatic fires off",
    triggerAutomaticFireHelp = "Trigger an automatic fire immediately",
    triggeredAnAutomaticFire = "Triggered an automatic fire",
    noPermission = "~r~Error~w~: You do not have permission to access this command.",
    postal = "Postal",
    automaticFireCreated = "Automatic Fire Created",
    idAutomatic = "ID: ",
    typeAutomatic = ", Type: ",
    waterMonitorFireExtinguished = "Water Monitor - Fire Extinguished",
    descriptionAutomatic = ", Description: ",
    areaOfPatrolUpdated = "~b~Success~w~: Area of patrol updated to ",
    invalidAreaOfPatrol = "~r~Error~w~: The area of patrol selected is invalid.",
    updatedAreaOfPatrolTo = "Updated area of patrol to ",
    nowClockedOff = "~b~Success~w~: You are now clocked off.",
    nowClockedOn = "~b~Success~w~: You are now clocked on.",
    alreadyClockedOff = "~r~Error~w~: You are already clocked off.",
    alreadyClockedOn = "~r~Error~w~: You are already clocked on.",
    clockedOffLog = "User clocked off",
    clockedOnLog = "User clocked on",
    clockOnSuggestion = "Clock on for fires",
    clockOffSuggestion = "Clock off for fires",
    spreadable = "Spreadable",
    spreadableHelp = "true/false",
}

smokeTypes = {
    ["normal"] = {
        dict = "scr_agencyheistb",
        name = "scr_env_agency3b_smoke",
        maximumSizeManual = 20.0,
        minimumSizeManual = 1.0,
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
    },
    ["electrical"] = {
        dict = "core",
        name = "ent_amb_elec_crackle",
        maximumSizeManual = 20.0,
        minimumSizeManual = 1.0,
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
    },
    ["normal2"] = {
        dict = "core",
        name = "ent_amb_smoke_foundry",
        maximumSizeManual = 20.0,
        minimumSizeManual = 1.0,
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
    },
    ["foggy"] = {
        dict = "core",
        name = "ent_amb_fbi_smoke_fogball",
        maximumSizeManual = 20.0,
        minimumSizeManual = 1.0,
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
    },
    ["normal3"] = {
        dict = "core",
        name = "ent_amb_stoner_vent_smoke",
        maximumSizeManual = 20.0,
        minimumSizeManual = 1.0,
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
    },
    ["normal4"] = {
        dict = "core",
        name = "ent_amb_smoke_general",
        maximumSizeManual = 20.0,
        minimumSizeManual = 1.0,
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
    },
    ["normal5"] = {
        dict = "core",
        name = "proj_grenade_smoke",
        maximumSizeManual = 20.0,
        minimumSizeManual = 1.0,
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
    },
    ["normal6"] = {
        dict = "core",
        name = "ent_amb_generator_smoke",
        maximumSizeManual = 20.0,
        minimumSizeManual = 1.0,
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
    },
    ["white"] = {
        dict = "core",
        name = "ent_amb_smoke_factory_white",
        maximumSizeManual = 20.0,
        minimumSizeManual = 1.0,
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        },
    },
}

fireTypes = {
    ["normal"] = {
        dict = "core",
        name = "fire_wrecked_truck_vent",
        smoke = {
            enabled = true,
            type = "normal2",
            sizeMultiplier = 0.1, -- This is the size of smoke compared to the size of the fire
            keepAfterFire = true,
            keepAfterFireDuration = 30, -- This keeps smoke in the area for x seconds after the fire
            keepAfterFireSize = 0.1, -- This is the size of smoke after the fire compared to the initial size
        },
        toPutOut = { weapons.water, weapons.extinguisher, weapons.foam, weapons.waterMonitor, weapons.deckGun },
        toIncrease = {},
        multiFlamesAllowed = true, -- This defines if multiple flames are allowed for this fire type
        maximumMultipleFlames = 16, -- This defines the maximum flames allowed for this fire type
        difficulty = 10, -- This is how difficult the fire is to put out (out of 50)
        maximumFireSizeManual = 10.0, -- This is the maximum fire size that can be created using the create fire command
        minimumFireSizeAutomatic = 1.5, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeAutomatic = 4.5, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeWhenExtinguishing = 10.0, -- This is the maximum fire size that can be created automatically (such as using the wrong weapon to increase the size, such as water on an electrical fire)
        minimumFireSizeManual = 0.5, -- This is the minimum fire size that can be created using the create fire command
        damageDistance = 1.5, -- The distance a player must be nearby to be damaged by the fire
        -- We do not recommend editing the offSet section. This is used to adjust the offset of fires when spawning, for example they may be spawning too low below the player.
        offSet = {
            x = 0.0,
            y = 0.0,
            z = -0.4,
        }
    },
    ["normal2"] = {
        dict = "scr_trevor3",
        name = "scr_trev3_trailer_plume",
        smoke = {
            enabled = false,
            type = "normal",
            sizeMultiplier = 1.4, -- This is the size of smoke compared to the size of the fire
            keepAfterFire = false,
            keepAfterFireDuration = 200, -- This keeps smoke in the area for x seconds after the fire
            keepAfterFireSize = 1.0, -- This is the size of smoke after the fire compared to the initial size, e.g. 1.0 = same size as initial fire
        },
        toPutOut = { weapons.water, weapons.extinguisher, weapons.foam, weapons.waterMonitor, weapons.deckGun },
        toIncrease = {},
        multiFlamesAllowed = true, -- This defines if multiple flames are allowed for this fire type
        maximumMultipleFlames = 16, -- This defines the maximum flames allowed for this fire type
        difficulty = 25, -- This is how difficult the fire is to put out (out of 50)
        minimumFireSizeAutomatic = 1.5, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeAutomatic = 4.5, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeManual = 7.0, -- This is the maximum fire size that can be created using the create fire command
        maximumFireSizeWhenExtinguishing = 6.0, -- This is the maximum fire size that can be created automatically (such as using the wrong weapon to increase the size, such as water on an electrical fire)
        minimumFireSizeManual = 0.1, -- This is the minimum fire size that can be created using the create fire command
        -- We do not recommend editing the offSet section. This is used to adjust the offset of fires when spawning, for example they may be spawning too low below the player.
        damageDistance = 1.5, -- The distance a player must be nearby to be damaged by the fire
        -- We do not recommend editing the offSet section. This is used to adjust the offset of fires when spawning, for example they may be spawning too low below the player.
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        }
    },
    ["normal3"] = {
        dict = "core",
        name = "ent_ray_meth_fires",
        smoke = {
            enabled = true,
            type = "normal6",
            sizeMultiplier = 1.4, -- This is the size of smoke compared to the size of the fire
            keepAfterFire = true,
            keepAfterFireDuration = 30, -- This keeps smoke in the area for x seconds after the fire
            keepAfterFireSize = 1.6, -- This is the size of smoke after the fire compared to the initial size, e.g. 1.0 = same size as initial fire
        },
        toPutOut = { weapons.water, weapons.extinguisher, weapons.foam, weapons.waterMonitor, weapons.deckGun },
        toIncrease = {},
        multiFlamesAllowed = true, -- This defines if multiple flames are allowed for this fire type
        maximumMultipleFlames = 16, -- This defines the maximum flames allowed for this fire type
        difficulty = 30, -- This is how difficult the fire is to put out (out of 50)
        maximumFireSizeManual = 7.0, -- This is the maximum fire size that can be created using the create fire command
        minimumFireSizeAutomatic = 1.5, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeAutomatic = 4.5, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeWhenExtinguishing = 10.0, -- This is the maximum fire size that can be created automatically (such as using the wrong weapon to increase the size, such as water on an electrical fire)
        minimumFireSizeManual = 0.5, -- This is the minimum fire size that can be created using the create fire command
        damageDistance = 1.5, -- The distance a player must be nearby to be damaged by the fire
        -- We do not recommend editing the offSet section. This is used to adjust the offset of fires when spawning, for example they may be spawning too low below the player.
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        }
    },
    ["bonfire"] = {
        dict = "scr_michael2",
        name = "scr_mich3_heli_fire",
        smoke = {
            enabled = true,
            type = "normal",
            sizeMultiplier = 1.4, -- This is the size of smoke compared to the size of the fire
            keepAfterFire = true,
            keepAfterFireDuration = 200, -- This keeps smoke in the area for x seconds after the fire
            keepAfterFireSize = 1.0, -- This is the size of smoke after the fire compared to the initial size, e.g. 1.0 = same size as initial fire
        },
        toPutOut = { weapons.water, weapons.extinguisher, weapons.foam, weapons.waterMonitor, weapons.deckGun },
        toIncrease = {},
        multiFlamesAllowed = true, -- This defines if multiple flames are allowed for this fire type
        maximumMultipleFlames = 16, -- This defines the maximum flames allowed for this fire type
        difficulty = 40, -- This is how difficult the fire is to put out (out of 50)
        maximumFireSizeManual = 10.0, -- This is the maximum fire size that can be created using the create fire command
        minimumFireSizeAutomatic = 1.5, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeAutomatic = 3.0, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeWhenExtinguishing = 10.0, -- This is the maximum fire size that can be created automatically (such as using the wrong weapon to increase the size, such as water on an electrical fire)
        minimumFireSizeManual = 0.5, -- This is the minimum fire size that can be created using the create fire command
        damageDistance = 1.5, -- The distance a player must be nearby to be damaged by the fire
        -- We do not recommend editing the offSet section. This is used to adjust the offset of fires when spawning, for example they may be spawning too low below the player.
        offSet = {
            x = 0.0,
            y = 0.0,
            z = 0.0,
        }
    },
    ["chemical"] = {
        dict = "core",
        name = "fire_petroltank_truck",
        smoke = {
            enabled = false,
            type = "normal",
            sizeMultiplier = 1.4, -- This is the size of smoke compared to the size of the fire
            keepAfterFire = true,
            keepAfterFireDuration = 200, -- This keeps smoke in the area for x seconds after the fire
            keepAfterFireSize = 1.0, -- This is the size of smoke after the fire compared to the initial size, e.g. 1.0 = same size as initial fire
        },
        toPutOut = { weapons.extinguisher, weapons.foam },
        toIncrease = { weapons.water, weapons.waterMonitor, weapons.deckGun },
        multiFlamesAllowed = true, -- This defines if multiple flames are allowed for this fire type
        maximumMultipleFlames = 16, -- This defines the maximum flames allowed for this fire type
        difficulty = 40, -- This is how difficult the fire is to put out (out of 50)
        maximumFireSizeManual = 10.0, -- This is the maximum fire size that can be created using the create fire command
        minimumFireSizeAutomatic = 1.5, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeAutomatic = 6.5, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeWhenExtinguishing = 10.0, -- This is the maximum fire size that can be created automatically (such as using the wrong weapon to increase the size, such as water on an electrical fire)
        minimumFireSizeManual = 0.5, -- This is the minimum fire size that can be created using the create fire command
        damageDistance = 1.5, -- The distance a player must be nearby to be damaged by the fire
        -- We do not recommend editing the offSet section. This is used to adjust the offset of fires when spawning, for example they may be spawning too low below the player.
        offSet = {
            x = 0.0,
            y = 0.0,
            z = -1.0,
        }
        
    },
    ["electrical"] = {
        dict = "core",
        name = "fire_petroltank_truck",
        smoke = {
            enabled = true,
            type = "electrical",
            sizeMultiplier = 1.4, -- This is the size of smoke compared to the size of the fire
            keepAfterFire = true,
            keepAfterFireDuration = 200, -- This keeps smoke in the area for x seconds after the fire
            keepAfterFireSize = 1.0, -- This is the size of smoke after the fire compared to the initial size, e.g. 1.0 = same size as initial fire
        },
        toPutOut = { weapons.extinguisher, weapons.foam },
        toIncrease = { weapons.water, weapons.waterMonitor, weapons.deckGun },
        multiFlamesAllowed = true, -- This defines if multiple flames are allowed for this fire type
        maximumMultipleFlames = 16, -- This defines the maximum flames allowed for this fire type
        difficulty = 40, -- This is how difficult the fire is to put out (out of 50)
        maximumFireSizeManual = 10.0, -- This is the maximum fire size that can be created using the create fire command
        minimumFireSizeAutomatic = 1.5, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeAutomatic = 6.5, -- This is the minimum fire size that is started automatically (if automatic fires are enabled)
        maximumFireSizeWhenExtinguishing = 10.0, -- This is the maximum fire size that can be created automatically (such as using the wrong weapon to increase the size, such as water on an electrical fire)
        minimumFireSizeManual = 0.5, -- This is the minimum fire size that can be created using the create fire command
        damageDistance = 1.5, -- The distance a player must be nearby to be damaged by the fire
        -- We do not recommend editing the offSet section. This is used to adjust the offset of fires when spawning, for example they may be spawning too low below the player.
        offSet = {
            x = 0.0,
            y = 0.0,
            z = -1.0,
        }
    },
}