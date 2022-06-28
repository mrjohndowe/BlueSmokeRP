QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('core_stores:server:checkout', function(basket, basketValue, checkoutMethod, store)

    local source = source
    local Player = QBCore.Functions.GetPlayer(source)


    if checkoutMethod == 'bank' then

       local bank =  Player.Functions.GetMoney('bank')

       if bank >= basketValue then

            for k,v in pairs(basket) do

                Player.Functions.AddItem(k ,v)


            end
            Config.Stores[store].Balance =  Config.Stores[store].Balance + (basketValue * Config.Stores[store].Profit)
            Player.Functions.RemoveMoney('bank', basketValue)
             TriggerClientEvent('core_stores:client:checkoutStatus', source, true)
            
       else
        TriggerClientEvent('core_stores:client:checkoutStatus', source, false)
       end

    elseif checkoutMethod == 'cash' then

            local cash = Player.Functions.GetMoney('cash')

             if cash >= basketValue then

            for k,v in pairs(basket) do

                Player.Functions.AddItem(k ,v)


            end
             Config.Stores[store].Balance =  Config.Stores[store].Balance + (basketValue * Config.Stores[store].Profit)
            Player.Functions.RemoveMoney('cash', basketValue)
            TriggerClientEvent('core_stores:client:checkoutStatus', source, true)


       else
         TriggerClientEvent('core_stores:client:checkoutStatus', source, false)
       end

    end

end)


RegisterServerEvent('core_stores:server:openCashregister', function(store)

 local source = source
local Player = QBCore.Functions.GetPlayer(source)
if Config.Stores[store].Balance > 2 then
local payout = Config.Stores[store].Balance / #Config.Stores[store].CashRegisters

Player.Functions.AddMoney('cash', payout)
TriggerClientEvent('core_stores:client:sendMessage', source, Config.Text['cashregister_cleared'] .. ' +$' .. payout)
if Config.UsingCoreSkills then
   exports['core_skills']:AddExperience(source, Config.ExperianceRobbery)
end
else
TriggerClientEvent('core_stores:client:sendMessage', source, Config.Text['cashregister_no_cash'])
end


end)

QBCore.Functions.CreateCallback('core_stores:server:canOpen', function(source, cb, method, cashregister, store)
local Player = QBCore.Functions.GetPlayer(source)

if method == 'key' then

if Config.StoreMasterKeyItem ~= '' then
if (Player.Functions.GetItemByName(Config.StoreMasterKeyItem).amount or 0) > 0 then

        cb(true)

else
    TriggerClientEvent('core_stores:client:sendMessage', source, Config.Text['no_key'])
        cb(false)
end
else
    TriggerClientEvent('core_stores:client:sendMessage', source, Config.Text['no_key'])
        cb(false)
    end

else


    if Config.UsingCoreDispatch then
                local coords = Config.Stores[store].Coords
                TriggerEvent(
                    "core_dispatch:addCall",
                    "00-00", 
                    "Store Robbery",
                    {}, 
                    {coords[1], coords[2], coords[3]}, 
                    "police", 
                    5000, 
                    Config.BlipSprite, 
                    Config.BlipColor 
                )
    end

    if Config.RequiresItemToRob ~= '' then

        if (Player.Functions.GetItemByName(Config.RequiresItemToRob).amount or 0) > 0 then

                if os.time() - Config.Stores[store].CashRegisters[cashregister].Robbed >= (Config.TimeBeforeRobbing * 60) or Config.Stores[store].CashRegisters[cashregister].Robbed == 0 then 
 Config.Stores[store].CashRegisters[cashregister].Robbed = os.time()
            cb(true)
                else
                    cb(false)
                end

        else
            TriggerClientEvent('core_stores:client:sendMessage', source, Config.Text['no_item'])
            cb(false)
        end

    else
        if os.time() - Config.Stores[store].CashRegisters[cashregister].Robbed >= (Config.TimeBeforeRobbing * 60) or Config.Stores[store].CashRegisters[cashregister].Robbed == 0 then 
                Config.Stores[store].CashRegisters[cashregister].Robbed = os.time()
            cb(true)
                else
                    cb(false)
                end
    end
end


end)