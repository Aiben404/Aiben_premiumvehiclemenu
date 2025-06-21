RegisterCommand("premvehmenu", function()
    TriggerServerEvent("premium_vehiclemenu:openMenu")
end)

RegisterNetEvent("premium_vehiclemenu:showMenu", function(vehicleList)
    local options = {}

    for _, veh in pairs(vehicleList) do
        table.insert(options, {
            title = veh.label,
            description = "Spawn " .. veh.label,
            onSelect = function()
                TriggerServerEvent("premium_vehiclemenu:spawnVehicle", veh.name)
            end
        })
    end

    lib.registerContext({
        id = 'premium_vehicle_menu',
        title = 'Premium Vehicle Menu',
        options = options
    })

    lib.showContext('premium_vehicle_menu')
end)

RegisterNetEvent("premium_vehiclemenu:spawn", function(vehicleName)
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 then
        DeleteVehicle(vehicle)
    end

    lib.notify({ type = 'inform', title = 'Spawning Vehicle', description = vehicleName })
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do Wait(0) end

    local veh = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
    TaskWarpPedIntoVehicle(playerPed, veh, -1)
    SetVehicleNumberPlateText(veh, "PREMIUM")
end)
