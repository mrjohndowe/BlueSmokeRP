Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.10 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(-29.53, -1103.67, 26.42)-- Where the finance menu is located
Config.PaymentWarning = 30 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-56.727394104004, -1086.2325439453),
                vector2(-60.612808227539, -1096.7795410156),
                vector2(-58.26834487915, -1100.572265625),
                vector2(-35.927803039551, -1109.0034179688),
                vector2(-34.427627563477, -1108.5111083984),
                vector2(-32.02657699585, -1101.5877685547),
                vector2(-33.342102050781, -1101.0377197266),
                vector2(-31.292987823486, -1095.3717041016)
            },
            ['minZ'] = 25.0, -- min height of the shop zone
            ['maxZ'] = 28.0, -- max height of the shop zone
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['sportsclassics'] = 'Sports Classics',
            ['sedans'] = 'Sedans',
            ['coupes'] = 'Coupes',
            ['suvs'] = 'SUVs',
            ['offroad'] = 'Offroad',
            ['muscle'] = 'Muscle',
            ['compacts'] = 'Compacts',
            ['motorcycles'] = 'Motorcycles',
            ['vans'] = 'Vans',
            ['cycles'] = 'Bicycles'
        },
        ['TestDriveTimeLimit'] = 0.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector3(-44.74, -1082.58, 26.68), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-45.65, -1093.66, 25.44, 69.5), -- where the vehicle will spawn on display
                defaultVehicle = 'adder', -- Default display vehicle
                chosenVehicle = 'adder', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-48.27, -1101.86, 25.44, 294.5),
                defaultVehicle = 'schafter2',
                chosenVehicle = 'schafter2'
            },
            [3] = {
                coords = vector4(-39.6, -1096.01, 25.44, 66.5),
                defaultVehicle = 'comet2',
                chosenVehicle = 'comet2'
            },
            [4] = {
                coords = vector4(-51.21, -1096.77, 25.44, 254.5),
                defaultVehicle = 'vigero',
                chosenVehicle = 'vigero'
            },
            [5] = {
                coords = vector4(-40.18, -1104.13, 25.44, 338.5),
                defaultVehicle = 'rmodmustang',
                chosenVehicle = 'rmodmustang'
            }
            -- [6] = {
                -- coords = vector4(-43.31, -1099.02, 25.44, 52.5),
                -- defaultVehicle = 'bati',
                -- chosenVehicle = 'bati'
            -- },
            -- [7] = {
                -- coords = vector4(-50.66, -1093.05, 25.44, 222.5),
                -- defaultVehicle = 'bati',
                -- chosenVehicle = 'bati'
            -- },
            -- [8] = {
                -- coords = vector4(-44.28, -1102.47, 25.44, 298.5),
                -- defaultVehicle = 'bati',
                -- chosenVehicle = 'bati'
            -- }
        },
    },
    ['luxury'] = {
        ['Type'] = 'managed', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(-1260.6973876953, -349.21334838867),
                vector2(-1268.6248779297, -352.87365722656),
                vector2(-1274.1533203125, -358.29794311523),
                vector2(-1273.8425292969, -362.73715209961),
                vector2(-1270.5701904297, -368.6716003418),
                vector2(-1266.0561523438, -375.14080810547),
                vector2(-1244.3684082031, -362.70278930664),
                vector2(-1249.8704833984, -352.03326416016),
                vector2(-1252.9503173828, -345.85726928711)
            },
            ['minZ'] = 36.646457672119,
            ['maxZ'] = 37.516143798828,
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Luxury Vehicle Shop',
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {
            ['super'] = 'Super',
            ['sports'] = 'Sports'
        },
        ['TestDriveTimeLimit'] = 0.5,
        ['Location'] = vector3(-1255.6, -361.16, 36.91),
        ['ReturnLocation'] = vector3(-1231.46, -349.86, 37.33),
        ['VehicleSpawn'] = vector4(-1231.46, -349.86, 37.33, 26.61),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1265.31, -354.44, 35.91, 205.08),
                defaultVehicle = 'italirsx',
                chosenVehicle = 'italirsx'
            },
            [2] = {
                coords = vector4(-1270.06, -358.55, 35.91, 247.08),
                defaultVehicle = 'italigtb',
                chosenVehicle = 'italigtb'
            },
            [3] = {
                coords = vector4(-1269.21, -365.03, 35.91, 297.12),
                defaultVehicle = 'nero',
                chosenVehicle = 'nero'
            },
            [4] = {
                coords = vector4(-1252.07, -364.2, 35.91, 56.44),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati'
            },
            [5] = {
                coords = vector4(-1255.49, -365.91, 35.91, 55.63),
                defaultVehicle = 'carbonrs',
                chosenVehicle = 'carbonrs'
            },
            [6] = {
                coords = vector4(-1249.21, -362.97, 35.91, 53.24),
                defaultVehicle = 'hexer',
                chosenVehicle = 'hexer'
            },
        }
    }, -- Add your next table under this comma
    ['boats'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-729.39, -1315.84),
                vector2(-766.81, -1360.11),
                vector2(-754.21, -1371.49),
                vector2(-716.94, -1326.88)
            },
            ['minZ'] = 0.0, -- min height of the shop zone
            ['maxZ'] = 5.0, -- max height of the shop zone
            ['size'] = 6.2 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Marina Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 410, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['boats'] = 'Boats'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-738.25, -1334.38, 1.6), -- Blip Location
        ['ReturnLocation'] = vector3(-714.34, -1343.31, 0.0), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-727.87, -1353.1, -0.17, 137.09), -- Spawn location when vehicle is bought
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-727.05, -1326.59, 0.00, 229.5), -- where the vehicle will spawn on display
                defaultVehicle = 'seashark', -- Default display vehicle
                chosenVehicle = 'seashark' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-732.84, -1333.5, -0.50, 229.5),
                defaultVehicle = 'dinghy',
                chosenVehicle = 'dinghy'
            },
            [3] = {
                coords = vector4(-737.84, -1340.83, -0.50, 229.5),
                defaultVehicle = 'speeder',
                chosenVehicle = 'speeder'
            },
            [4] = {
                coords = vector4(-741.53, -1349.7, -2.00, 229.5),
                defaultVehicle = 'marquis',
                chosenVehicle = 'marquis'
            },
        },
    },
    ['air'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-1607.58, -3141.7),
                vector2(-1672.54, -3103.87),
                vector2(-1703.49, -3158.02),
                vector2(-1646.03, -3190.84)
            },
            ['minZ'] = 12.99, -- min height of the shop zone
            ['maxZ'] = 16.99, -- max height of the shop zone
            ['size'] = 7.0, -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Air Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 251, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['helicopters'] = 'Helicopters',
            ['planes'] = 'Planes'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-1652.76, -3143.4, 13.99), -- Blip Location
        ['ReturnLocation'] = vector3(-1628.44, -3104.7, 13.94), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-1617.49, -3086.17, 13.94, 329.2), -- Spawn location when vehicle is bought
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1651.36, -3162.66, 12.99, 346.89), -- where the vehicle will spawn on display
                defaultVehicle = 'volatus', -- Default display vehicle
                chosenVehicle = 'volatus' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-1668.53, -3152.56, 12.99, 303.22),
                defaultVehicle = 'luxor2',
                chosenVehicle = 'luxor2'
            },
            [3] = {
                coords = vector4(-1632.02, -3144.48, 12.99, 31.08),
                defaultVehicle = 'nimbus',
                chosenVehicle = 'nimbus'
            },
            [4] = {
                coords = vector4(-1663.74, -3126.32, 12.99, 275.03),
                defaultVehicle = 'frogger',
                chosenVehicle = 'frogger'
            },
        },
    },
	['police_shop'] = {
		['Type'] = 'managed',
		['Zone'] = {
			['Shape'] = {--polygon that surrounds the shop
               vector2(-340.16, -168.51),
                vector2(-356.86, -138.53),
                vector2(-345.87, -109.01),
                vector2(-377.58, -96.96),
				vector2(-369.49, -79.59),
				vector2(-306.94, -101.62),
				vector2(-328.09, -160.08),
            },
            ['minZ'] = 35.00, -- min height of the shop zone
            ['maxZ'] = 45.00, -- max height of the shop zone
            ['size'] = 7.0, -- size of the vehicles zones
		},
        ['Job'] = 'police', -- Name of job or none
        ['ShopLabel'] = 'Police Vehicle Shop',
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {
            ['emergency'] = 'Emergency'
        },
        ['TestDriveTimeLimit'] = 5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-336.3, -132.29, 39.01), -- Blip Location
        ['ReturnLocation'] = vector4(-357.53, -159.45, 38.00, 28.92), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-357.53, -159.45, 38.00, 28.92), -- Spawn location when vehicle is bought
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-327.64, -144.05, 38.00, 36.36), -- where the vehicle will spawn on display
                defaultVehicle = '11cvpiv', -- Default display vehicle
                chosenVehicle = '11cvpiv' -- Same as default but is dynamically changed when swapping vehicles
			},
			[2] = {
                coords = vector4(-325.76, -138.81, 38.00, 37.99), -- where the vehicle will spawn on display
                defaultVehicle = '18taurusvw', -- Default display vehicle
                chosenVehicle = '18taurusvw' -- Same as default but is dynamically changed when swapping vehicles
         
			},
			[3] = {
                coords = vector4(-324.07, -133.64, 38.00, 36.33), -- where the vehicle will spawn on display
                defaultVehicle = '14chargervw', -- Default display vehicle
                chosenVehicle = '14chargervw' -- Same as default but is dynamically changed when swapping vehicles
			},
			[4] = {
                coords = vector4(-321.99, -128.53, 38.00, 36.55), -- where the vehicle will spawn on display
                defaultVehicle = '18chargervw', -- Default display vehicle
                chosenVehicle = '18chargervw' -- Same as default but is dynamically changed when swapping vehicles
			},
			[5] = {
                coords = vector4(-318.61, -118.14, 38.00, 105.08), -- where the vehicle will spawn on display
                defaultVehicle = '16fpiuvw', -- Default display vehicle
                chosenVehicle = '16fpiuvw' -- Same as default but is dynamically changed when swapping vehicles
			},
			[6] = {
                coords = vector4(-316.73, -113.03, 38.00, 104.62), -- where the vehicle will spawn on display
                defaultVehicle = '13fpiuvw', -- Default display vehicle
                chosenVehicle = '13fpiuvw' -- Same as default but is dynamically changed when swapping vehicles
			},
			[7] = {
                coords = vector4(-313.9, -107.92, 38.00, 98.69), -- where the vehicle will spawn on display
                defaultVehicle = '18tahoevw', -- Default display vehicle
                chosenVehicle = '18tahoevw' -- Same as default but is dynamically changed when swapping vehicles
			},
			[8] = {
                coords = vector4(-312.96, -102.8, 38.79, 98.76), -- where the vehicle will spawn on display
                defaultVehicle = '21durangovw', -- Default display vehicle
                chosenVehicle = '21durangovw' -- Same as default but is dynamically changed when swapping vehicles
			},
			[9] = {
                coords = vector4(-319.25, -123.66, 38.00, 70.23), -- where the vehicle will spawn on display
                defaultVehicle = '18f150vw', -- Default display vehicle
                chosenVehicle = '18f150vw' -- Same as default but is dynamically changed when swapping vehicles
			},
			[10] = {
                coords = vector4(-347.3, -131.91, 38.00, 251.19), -- where the vehicle will spawn on display
                defaultVehicle = '20ramrbc', -- Default display vehicle
                chosenVehicle = '20ramrbc' -- Same as default but is dynamically changed when swapping vehicles
			},
			[11] = {
                coords = vector4(-346.2, -124.74, 38.00, 250.86), -- where the vehicle will spawn on display
                defaultVehicle = 'f450c', -- Default display vehicle
                chosenVehicle = 'f450c' -- Same as default but is dynamically changed when swapping vehicles
			},
			[12] = {
                coords = vector4(-341.49, -113.96, 38.00, 250.3), -- where the vehicle will spawn on display
                defaultVehicle = '20ramrb', -- Default display vehicle
                chosenVehicle = '20ramrb' -- Same as default but is dynamically changed when swapping vehicles
			},
			[13] = {
                coords = vector4(-351.95, -90.35, 38.00, 250.05), -- where the vehicle will spawn on display
                defaultVehicle = '20ramambo', -- Default display vehicle
                chosenVehicle = '20ramambo' -- Same as default but is dynamically changed when swapping vehicles
			},
			[14] = {
                coords = vector4(-369.54, -94.31, 39.00, 288.64), -- where the vehicle will spawn on display
                defaultVehicle = 'axttower', -- Default display vehicle
                chosenVehicle = 'axttower' -- Same as default but is dynamically changed when swapping vehicles
			},
			[15] = {
                coords = vector4(-358.2, -97.74, 39.00, 35.51), -- where the vehicle will spawn on display
                defaultVehicle = 'enforcer', -- Default display vehicle
                chosenVehicle = 'enforcer' -- Same as default but is dynamically changed when swapping vehicles
			},
			[16] = {
                coords = vector4(-365.24, -85.73, 39.00, 209.26), -- where the vehicle will spawn on display
                defaultVehicle = 'engine22', -- Default display vehicle
                chosenVehicle = 'engine22' -- Same as default but is dynamically changed when swapping vehicles
			},
			[17] = {
                coords = vector4(-333.86, -96.65, 38.00, 205.27), -- where the vehicle will spawn on display
                defaultVehicle = 'emst', -- Default display vehicle
                chosenVehicle = 'emst' -- Same as default but is dynamically changed when swapping vehicles
			},
			[18] = {
                coords = vector4(-342.62, -106.72, 38.00, 298.3), -- where the vehicle will spawn on display
                defaultVehicle = 'emsc', -- Default display vehicle
                chosenVehicle = 'emsc' -- Same as default but is dynamically changed when swapping vehicles
			},
			[19] = {
                coords = vector4(-344.04, -93.13, 38.00, 198.07), -- where the vehicle will spawn on display
                defaultVehicle = 'emsf', -- Default display vehicle
                chosenVehicle = 'emsf' -- Same as default but is dynamically changed when swapping vehicles
			},
			[20] = {
                coords = vector4(-339.19, -95.33, 38.00, 204.05), -- where the vehicle will spawn on display
                defaultVehicle = 'ram20pov', -- Default display vehicle
                chosenVehicle = 'ram20pov' -- Same as default but is dynamically changed when swapping vehicles
			},
			[21] = {
                coords = vector4(-346.51, -105.0, 38.00, 299.59), -- where the vehicle will spawn on display
                defaultVehicle = 'chief4', -- Default display vehicle
                chosenVehicle = 'chief4' -- Same as default but is dynamically changed when swapping vehicles
			},
			[22] = {
                coords = vector4(-351.22, -102.67, 38.00, 295.84), -- where the vehicle will spawn on display
                defaultVehicle = 'chief', -- Default display vehicle
                chosenVehicle = 'chief' -- Same as default but is dynamically changed when swapping vehicles
			},
			[23] = {
                coords = vector4(-339.16, -162.41, 38.00, 293.43), -- where the vehicle will spawn on display
                defaultVehicle = 'pwcart', -- Default display vehicle
                chosenVehicle = 'pwcart' -- Same as default but is dynamically changed when swapping vehicles
			},
		},
	},
	['police_shop_air'] = {
		['Type'] = 'managed',
		['Zone'] = {
			['Shape'] = {--polygon that surrounds the shop
               vector2(-340.16, -168.51),
                vector2(-356.86, -138.53),
                vector2(-345.87, -109.01),
                vector2(-377.58, -96.96),
				vector2(-369.49, -79.59),
				vector2(-306.94, -101.62),
				vector2(-328.09, -160.08),
            },
            ['minZ'] = 35.00, -- min height of the shop zone
            ['maxZ'] = 45.00, -- max height of the shop zone
            ['size'] = 7.0, -- size of the vehicles zones
		},
        ['Job'] = 'ambulance', -- Name of job or none
        ['ShopLabel'] = 'Police Air Shop',
        ['showBlip'] = false, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {
            ['planes'] = 'Emergency Planes'
        },
        ['TestDriveTimeLimit'] = 5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-336.3, -132.29, 39.01), -- Blip Location
        ['ReturnLocation'] = vector4(-376.02, -128.34, 38.68, 312.89), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-342.46, -141.46, 60.51, 166.17), -- Spawn location when vehicle is bought
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-338.14, -102.68, 39.00, 255.86), -- where the vehicle will spawn on display
                defaultVehicle = 'emsair', -- Default display vehicle
                chosenVehicle = 'emaair' -- Same as default but is dynamically changed when swapping vehicles
			},
			[2] = {
                coords = vector4(-337.57, -141.07, 39.00, 338.86), -- where the vehicle will spawn on display
                defaultVehicle = 'emsair', -- Default display vehicle
                chosenVehicle = 'emaair' -- Same as default but is dynamically changed when swapping vehicles
			},
			[3] = {
                coords = vector4(-332.38, -126.69, 38.00, 339.74), -- where the vehicle will spawn on display
                defaultVehicle = 'aw139', -- Default display vehicle
                chosenVehicle = 'aw139' -- Same as default but is dynamically changed when swapping vehicles
			},
			[4] = {
                coords = vector4(-327.21, -109.61, 38.00, 160.51), -- where the vehicle will spawn on display
                defaultVehicle = 'c3fireheli', -- Default display vehicle
                chosenVehicle = 'c3fireheli' -- Same as default but is dynamically changed when swapping vehicles
			},
		}
	}
}
