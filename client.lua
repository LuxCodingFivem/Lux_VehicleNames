ESX = exports['es_extended']:getSharedObject()

RegisterCommand(Config.AddVehicleNameCommand, function(source, args)
    ESX.TriggerServerCallback('Lux_VehicleNames:getIdentifier', function(Identifier) 
        if Config.TrustedIdentifiers[Identifier] then 
            local string = ''
            for i = 1, #args, 1 do 
                string = string .. args[i] .. ' '
            end

            local PlayerPed = PlayerPedId()
            local vehiclename = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPed)))
            TriggerServerEvent('Lux_VehicleNames:AddVehicleName', vehiclename, string)
        else
            ESX.ShowNotification(string.format(Translation[Config.Locale]['no_access']))
        end
    end)
end, false)

RegisterCommand(Config.EditVehicleNameCommand, function(source, args)
    ESX.TriggerServerCallback('Lux_VehicleNames:getIdentifier', function(Identifier) 
        if Config.TrustedIdentifiers[Identifier] then 
            local string = ''
            for i = 1, #args, 1 do 
                string = string .. args[i] .. ' '
            end

            local PlayerPed = PlayerPedId()
            local vehiclename = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPed)))
            TriggerServerEvent('Lux_VehicleNames:EditVehicleName', vehiclename, string)
        else
            ESX.ShowNotification(string.format(Translation[Config.Locale]['no_access']))
        end
    end)
end, false)

RegisterCommand(Config.DeleteVehicleNameCommand, function(source, args)
    ESX.TriggerServerCallback('Lux_VehicleNames:getIdentifier', function(Identifier) 
        if Config.TrustedIdentifiers[Identifier] then 
            local PlayerPed = PlayerPedId()
            local vehiclename = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPed)))
            TriggerServerEvent('Lux_VehicleNames:DeleteVehicleName', vehiclename)
        else
            ESX.ShowNotification(string.format(Translation[Config.Locale]['no_access']))
        end
    end)
end, false)

RegisterNetEvent('Lux_VehicleNames:UpdateVehicleNamesCL')
AddEventHandler('Lux_VehicleNames:UpdateVehicleNamesCL', function(result)
    for k, v in pairs(result) do 
        AddTextEntry(v.vehicle, v.name)
    end
end)

RegisterNetEvent('Lux_VehicleNames:DeleteVehicleName')
AddEventHandler('Lux_VehicleNames:DeleteVehicleName', function(vehiclename)
    AddTextEntry(vehiclename, vehiclename)
end)

function AddTextEntry(key, value)
    Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    TriggerServerEvent('Lux_VehicleNames:UpdateVehicleNamesSV')
end)
