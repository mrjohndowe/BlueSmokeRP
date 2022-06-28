QBCore =  exports['qb-core']:GetCoreObject()
Harvesting = {}

CreateThread(
    function()
        updatePlants()
    end
)

function updatePlants()
    Citizen.SetTimeout(
        Config.GlobalGrowthRate * 1000,
        function()
            updatePlants()
        end
    )

    --DEAD PLANTS
    exports.oxmysql:query(
        "SELECT id FROM plants WHERE (water < 2 OR food < 2) AND rate > 0",
        {},
        function(info)
			if info then
				for _, v in ipairs(info) do
					exports.oxmysql:update(
						"UPDATE `plants` SET `rate` = :rate, `food` = :food, `water` = :water WHERE id = :id",
						{["id"] = v.id, ["rate"] = 0, ["food"] = 0, ["water"] = 0},
						function()
						end
					)
				end
			end
        end
    )
	
	--CUSTOM DEAD PLANTS
	-- exports.oxmysql:query(
        -- "SELECT id FROM plants WHERE (water = 0 OR food = 0) AND rate = 0",
        -- {},
        -- function(info)
            -- for _, v in ipairs(info) do
                -- exports.oxmysql:update(
					-- "DELETE FROM `plants` WHERE id = :id",
                    -- --"UPDATE `plants` SET `rate` = :rate, `food` = :food, `water` = :water WHERE id = :id",
                    -- {["id"] = v.id},
                    -- function()
                    -- end
                -- )
            -- end
        -- end
    -- )
	--END CUSTOM

    -- ALIVE PLANT REDUCTION
    exports.oxmysql:update(
          "UPDATE `plants` SET `growth`=`growth` + (0.01 * `rate`) , `food` = `food` - (0.02 * `rate`), `water` = `water` -  (0.02 * `rate`) WHERE (water >= 2 OR food >= 2) AND (growth <= 100 - (0.01 * `rate`) )",
        {},
        function()
            TriggerClientEvent("core_drugs:growthUpdate", -1)
        end
    )

    -- GROW PLANTS
    exports.oxmysql:query(
        "SELECT id, growth FROM plants WHERE (growth >= 30 AND growth <= 31) OR (growth >= 80 AND growth <= 81)",
        {},
        function(info)
			if info then
				for _, v in ipairs(info) do
					TriggerClientEvent("core_drugs:growPlant", -1, v.id, v.growth)
				end
			end
        end
    )
end

function proccesing(player, type)
    TriggerClientEvent("core_drugs:process", player, type)
end

function plant(player, type)
    TriggerClientEvent("core_drugs:plant", player, type)
end

function drug(player, type)
    TriggerClientEvent("core_drugs:drug", player, type)
end

function addProcess(type, coords, rot)
    exports.oxmysql:update(
        "INSERT INTO processing (type, item, time, coords, rot) VALUES (:type, :item, :time, :coords, :rot)",
        {
            ["coords"] = json.encode({x = coords[1], y = coords[2], z = coords[3]}),
            ["type"] = type,
            ["item"] = "{}",
            ["time"] = 0,
            ["rot"] = rot
        },
        function(id)

             exports.oxmysql:scalar('SELECT id FROM processing WHERE coords = ?', {json.encode({x = coords[1], y = coords[2], z = coords[3]})}, function(result)
         TriggerClientEvent("core_drugs:addProcess", -1, type, coords, result, rot)
    end)

           
        end
    )
end

