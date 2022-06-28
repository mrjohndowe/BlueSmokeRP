
--Territories
TerritoriesConfig = {
  Framework = 'esx', ---[ 'esx' / 'qbus' / 'vrp' ] Choose your framework.

  Debug             = true,           -- Remove after testing.
  ShowDebugText     = false,           -- Display drawtext for zone? Mostly used for debugging.
  HideAllDominationMsg = false,    -- Hide all notifications.
  ShowOnlyDominatedMsgOneTime = false, --Display only one time the message for 100% of domination
  InfluenceTick     = 1000,           -- how long between influence gain/loss tick?  --36 seconds to gain or loss influence , 36000 = 1hour to 100%
  MinNumberPlayerToStartInfluence = 0,-- Number of players to allow territories domination
  MinNumGangTotInfluence = 0, --Number of player from one gang to influence the territory
  DisplayZoneForAll  = true,         -- Display territory zone blips
  
  MaxPlayerCount    = 128,           -- Max server players
  
  TargetResourceName  = 'qb-target', --If you have a custom target, change the name
  PlayerLoadEvent   = 'esx:playerLoaded', --event for player load, ESX = esx:playerLoaded, Qbus = QBCore:Client:OnPlayerLoaded
  MainCoreEvent     = 'esx:getSharedObject', --ESX = 'esx:getSharedObject'   QBUS = 'QBCore:GetObject'
  CoreResourceName  = 'es_extended',   --ESX = 'es_extended'           QBCORE = 'qb-core'
  SetJobEvent       = 'esx:setJob',   --ESX = esx:setJob , qbus = 'QBCore:Client:OnJobUpdate'
  SetGangEvent      = 'QBCore:Client:OnGangUpdate', -- Only used for Qbus , 'QBCore:Client:OnGangUpdate'
  SetPoliceUpdateEvent  = 'police:SetCopCount',
  CustomSuccessSellDrugsServerEvent = 'qp-territories:server:successDrugs',--put here a custom register event if you need execute some action after sell drugs with success Ex: qp-territories:server:successDrugs. The registered event should receive 5 parameters (src, typeOfMoney, amountDrugs, priceDrugs, territoryName, drugItemName)
  CustomSuccessSellItemsServerEvent = 'qp-territories:server:successItems',--put here a custom register event if you need execute some action after sell items with success Ex: qp-territories:server:successItems. The registered event should receive 5 parameters (src, typeOfMoney, amountDrugs, priceDrugs, territoryName, itemName)
  SetIsDeadMetadata  = 'isdead',--metadata used by qb-core by default to sinalize dead player ( isdead ), ONLY QB-CORE
  DatabaseResourceName = 'oxmysql', --this is used only for qbus framework , ghmattimysql or oxmysql
  SetGangServerAccountEvent  = 'qp-management:server:addAccountMoney',
  
  SqlSaveTimer      = 1, -- minutes for zone influence to save to database
  
  --animation to sell drugs
  animDict = 'gestures@f@standing@casual',
  aLib = 'gesture_point',
  
  marketDealerPedType = 'g_m_y_salvagoon_01',
  turnoffSellingDrugsAndMarket = false, --use this to true if you want only the territories
  
  PoliceJobs = {
    'police',                         -- The police job names.
  },
  
  GangJobs = {                        -- List all jobs that are able to contest for and control territories here.
    "groove",                         -- NOTE: Don't need to include police. Thats taken from PoliceJob var above.
    "ballas",    
    "vagos",    
    "marabunta",
    "triads" 
  },

  marketInfoDealers = { -- g_m_y_salvagoon_01 mexicano
      vector4(310.85, -1719.51, 28.26, 342.84),	
  },

  maxNumberDrugsToSellToPed = 8, --max number of drugs that you can sell to a ped
  maxNumberItemsToSellToPed = 4, --max number of items that you can sell to a ped if the territory is not dominated

  --percentages to work with the drugs market
  marketlimitPercentage = 50, --max percentage to increase for the drugs market
  marketlimitPercentageToRemove = 30, --min percentage until we can remove price for the most selled drugs
  domainateTerritoryMultiplier = 2, -- how much the drugs price is multiplier if the territory is dominated
  percentageToRemoveNormalPlayers = 20, --20% that the dominate gang will earn for selling drugs in their territory
  percentageToDominationGang = 5, --5% that the gang with territory domination will earn for other players
  callPolicePercentage = 25, -- 0 - 100 , percentage to call the police if the territory is dominated by a gang
  MinNumberOfCopsToSellDrugs = 0, --min num of cops to sell drugs
  typeOfMoneyToGive = 'black_money',
  giveRewardMoneyAsItem = false,--this means if you want use givemoney or giveitem , False will use /givemoney
  useBagMarkedBills = false, --new qb system use bag to insert marked bills

  Locale = 'EN',
  Locales = {
      ['PT'] = {
        ['INFO_TEXT1'] = 'Zona: %s \nInfluencia: %02d%% \nGang: %s', 
        ['INFO_TEXT2'] = 'O território %s está com %02d%% de influencia.',
        ['INFO_DRUGS'] = 'Vender drogas',
        ['INFO_DRUGS_PROGRESS'] = 'Vender a droga...',
        ['ZONE_PROTECTED'] = 'A zona está protegida por a Policia, vai-te embora patife...',
        ['LIST_DRUGS'] = 'Lista de Drogas com mais procura no mercado:',
        ['SUCCESS_DRUGS'] = 'Traficaste %d de %s e recebeste %s dinheiro sujo.',
        ['NO_DRUGS'] = 'Não tens droga para vender.',
        ['NO_DRUGS_TERRITORY'] = 'Não tens a droga que queremos. Sai daqui...',
        ['NO_POLICE'] = 'Não tens policias suficientes para vender drogas.',
        ['DEALER_INFO'] = 'Obter Informações',
        ['PED_FULL'] = 'Não tenho mais dinheiro.',
        ['INFO_ITEMS'] = 'Vender Items',
        ['INFO_ITEMS_PROGRESS'] = 'A vender items...',
        ['SUCCESS_ITEMS'] = 'Traficaste %d de %s e recebeste %s dinheiro sujo.',
        ['NO_ITEMS'] = 'Não tens items para vender.',
        ['NO_ITEMS_TERRITORY'] = 'Não tens os items que queremos. Vai a outro lado...',
      },
      ['EN'] = {
        ['INFO_TEXT1'] = 'Zone: %s \nInfluence: %02d%% \nGang: %s', 
        ['INFO_TEXT2'] = 'Territory %s is with %02d%% of influence.',
        ['DEALER_INFO'] = 'Get Information',
        ['INFO_DRUGS'] = 'Sell drugs',
        ['INFO_DRUGS_PROGRESS'] = 'Selling drugs...',
        ['ZONE_PROTECTED'] = 'Territory is protected by the Police, go away scumbag...',
        ['LIST_DRUGS'] = 'List of drugs in the market:',
        ['SUCCESS_DRUGS'] = 'You sell %d of %s and you receive %s of dirty money.',
        ['NO_DRUGS'] = 'You have no drugs to sell.',
        ['NO_DRUGS_TERRITORY'] = 'You dont have the drug we want. Get out...',
        ['NO_POLICE'] = 'No Police to sell drugs.',
        ['PED_FULL'] = 'I do not have more money.',
        ['INFO_ITEMS'] = 'Sell Items',
        ['INFO_ITEMS_PROGRESS'] = 'Selling items...',
        ['SUCCESS_ITEMS'] = 'You sell %d of %s and you receive %s of dirty money.',
        ['NO_ITEMS'] = 'You have no items to sell.',
        ['NO_ITEMS_TERRITORY'] = 'You dont have the items we want. Get out...',
    } 
  }
}
  
  
BlipColors = {
    police  = 3,
    groove   = 25, 
    ballas  = 27,
    vagos   = 5,
    marabunta   = 26,
    triads   = 40,
}


