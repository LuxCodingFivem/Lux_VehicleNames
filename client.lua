ESX = exports['es_extended']:getSharedObject()

RegisterCommand(Config.AddVehicleNameCommand, function(source, args)
    ESX.TriggerServerCallback('Lux_VehicleNames:getIdentifier', function(Identifier) 
        if Config.TrustedIdentifiers[Identifier] then 
            local string = ''
            for i = 1, #args, 1 do 
                string = string .. args[i] .. ' '
            end

            local PlayerPed = PlayerPedId()
            if IsPedInAnyVehicle(PlayerPed) then 
                local vehiclename = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPed)))
                TriggerServerEvent('Lux_VehicleNames:AddVehicleName', vehiclename, string)
            else
                ESX.ShowNotification(string.format(Translation[Config.Locale]['not_in_vehicle']))
            end
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
            if IsPedInAnyVehicle(PlayerPed) then 
                local vehiclename = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPed)))
                TriggerServerEvent('Lux_VehicleNames:EditVehicleName', vehiclename, string)
            else
                ESX.ShowNotification(string.format(Translation[Config.Locale]['not_in_vehicle']))
            end
        else
            ESX.ShowNotification(string.format(Translation[Config.Locale]['no_access']))
        end
    end)
end, false)

RegisterCommand(Config.DeleteVehicleNameCommand, function(source, args)
    ESX.TriggerServerCallback('Lux_VehicleNames:getIdentifier', function(Identifier) 
        if Config.TrustedIdentifiers[Identifier] then 
            local PlayerPed = PlayerPedId()
            if IsPedInAnyVehicle(PlayerPed) then 
                local vehiclename = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPed)))
                TriggerServerEvent('Lux_VehicleNames:DeleteVehicleName', vehiclename)
            else
                ESX.ShowNotification(string.format(Translation[Config.Locale]['not_in_vehicle']))
            end
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

TriggerEvent('chat:addSuggestion', '/AddVehicleName', string.format(Translation[Config.Locale]['add_vehicle_name_chat_suggest']),
             { 
                { name = string.format(Translation[Config.Locale]['chat_suggest_vehicle_name']), help = string.format(Translation[Config.Locale]['vehicle_name_chat_suggest_vehicle_name']) },
            })

TriggerEvent('chat:addSuggestion', '/EditVehicleName', string.format(Translation[Config.Locale]['edit_vehicle_name_chat_suggest']),
             { 
                { name = string.format(Translation[Config.Locale]['chat_suggest_vehicle_name']), help = string.format(Translation[Config.Locale]['vehicle_name_chat_suggest_vehicle_name']) },
            })

TriggerEvent('chat:addSuggestion', '/DeleteVehicleName', string.format(Translation[Config.Locale]['delete_vehicle_name_chat_suggest']),{})