function addPlant(type, coords, id)
    local rate = Config.DefaultRate
    local zone = nil

    for _, v in ipairs(Config.Zones) do
        if #(v.Coords - coords) < v.Radius then
            local contains = false
            for _, g in ipairs(v.Exclusive) do
                if g == type then
                    contains = true
                end
            end

            if contains then
                rate = v.GrowthRate
                zone = v
            end
        end
    end

    if Config.OnlyZones then
        if zone == nil then
            TriggerClientEvent("core_drugs:sendMessage", id, Config.Text["cant_plant"])
            return
        end
    end

    exports.oxmysql:update(
        "INSERT INTO plants (coords, type, growth, rate , water , food) VALUES (:coords, :type, :growth, :rate, :water, :food)",
        {
            ["coords"] = json.encode({x = coords[1], y = coords[2], z = coords[3]}),
            ["type"] = type,
            ["growth"] = 0,
            ["rate"] = rate,
            ["food"] = 10,
            ["water"] = 10
        },
        function(id)
            exports.oxmysql:scalar('SELECT id FROM plants WHERE coords = ?', {json.encode({x = coords[1], y = coords[2], z = coords[3]})}, function(result)
         TriggerClientEvent("core_drugs:addPlant", -1, type, coords, result)
    end)
        end
    )
end

RegisterServerEvent("core_drugs:addPlant")
AddEventHandler(
    "core_drugs:addPlant",
    function(type, coords)
        local Player = QBCore.Functions.GetPlayer(source)
        addPlant(type, coords, source)

        Player.Functions.RemoveItem(type, 1)
    end
)

RegisterServerEvent("core_drugs:processed")
AddEventHandler(
    "core_drugs:processed",
    function(type, amount)
        local Player = QBCore.Functions.GetPlayer(source)
        local table = Config.ProcessingTables[type]

      
          
                for k, v in pairs(table.Ingrediants) do
                    if Player.Functions.GetItemByName(k).amount < v then
                        TriggerClientEvent("core_drugs:sendMessage", source, Config.Text["missing_ingrediants"])
                        return
                    else
                        Player.Functions.RemoveItem(k, v * amount)
                    end
                end

                 if Player.Functions.AddItem(table.Item, amount) then

                 else
                    TriggerClientEvent("core_drugs:sendMessage", source, Config.Text["cant_hold"])
                 end
            
    
    end
)

RegisterServerEvent("core_drugs:addProcess")
AddEventHandler(
    "core_drugs:addProcess",
    function(type, coords, rot)
         local Player = QBCore.Functions.GetPlayer(source)
        addProcess(type, coords, rot)

        Player.Functions.RemoveItem(type, 1)
    end
)

RegisterServerEvent("core_drugs:tableStatus")
AddEventHandler(
    "core_drugs:tableStatus",
    function(id, status)
        TriggerClientEvent("core_drugs:changeTableStatus", -1, id, status)
    end
)

RegisterServerEvent("core_drugs:removeItem")
AddEventHandler(
    "core_drugs:removeItem",
    function(item, count)
        local Player = QBCore.Functions.GetPlayer(source)

        Player.Functions.RemoveItem(item, count)


    end
)

RegisterServerEvent("core_drugs:sellDrugs")
AddEventHandler(
    "core_drugs:sellDrugs",
    function(prices)
        local Player = QBCore.Functions.GetPlayer(source)

        local pay = 0

        for k, v in pairs(prices) do
            if not Player.Functions.GetItemByName(k) then print('[Core Drugs] Item is not found ' .. k) end
            if Player.Functions.GetItemByName(k).amount > 0 then
                pay = pay + (v * Player.Functions.GetItemByName(k).amount)
                Player.Functions.RemoveItem(k, Player.Functions.GetItemByName(k).amount)
            end
        end

        if pay > 0 then
            Player.Functions.AddMoney('cash', pay)
            TriggerClientEvent("core_drugs:sendMessage", source, Config.Text["sold_dealer"] .. pay)
        else
            TriggerClientEvent("core_drugs:sendMessage", source, Config.Text["no_drugs"])
        end
    end
)

RegisterServerEvent("core_drugs:deletePlant")
AddEventHandler(
    "core_drugs:deletePlant",
    function(id)
        exports.oxmysql:update(
            "DELETE FROM plants WHERE id = :id",
            {["id"] = id},
            function()
            end
        )
        TriggerClientEvent('core_drugs:deletePlant', -1, id)
    end
)