TextColors = {
    police  = "blue",              
    groove   = "red",
    ballas  = "red",
    vagos   = "red",
    marabunta   = "red",
    triads = "red",
}
  
  
Territories = {
	["Vespucci"] = {
      control = "police",                                   -- The default control for this zone belongs to this job.
      influence = 0,                                    -- The default influence for this zone.
      identifier = "vespucci",                                      -- Probably don't change this unless you intend on moving the zones around.
      displayName = "Vespucci",
      areas = {                                             -- Areas are responsible for the large square blips on the map.
        [1] = { 
          radius = 150.0,
          blip = nil,
          center  = vector3(-1107.5, -1545.96, 4.34),
          debug = false,
          zone = nil,
          showMapZone = true,
          showMapZoneColorOnlyForGangWithDomination = false, --if true the script only show the color on the map for the gang with some percentage of domination, the other players dont have the map color
        }
      },
      sellDrugs = true,
      typeOfDrugs = {
          'marijuana',
      },
      sellOtherItems = false,
      typeOfItems = {
      },
	},
  
	["Jamestowns"] = {
	  control = "police",                                   -- The default control for this zone belongs to this job.
	  influence = 0,                                    -- The default influence for this zone.
	  identifier = "jamestowns",                                      -- Probably don't change this unless you intend on moving the zones around.
	  displayName = "Jamestowns",
	  areas = {                                             -- Areas are responsible for the large square blips on the map.
      [1] = { 
        radius = 120.0,
        blip = nil,
        center  = vector3(496.18, -1742.65, 28.83),
        debug = false,
        zone = nil,
        showMapZone = true,
        showMapZoneColorOnlyForGangWithDomination = false, --if true the script only show the color on the map for the gang with some percentage of domination, the other players dont have the map color
      }
	  },
    sellDrugs = true,
    typeOfDrugs = {'meth'},
    sellOtherItems = false,
    typeOfItems = {
    },
	},
  
  
	["EastLosSantos"] = {
	  control = "police",                                   -- The default control for this zone belongs to this job.
	  influence = 0,                                    -- The default influence for this zone.
	  identifier = "eastlossantos",                                      -- Probably don't change this unless you intend on moving the zones around.
	  displayName = "East Los Santos",
	  areas = {                                             -- Areas are responsible for the large square blips on the map.
      [1] = { 
        radius = 120.0,
        blip = nil,
        center  = vector3(1293.6, -1703.46, 62.55),
        debug = false,
        zone = nil,
        showMapZone = true,
        showMapZoneColorOnlyForGangWithDomination = false, --if true the script only show the color on the map for the gang with some percentage of domination, the other players dont have the map color
      }
	  },
	  sellDrugs = true,
    typeOfDrugs = {'blocohaxixe'},
    sellOtherItems = false,
    typeOfItems = {
    },
	},
	
	["PortLosSantos"] = {
	  control = "police",                                   -- The default control for this zone belongs to this job.
	  influence = 0,                                    -- The default influence for this zone.
	  identifier = "portlossantos",                                      -- Probably don't change this unless you intend on moving the zones around.
	  displayName = "Port Los Santos",
	  areas = {                                             -- Areas are responsible for the large square blips on the map.
      [1] = { 
        radius = 100.0,
        blip = nil,
        center  = vector3(274.41, -2495.53, 6.44),
        debug = false,
        zone = nil,
        showMapZone = true,
        showMapZoneColorOnlyForGangWithDomination = false, --if true the script only show the color on the map for the gang with some percentage of domination, the other players dont have the map color
      }
	  },
    sellDrugs = true,
    typeOfDrugs = {'caixacoke'},
    sellOtherItems = false,
    typeOfItems = {
    },
	},
  
	["RanchoBoulevard"] = {
	  control = "police",                                   -- The default control for this zone belongs to this job.
	  influence = 0,                                    -- The default influence for this zone.
	  identifier = "ranchoboulevard",                                      -- Probably don't change this unless you intend on moving the zones around.
	  displayName = "El Rancho Boulevard",
	  areas = {                                             -- Areas are responsible for the large square blips on the map.
		[1] = { 
        radius = 100.0,
        blip = nil,
        center  = vector3(833.97, -1970.69, 29.29),
        debug = false,
        zone = nil,
        showMapZone = true,
        showMapZoneColorOnlyForGangWithDomination = false, --if true the script only show the color on the map for the gang with some percentage of domination, the other players dont have the map color
      }
	  },
    sellDrugs = true,
    typeOfDrugs = {'caixaheroin'},
    sellOtherItems = false,
    typeOfItems = {
    },
	},

  ["RanchoCarsonAve"] = {
      control = "police",                                   -- The default control for this zone belongs to this job.
      influence = 0,                                    -- The default influence for this zone.
      identifier = "ranchoCarsonAve",                                      -- Probably don't change this unless you intend on moving the zones around.
      displayName = "El Rancho Carson Ave",
      areas = {                                             -- Areas are responsible for the large square blips on the map.
          [1] = { 
              radius = 150.0,
              blip = nil,
              center  = nil, --set the vector3 center coords if you use the circle and the useMultipleVectors is false
              debug = false,
              zone = nil,
              showMapZone = true,
              showMapZoneColorOnlyForGangWithDomination = false, --if true the script only show the color on the map for the gang with some percentage of domination, the other players dont have the map color
              useMultipleVectors = true,
              vectors = { --points for create the territory custom shape
                  vector2(353.37, -1925.83),
                  vector2(239.58, -2064.79),
                  vector2(157.38, -2031.41),
                  vector2(213.91, -1943.12),
                  vector2(101.06, -1867.12),
                  vector2(165.77, -1786.25),

              },
              vectorsBlips = { --blips that will represent the custom shape
                  [1] = {
                      center = vector3(255.59, -1971.78, 22.05),
                      rotation = 90.0,-- use the number with xx.0
                      width = 200.0, -- use the number with xx.0
                      height = 114.0, -- use the number with xx.0
                  },
                  [2] = {
                      center = vector3(188.29, -1857.07, 27.05),
                      rotation = 165.0,-- use the number with xx.0
                      width = 130.0, -- use the number with xx.0
                      height = 100.0, -- use the number with xx.0
                  }
              }
          },
    },
    sellDrugs = true,
    typeOfDrugs = {
        'caixaheroin',
        'caixacoke',
    },
    sellOtherItems = true,
    typeOfItems = {
        ['bread'] = { min = 50, max = 200}, --normal price, if the territory is dominated the price can increase
    },
  },
}

