function drawInstructionalText(msg, coords)
    AddTextEntry('instructionalText', msg)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('instructionalText')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(2, false, false, -1)
end

function ShowNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(0,1)
end

function vehicleCreated(vehicle)
    
end