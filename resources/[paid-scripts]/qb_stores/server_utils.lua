QBCore = exports['qb-core']:GetCoreObject()

function stores_addInventoryItem(source,item,amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    return xPlayer.Functions.AddItem(item, amount)
end

function beforeBuyItem(source,market_id,xPlayer,item_id,amount)
    -- Here you can do any verification when a player is buying an item in a market, like if player has gun license or anything else you want to check before buy the item. return true or false
    return true
end

function beforeBuyMarket(source,key,xPlayer)
    -- Here you can do any verification when a player is buying a market, like if player has the permission to that or anything else you want to check before buy the market. return true or false
    return true
end

-- Change the mysql driver there. Remove the mysql-async from fxmanifest
function MySQL_Sync_execute(sql,params)
    MySQL.Sync.execute(sql, params)
    -- exports['ghmattimysql']:executeSync(sql, params)
end

function MySQL_Sync_fetchAll(sql,params)
    return MySQL.Sync.fetchAll(sql, params)
    -- return exports['ghmattimysql']:executeSync(sql, params)
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end