RegisterServerEvent("core_drugs:deleteTable")
AddEventHandler(
    "core_drugs:deleteTable",
    function(id, type)
        local Player = QBCore.Functions.GetPlayer(source)

        exports.oxmysql:update(
            "DELETE FROM processing WHERE id = :id",
            {["id"] = id},
            function()
            end
        )

        Player.Functions.AddItem(type, 1)
        TriggerClientEvent('core_drugs:deleteProcessing', -1, id)
    end
)

RegisterServerEvent("core_drugs:updatePlant")
AddEventHandler(
    "core_drugs:updatePlant",
    function(id, info)
        exports.oxmysql:update(
            "UPDATE `plants` SET `growth`=:growth, `rate` = :rate, `food` = :food, `water` = :water WHERE id = :id",
            {
                ["id"] = id,
                ["growth"] = info.growth,
                ["rate"] = info.rate,
                ["food"] = info.food,
                ["water"] = info.water
            },
            function()
            end
        )
    end
)

RegisterServerEvent("core_drugs:harvest")
AddEventHandler(
    "core_drugs:harvest",
    function(type, info)
        local src = source
        local typeInfo = Config.Plants[type]
        local Player = QBCore.Functions.GetPlayer(src)

        local val = typeInfo.Amount * tonumber(info.growth) / 100
        val = math.floor(val + 0.5)

        if info.growth < 20 then
            val = 0
        end

        if (typeInfo.SeedChance >= math.random(1, 100)) then
            Player.Functions.AddItem(type, 1)
        end

        Player.Functions.AddItem(typeInfo.Produce, val)
    end
)

RegisterServerEvent("core_drugs:harvested")
AddEventHandler(
    "core_drugs:harvested",
    function(id)
        Harvesting[id] = nil
    end
)

QBCore.Functions.CreateCallback(
    "core_drugs:canHarvest",
    function(source, cb, id)

        if not Harvesting[id] then
        Harvesting[id] = true
        cb(true)

        else
        cb(false)
        end

    end)

QBCore.Functions.CreateCallback(
    "core_drugs:getInfo",
    function(source, cb)
        exports.oxmysql:query(
            "SELECT * FROM plants WHERE 1",
            {},
            function(infoPlants)
                exports.oxmysql:query(
                    "SELECT * FROM processing WHERE 1",
                    {},
                    function(infoProcess)
                        local plants = {}
                        local process = {}

                        for _, v in ipairs(infoPlants) do
                            local coords = json.decode(v.coords) or {x = 0, y = 0, z = 0}
                            local data = {growth = v.growth, rate = v.rate, water = v.water, food = v.food}
                            coords = vector3(coords.x, coords.y, coords.z)

                            plants[v.id] = {type = v.type, coords = coords, info = data}
                        end

                        for _, g in ipairs(infoProcess) do
                            local coords = json.decode(g.coords) or {x = 0, y = 0, z = 0}
                            local data = json.decode(g.item) or {}
                            coords = vector3(coords.x, coords.y, coords.z)

                            process[g.id] = {
                                type = g.type,
                                coords = coords,
                                item = data,
                                time = g.time,
                                rot = g.rot,
                                usable = true
                            }
                        end

                        cb(plants, process)
                    end
                )
            end
        )
    end
)

QBCore.Functions.CreateCallback(
    "core_drugs:getPlant",
    function(source, cb, id)
        exports.oxmysql:query(
            "SELECT growth , rate , food , water FROM plants WHERE id = :id LIMIT 1",
            {["id"] = id},
            function(info)
                local data = {growth = info[1].growth, rate = info[1].rate, water = info[1].water, food = info[1].food}

                cb(data)
            end
        )
    end
)

QBCore.Functions.CreateCallback(
    "core_drugs:getItem",
    function(source, cb, cTable)

         local Player = QBCore.Functions.GetPlayer(source)

         local percent = 0
         local item = nil

        for k, i in pairs(cTable) do

        if Player.Functions.GetItemByName(k) then
           if Player.Functions.GetItemByName(k).amount > 0 then

                item = k
                percent = i
             break
           end

        end
    end

        cb(percent, item)
       
    end
)
