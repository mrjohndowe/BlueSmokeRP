TriggerEvent('chat:addSuggestion', '/jack', 'Use an inflatable jack on the nearest vehicle', {
    { name="setup/remove", help="Setup or remove an inflatable jack" },
})

TriggerEvent('chat:addSuggestion', '/chock', 'Use a car chock on the nearest vehicle', {
    { name="setup/remove", help="Setup or remove a car chock" },
})

function toFloat(integer)
    return integer + 0.0
end

function raycast()
    local ped = PlayerPedId()
    local location = GetEntityCoords(ped)
    local offSet = GetOffsetFromEntityInWorldCoords(ped, 0.0, 10.0, 0.0)
    local shapeTest = StartShapeTestCapsule(location.x, location.y, location.z, offSet.x, offSet.y, offSet.z, 10.0, 2, ped, 0)
    local retval, hit, endCoords, surfaceNormal, entityHit =
	GetShapeTestResult(shapeTest)
    return entityHit
end

function getNearestVehicle(radius)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 then return vehicle end
    local veh = GetClosestVehicle(coords.x+0.0001,coords.y+0.0001,coords.z+0.0001, radius+5.0001, 0, 8192+4096+4+2+1)
    if not IsEntityAVehicle(veh) then veh = GetClosestVehicle(coords.x+0.0001,coords.y+0.0001,coords.z+0.0001, radius+5.0001, 0, 4+2+1) end
    return veh
end