-- Ignore me. Don't touch.
GangLookup = {} for k,v in pairs(TerritoriesConfig.GangJobs) do GangLookup[v] = true; end; for k,v in pairs(TerritoriesConfig.PoliceJobs) do GangLookup[v] = true; end; 
PoliceLookup = {}; for k,v in pairs(TerritoriesConfig.PoliceJobs) do PoliceLookup[v] = true; end; 


RegisterNetEvent('qp-gangwars:sendNotification', function(msg, typeMsg, timer) --typeMsg possible results-> 'primary', 'error', 'success'
  if TerritoriesConfig.Framework == 'esx' then
    TriggerEvent('esx:showNotification', msg)
  elseif TerritoriesConfig.Framework == 'qbus' then
    TriggerEvent('QBCore:Notify',msg, typeMsg, timer)
    
  elseif TerritoriesConfig.Framework == 'vrp' then
    --next version, not implemented. 

  end
 
end)

--all type of peds that you can sell drugs
AllPedsModels = {
  --woman models
  'a_f_m_beach_01',
  'a_f_m_bevhills_01',
  'a_f_m_bevhills_02',
  'a_f_m_bodybuild_01',
  'a_f_m_business_02',
  'a_f_m_downtown_01',
  'a_f_m_eastsa_01',
  'a_f_m_eastsa_02',
  'a_f_m_fatbla_01',
  'a_f_m_fatcult_01',
  'a_f_m_fatwhite_01',
  'a_f_m_ktown_01',
  'a_f_m_ktown_02',
  'a_f_m_prolhost_01',
  'a_f_m_salton_01',
  'a_f_m_skidrow_01',
  'a_f_m_soucentmc_01',
  'a_f_m_soucent_01',
  'a_f_m_soucent_02',
  'a_f_m_tourist_01',
  'a_f_m_trampbeac_01',
  'a_f_m_tramp_01',
  'a_f_o_genstreet_01',
  'a_f_o_indian_01',
  'a_f_o_ktown_01',
  'a_f_o_salton_01',
  'a_f_o_soucent_01',
  'a_f_o_soucent_02',
  'a_f_y_beach_01',
  'a_f_y_bevhills_01',
  'a_f_y_bevhills_02',
  'a_f_y_bevhills_03',
  'a_f_y_bevhills_04',
  'a_f_y_business_01',
  'a_f_y_business_02',
  'a_f_y_business_03',
  'a_f_y_business_04',
  'a_f_y_eastsa_01',
  'a_f_y_eastsa_02',
  'a_f_y_eastsa_03',
  'a_f_y_epsilon_01',
  'a_f_y_fitness_01',
  'a_f_y_fitness_02',
  'a_f_y_genhot_01',
  'a_f_y_golfer_01',
  'a_f_y_hiker_01',
  'a_f_y_hipster_01',
  'a_f_y_hipster_02',
  'a_f_y_hipster_03',
  'a_f_y_hipster_04',
  'a_f_y_indian_01',
  'a_f_y_juggalo_01',
  'a_f_y_runner_01',
  'a_f_y_rurmeth_01',
  'a_f_y_scdressy_01',
  'a_f_y_skater_01',
  'a_f_y_soucent_01',
  'a_f_y_soucent_02',
  'a_f_y_soucent_03',
  'a_f_y_tennis_01',
  'a_f_y_tourist_01',
  'a_f_y_tourist_02',
  'a_f_y_vinewood_01',
  'a_f_y_vinewood_02',
  'a_f_y_vinewood_03',
  'a_f_y_vinewood_04',
  'a_f_y_yoga_01',
  'g_f_y_ballas_01',
  'g_f_y_families_01',
  'g_f_y_lost_01',
  'g_f_y_vagos_01',
  'mp_f_deadhooker',
  'mp_f_freemode_01',
  'mp_f_misty_01',
  'mp_f_stripperlite',
  'mp_s_m_armoured_01',
  's_f_m_fembarber',
  's_f_m_maid_01',
  's_f_m_shop_high',
  's_f_m_sweatshop_01',
  's_f_y_airhostess_01',
  's_f_y_bartender_01',
  's_f_y_baywatch_01',
  's_f_y_cop_01',
  's_f_y_factory_01',
  's_f_y_hooker_01',
  's_f_y_hooker_02',
  's_f_y_hooker_03',
  's_f_y_migrant_01',
  's_f_y_movprem_01',
  'ig_kerrymcintosh',
  'ig_janet',
  'ig_jewelass',
  'ig_magenta',
  'ig_marnie',
  'ig_patricia',
  'ig_screen_writer',
  'ig_tanisha',
  'ig_tonya',
  'ig_tracydisanto',
  'u_f_m_corpse_01',
  'u_f_m_miranda',
  'u_f_m_promourn_01',
  'u_f_o_moviestar',
  'u_f_o_prolhost_01',
  'u_f_y_bikerchic',
  'u_f_y_comjane',
  'u_f_y_corpse_01',
  'u_f_y_corpse_02',
  'u_f_y_hotposh_01',
  'u_f_y_jewelass_01',
  'u_f_y_mistress',
  'u_f_y_poppymich',
  'u_f_y_princess',
  'u_f_y_spyactress',
  'ig_amandatownley',
  'ig_ashley',
  'ig_andreas',
  'ig_ballasog',
  'ig_maryannn',
  'ig_maude',
  'ig_michelle',
  'ig_mrs_thornhill',
  'ig_natalia',
  's_f_y_scrubs_01',
  's_f_y_sheriff_01',
  's_f_y_shop_low',
  's_f_y_shop_mid',
  's_f_y_stripperlite',
  's_f_y_stripper_01',
  's_f_y_stripper_02',
  'ig_mrsphillips',
  'ig_mrs_thornhill',
  'ig_molly',
  'ig_natalia',
  's_f_y_sweatshop_01',
  'ig_paige',
  'a_f_y_femaleagent',
  'a_f_y_hippie_01',

  --man models
  'ig_trafficwarden',
  'ig_bankman',
  'ig_barry',
  'ig_bestmen',
  'ig_beverly',
  'ig_car3guy1',
  'ig_car3guy2',
  'ig_casey',
  'ig_chef',
  'ig_chengsr',
  'ig_chrisformage',
  'ig_clay',
  'ig_claypain',
  'ig_cletus',
  'ig_dale',
  'ig_dreyfuss',
  'ig_fbisuit_01',
  'ig_floyd',
  'ig_groom',
  'ig_hao',
  'ig_hunter',
  'csb_prolsec',
  'ig_jimmydisanto',
  'ig_joeminuteman',
  'ig_josef',
  'ig_josh',
  'ig_lamardavis',
  'ig_lazlow',
  'ig_lestercrest',
  'ig_lifeinvad_01',
  'ig_lifeinvad_02',
  'ig_manuel',
  'ig_milton',
  'ig_mrk',
  'ig_nervousron',
  'ig_nigel',
  'ig_old_man1a',
  'ig_old_man2',
  'ig_oneil',
  'ig_orleans',
  'ig_ortega',
  'ig_paper',
  'ig_priest',
  'ig_prolsec_02',
  'ig_ramp_gang',
  'ig_ramp_hic',
  'ig_ramp_hipster',
  'ig_ramp_mex',
  'ig_roccopelosi',
  'ig_russiandrunk',
  'ig_siemonyetarian',
  'ig_solomon',
  'ig_stevehains',
  'ig_stretch',
  'ig_talina',
  'ig_taocheng',
  'ig_taostranslator',
  'ig_tenniscoach',
  'ig_terry',
  'ig_tomepsilon',
  'ig_tylerdix',
  'ig_wade',
  'ig_zimbor',
  's_m_m_paramedic_01',
  'a_m_m_afriamer_01',
  'a_m_m_beach_01',
  'a_m_m_beach_02',
  'a_m_m_bevhills_01',
  'a_m_m_bevhills_02',
  'a_m_m_business_01',
  'a_m_m_eastsa_01',
  'a_m_m_eastsa_02',
  'a_m_m_farmer_01',
  'a_m_m_fatlatin_01',
  'a_m_m_genfat_01',
  'a_m_m_genfat_02',
  'a_m_m_golfer_01',
  'a_m_m_hasjew_01',
  'a_m_m_hillbilly_01',
  'a_m_m_hillbilly_02',
  'a_m_m_indian_01',
  'a_m_m_ktown_01',
  'a_m_m_malibu_01',
  'a_m_m_mexcntry_01',
  'a_m_m_mexlabor_01',
  'a_m_m_og_boss_01',
  'a_m_m_paparazzi_01',
  'a_m_m_polynesian_01',
  'a_m_m_prolhost_01',
  'a_m_m_rurmeth_01',
  'a_m_m_salton_01',
  'a_m_m_salton_02',
  'a_m_m_salton_03',
  'a_m_m_salton_04',
  'a_m_m_skater_01',
  'a_m_m_skidrow_01',
  'a_m_m_socenlat_01',
  'a_m_m_soucent_01',
  'a_m_m_soucent_02',
  'a_m_m_soucent_03',
  'a_m_m_soucent_04',
  'a_m_m_stlat_02',
  'a_m_m_tennis_01',
  'a_m_m_tourist_01',
  'a_m_m_trampbeac_01',
  'a_m_m_tramp_01',
  'a_m_m_tranvest_01',
  'a_m_m_tranvest_02',
  'a_m_o_beach_01',
  'a_m_o_genstreet_01',
  'a_m_o_ktown_01',
  'a_m_o_salton_01',
  'a_m_o_soucent_01',
  'a_m_o_soucent_02',
  'a_m_o_soucent_03',
  'a_m_o_tramp_01',
  'a_m_y_beachvesp_01',
  'a_m_y_beachvesp_02',
  'a_m_y_beach_01',
  'a_m_y_beach_02',
  'a_m_y_beach_03',
  'a_m_y_bevhills_01',
  'a_m_y_bevhills_02',
  'a_m_y_breakdance_01',
  'a_m_y_busicas_01',
  'a_m_y_business_01',
  'a_m_y_business_02',
  'a_m_y_business_03',
  'a_m_y_cyclist_01',
  'a_m_y_dhill_01',
  'a_m_y_downtown_01',
  'a_m_y_eastsa_01',
  'a_m_y_eastsa_02',
  'a_m_y_epsilon_01',
  'a_m_y_epsilon_02',
  'a_m_y_gay_01',
  'a_m_y_gay_02',
  'a_m_y_genstreet_01',
  'a_m_y_genstreet_02',
  'a_m_y_golfer_01',
  'a_m_y_hasjew_01',
  'a_m_y_hiker_01',
  'a_m_y_hipster_01',
  'a_m_y_hipster_02',
  'a_m_y_hipster_03',
  'a_m_y_indian_01',
  'a_m_y_jetski_01',
  'a_m_y_juggalo_01',
  'a_m_y_ktown_01',
  'a_m_y_ktown_02',
  'a_m_y_latino_01',
  'a_m_y_methhead_01',
  'a_m_y_mexthug_01',
  'a_m_y_motox_01',
  'a_m_y_motox_02',
  'a_m_y_musclbeac_01',
  'a_m_y_musclbeac_02',
  'a_m_y_polynesian_01',
  'a_m_y_roadcyc_01',
  'a_m_y_runner_01',
  'a_m_y_runner_02',
  'a_m_y_salton_01',
  'a_m_y_skater_01',
  'a_m_y_skater_02',
  'a_m_y_soucent_01',
  'a_m_y_soucent_02',
  'a_m_y_soucent_03',
  'a_m_y_soucent_04',
  'a_m_y_stbla_01',
  'a_m_y_stbla_02',
  'a_m_y_stlat_01',
  'a_m_y_stwhi_01',
  'a_m_y_stwhi_02',
  'a_m_y_sunbathe_01',
  'a_m_y_surfer_01',
  'a_m_y_vindouche_01',
  'a_m_y_vinewood_01',
  'a_m_y_vinewood_02',
  'a_m_y_vinewood_03',
  'a_m_y_vinewood_04',
  'a_m_y_yoga_01',
  'g_m_m_armboss_01',
  'g_m_m_armgoon_01',
  'g_m_m_armlieut_01',
  'g_m_m_chemwork_01',
  'g_m_m_chiboss_01',
  'g_m_m_chicold_01',
  'g_m_m_chigoon_01',
  'g_m_m_chigoon_02',
  'g_m_m_korboss_01',
  'g_m_m_mexboss_01',
  'g_m_m_mexboss_02',
  'g_m_y_armgoon_02',
  'g_m_y_azteca_01',
  'g_m_y_ballaeast_01',
  'g_m_y_ballaorig_01',
  'g_m_y_ballasout_01',
  'g_m_y_famca_01',
  'g_m_y_famdnf_01',
  'g_m_y_famfor_01',
  'g_m_y_korean_01',
  'g_m_y_korean_02',
  'g_m_y_korlieut_01',
  'g_m_y_lost_01',
  'g_m_y_lost_02',
  'g_m_y_lost_03',
  'g_m_y_mexgang_01',
  'g_m_y_mexgoon_01',
  'g_m_y_mexgoon_02',
  'g_m_y_mexgoon_03',
  'g_m_y_pologoon_01',
  'g_m_y_pologoon_02',
  'g_m_y_salvaboss_01',
  'g_m_y_salvagoon_01',
  'g_m_y_salvagoon_02',
  'g_m_y_salvagoon_03',
  'g_m_y_strpunk_01',
  'g_m_y_strpunk_02',
  'mp_m_claude_01',
  'mp_m_exarmy_01',
  'mp_m_shopkeep_01',
  's_m_m_ammucountry',
  's_m_m_autoshop_01',
  's_m_m_autoshop_02',
  's_m_m_bouncer_01',
  's_m_m_chemsec_01',
  's_m_m_cntrybar_01',
  's_m_m_dockwork_01',
  's_m_m_doctor_01',
  's_m_m_fiboffice_01',
  's_m_m_fiboffice_02',
  's_m_m_gaffer_01',
  's_m_m_gardener_01',
  's_m_m_gentransport',
  's_m_m_hairdress_01',
  's_m_m_highsec_01',
  's_m_m_highsec_02',
  's_m_m_janitor',
  's_m_m_lathandy_01',
  's_m_m_lifeinvad_01',
  's_m_m_linecook',
  's_m_m_lsmetro_01',
  's_m_m_mariachi_01',
  's_m_m_marine_01',
  's_m_m_marine_02',
  's_m_m_migrant_01',
  's_m_m_movalien_01',
  's_m_m_movprem_01',
  's_m_m_movspace_01',
  's_m_m_pilot_01',
  's_m_m_pilot_02',
  's_m_m_postal_01',
  's_m_m_postal_02',
  's_m_m_scientist_01',
  's_m_m_security_01',
  's_m_m_strperf_01',
  's_m_m_strpreach_01',
  's_m_m_strvend_01',
  's_m_m_trucker_01',
  's_m_m_ups_01',
  's_m_m_ups_02',
  's_m_o_busker_01',
  's_m_y_airworker',
  's_m_y_ammucity_01',
  's_m_y_armymech_01',
  's_m_y_autopsy_01',
  's_m_y_barman_01',
  's_m_y_baywatch_01',
  's_m_y_blackops_01',
  's_m_y_blackops_02',
  's_m_y_busboy_01',
  's_m_y_chef_01',
  's_m_y_clown_01',
  's_m_y_construct_01',
  's_m_y_construct_02',
  's_m_y_cop_01',
  's_m_y_dealer_01',
  's_m_y_devinsec_01',
  's_m_y_dockwork_01',
  's_m_y_doorman_01',
  's_m_y_dwservice_01',
  's_m_y_dwservice_02',
  's_m_y_factory_01',
  's_m_y_garbage',
  's_m_y_grip_01',
  's_m_y_marine_01',
  's_m_y_marine_02',
  's_m_y_marine_03',
  's_m_y_mime',
  's_m_y_pestcont_01',
  's_m_y_pilot_01',
  's_m_y_prismuscl_01',
  's_m_y_prisoner_01',
  's_m_y_robber_01',
  's_m_y_shop_mask',
  's_m_y_strvend_01',
  's_m_y_uscg_01',
  's_m_y_valet_01',
  's_m_y_waiter_01',
  's_m_y_winclean_01',
  's_m_y_xmech_01',
  's_m_y_xmech_02',
  'u_m_m_aldinapoli',
  'u_m_m_bankman',
  'u_m_m_bikehire_01',
  'u_m_m_fibarchitect',
  'u_m_m_filmdirector',
  'u_m_m_glenstank_01',
  'u_m_m_griff_01',
  'u_m_m_jesus_01',
  'u_m_m_jewelsec_01',
  'u_m_m_jewelthief',
  'u_m_m_markfost',
  'u_m_m_partytarget',
  'u_m_m_prolsec_01',
  'u_m_m_promourn_01',
  'u_m_m_rivalpap',
  'u_m_m_spyactor',
  'u_m_m_willyfist',
  'u_m_o_finguru_01',
  'u_m_o_taphillbilly',
  'u_m_o_tramp_01',
  'u_m_y_abner',
  'u_m_y_antonb',
  'u_m_y_babyd',
  'u_m_y_baygor',
  'u_m_y_burgerdrug_01',
  'u_m_y_chip',
  'u_m_y_cyclist_01',
  'u_m_y_fibmugger_01',
  'u_m_y_guido_01',
  'u_m_y_gunvend_01',
  'u_m_y_imporage',
  'u_m_y_mani',
  'u_m_y_militarybum',
  'u_m_y_paparazzi',
  'u_m_y_party_01',
  'u_m_y_pogo_01',
  'u_m_y_prisoner_01',
  'u_m_y_proldriver_01',
  'u_m_y_rsranger_01',
  'u_m_y_sbike',
  'u_m_y_staggrm_01',
  'u_m_y_tattoo_01',
  'u_m_y_zombie_01',
  'u_m_y_hippie_01',
  'a_m_y_hippy_01',
  'a_m_y_stbla_m',
  'ig_terry_m',
  'a_m_m_ktown_m',
  'a_m_y_skater_m',
  'u_m_y_coop',
  'ig_car3guy1_m',
  'tony',
  'g_m_m_chigoon_02_m',
  'a_m_o_acult_01',
}

function callPolice(coords,type) --type can be items or drugs
  --your code to call police
  -- exports['core_dispatch']:addCall("10-90", "Venda de drogas", {
  --     {icon="fa-ruler", info="Sem informações"}
  -- }, {coords.x, coords.y, coords.z}, "police", 3000, 11, 5 )
end