Config = {

-- COMPATABILITY
UsingCoreDispatch = false,
UsingCoreSkills = true,
ExperianceRobbery = 80, -- Experiance gained from a robbery

-- BASE SETTINGS
MinimumTargets = 10, -- Minimum amount of targets player has to click to rob
MaximumTargets = 20, -- Maximum amount of targets player has to click to rob

TimeBeforeRobbing = 20, -- Time in minutes before cash register is available to rob again

RequiresItemToRob = '',
StoreMasterKeyItem = '',

BlipSprite = 59, -- Blip sprite (https://docs.fivem.net/docs/game-references/blips/)
BlipColor = 24, -- Blip color (https://docs.fivem.net/docs/game-references/blips/)




Stores = {

['paleto_seven_eleven'] = {

        Label = 'Walmart',
        Coords = vector3(68.99, -1769.03, 29.29),
        Radius = 30.0, -- Radius of the store
        Balance = 1000, -- Amount of money store has
        Profit = 0.5, -- Percent store recieves from a sale
        Checkout = vector3(47.19, -1757.75, 29.3), -- Where in store checkout is
        CashRegisters = { -- Cash registers of store that can be robbed
            [1] = {Coords = vector3(44.3, -1761.18, 29.3), Robbed = 0},
            [2] = {Coords = vector3(41.97, -1764.04, 29.3), Robbed = 0},
            [3] = {Coords = vector3(39.12, -1767.3, 29.3), Robbed = 0},
        },
        Sections = { 
            ['drinks'] = {

                Coords = vector3(74.1, -1757.07, 29.29),
                Radius = 2.0,
                Items = {
                    ['water'] = 1,
                    ['coffee'] = 1,
                    ['apple_juice'] = 1
                }
                
            }
        }


}


},

Text = {

['cant_be_opened'] = 'This cash register cant be opened',
['cashregister_cleared'] = 'You took money from cash register',
['cashregister_no_cash'] = 'No cash in register!',
['no_item'] = 'You dont have an item to crack this',
['no_key'] = 'You require key to open this!'

}

}



function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
