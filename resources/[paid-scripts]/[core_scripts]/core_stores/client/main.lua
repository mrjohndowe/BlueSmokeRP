local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

QBCore = exports['qb-core']:GetCoreObject()

CurrentStore = nil
CurrentSection = nil
CurrentCashregister = nil
interactive = false
OpenedCheckout = false


loadDict = function(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

function nearSection()


    local coords = GetEntityCoords(PlayerPedId())

    for k,v in pairs(Config.Stores[CurrentStore].Sections) do

        if #(coords - v.Coords) < v.Radius then

            return k

        end


    end

    return nil


end

function nearCashregister()

    local coords = GetEntityCoords(PlayerPedId())

   for k,v in pairs(Config.Stores[CurrentStore].CashRegisters) do
         if #(coords - v.Coords) < 0.7 then

            return k

       end
   end


 return nil
       




end

function nearCheckout()

    local coords = GetEntityCoords(PlayerPedId())

   

        if #(coords - Config.Stores[CurrentStore].Checkout) < 2.0 then

            return true

        else
            return false
        end





end

function nearStore()

    local coords = GetEntityCoords(PlayerPedId())

    for k,v in pairs(Config.Stores) do

        if #(coords - v.Coords) < v.Radius then

            return k

        end


    end

    return nil


end

function openPayment()

SendNUIMessage({

    type = 'openPayment'

})



    end

    function openCashregister()


SendNUIMessage({

    type = 'openCashregister'

})

    end


function robCashregister()

SetNuiFocus(true, true)
TriggerScreenblurFadeIn(1000)
loadDict('mp_prison_break')
TaskPlayAnim(PlayerPedId(), "mp_prison_break", "hack_loop", 8.0, -8.0, -1, 47, 0, false, false, false)
SendNUIMessage({

    type = 'openTargets',
    targets = math.random(Config.MinimumTargets, Config.MaximumTargets)

})

end




function openSection(section)

SendNUIMessage({

    type = 'enterSection',
    section = section

})



    end




function enterStore(store)


local PlayerData = QBCore.Functions.GetPlayerData()
Citizen.Wait(1000)
SendNUIMessage({

    type = 'enterStore',
    store = store,
    config = Config

})




end

RegisterNetEvent('core_stores:client:sendMessage', function(msg)
SendTextMessage(msg)
end)

RegisterNetEvent('core_stores:client:checkoutStatus', function(value)

Citizen.Wait(700)
SendNUIMessage({

    type = 'checkoutStatus',
    value = value

})

end)

RegisterNUICallback(
    "checkout",
    function(data)
       TriggerServerEvent('core_stores:server:checkout', data['basket'], data['basketValue'], data['method'], CurrentStore)
    end
)

RegisterNUICallback(
    "close",
    function(data)
    TriggerScreenblurFadeOut(1000)
    SetNuiFocus(false, false)
    ClearPedTasks(PlayerPedId())
    
    end
)


RegisterNUICallback(
    "openCashregister",
    function(data)
        TriggerServerEvent('core_stores:server:openCashregister', CurrentStore)
    end
)

RegisterNUICallback(
    "tryCashregister",
    function(data)
        local method = data['method']

        QBCore.Functions.TriggerCallback('core_stores:server:canOpen', function(can)

            if can and method == 'rob' then
                
                robCashregister()

           elseif can and method =='key' then
                TriggerServerEvent('core_stores:server:openCashregister', CurrentStore)
           else
               SendTextMessage(Config.Text['cant_be_opened'])
           end

    end, method, CurrentCashregister, CurrentStore)
       
    end
)




Citizen.CreateThread(function()

        for k, v in pairs(Config.Stores) do
           
                local blip = AddBlipForCoord(v.Coords)

                SetBlipSprite(blip, Config.BlipSprite)
                SetBlipScale(blip, 0.8)
                SetBlipColour(blip, Config.BlipColor)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(v.Label)
                EndTextCommandSetBlipName(blip)
            
        end
end)

Citizen.CreateThread(function()

    while true do

        if CurrentStore then

        local nearSection = nearSection()
        local nearCheckout = nearCheckout()
        local nearCashregister = nearCashregister()

        if nearSection and not CurrentSection then
                CurrentSection = nearSection

                openSection(CurrentSection)
        elseif not nearSection and CurrentSection then
                    
                    SendNUIMessage({type = 'closeSection'})
                    CurrentSection = nil
        

        elseif nearCashregister and not CurrentCashregister then
                CurrentCashregister = nearCashregister

                openCashregister(CurrentSection)
        elseif not nearCashregister and CurrentCashregister then
                    
                    SendNUIMessage({type = 'closeCashregister'})
                    CurrentCashregister = nil
        

        elseif nearCheckout and not OpenedCheckout then
            
                OpenedCheckout = nearCheckout
                openPayment()
         elseif not nearCheckout and OpenedCheckout then
                    
                    SendNUIMessage({type = 'closePayment'})
                    OpenedCheckout = false
        end


           if IsDisabledControlJustPressed(0, 19) then
                    
                    if not interactive then
                        interactive = true
                        SendNUIMessage({type = 'interactive', value = true})
                        SetNuiFocus(true, true)
                    end


                  Citizen.Wait(20)
            end

              if IsDisabledControlJustReleased(0, 19) then


                    if interactive then
                        SetNuiFocus(false, false)
                         SendNUIMessage({type = 'interactive', value = false})
                        interactive = false
                    end
                end

           


        Citizen.Wait(0)

    else

         Citizen.Wait(1000)

     end


    end


end)

Citizen.CreateThread(function()

    while true do


        local nearStore = nearStore()

        if nearStore and not CurrentStore then
          
                enterStore(nearStore)
                CurrentStore = nearStore


        elseif not nearStore then
            CurrentStore = nil
            CurrentSection = nil
            interactive = false
           SendNUIMessage({type = 'closeStore'})
        end

        if CurrentStore then
            local PlayerData = QBCore.Functions.GetPlayerData()
                 SendNUIMessage({
                    type = 'updateMoney',
                    bank = PlayerData.money['cash'],
                    money = PlayerData.money['bank']
                 })
        end

         Citizen.Wait(1000)


    end


end)


