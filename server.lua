ESX = exports['es_extended']:getSharedObject()

local VehicleNames = {}

ESX.RegisterServerCallback('Lux_VehicleNames:getIdentifier', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local Identifier = xPlayer.getIdentifier()

    cb(Identifier)
end)

RegisterServerEvent('Lux_VehicleNames:AddVehicleName')
AddEventHandler('Lux_VehicleNames:AddVehicleName', function(vehicle, name)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM lux_vehicle_names WHERE vehicle = @vehicle', {
        ['@vehicle'] = vehicle,
    }, function(result)
        if (#result > 0) then 
            xPlayer.showNotification(string.format(Translation[Config.Locale]['vehicle_name_allready_exist']))
        else
            MySQL.Async.execute('INSERT INTO lux_vehicle_names (vehicle, name) VALUES (@vehicle, @name)', {
                ['@vehicle'] = vehicle,
                ['@name'] = name,
            })
            Wait(1000)
            TriggerEvent('Lux_VehicleNames:UpdateVehicleNamesSV')
            xPlayer.showNotification(string.format(Translation[Config.Locale]['vehicle_name_added']))
        end
    end)
end)

RegisterServerEvent('Lux_VehicleNames:EditVehicleName')
AddEventHandler('Lux_VehicleNames:EditVehicleName', function(vehicle, name)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM lux_vehicle_names WHERE vehicle = @vehicle', {
        ['@vehicle'] = vehicle,
    }, function(result)
        if (#result > 0) then 
            MySQL.Async.execute('UPDATE lux_vehicle_names SET name = @name WHERE vehicle = @vehicle', {
                ['@vehicle'] = vehicle,
                ['@name'] = name,
            })
            Wait(1000)
            TriggerEvent('Lux_VehicleNames:UpdateVehicleNamesSV')
            xPlayer.showNotification(string.format(Translation[Config.Locale]['vehicle_name_edited']))
        else
            xPlayer.showNotification(string.format(Translation[Config.Locale]['vehicle_has_no_name']))
        end
    end)
end)

RegisterServerEvent('Lux_VehicleNames:DeleteVehicleName')
AddEventHandler('Lux_VehicleNames:DeleteVehicleName', function(vehicle)
    xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM lux_vehicle_names WHERE vehicle = @vehicle', {
        ['@vehicle'] = vehicle,
    }, function(result)
        if (#result > 0) then 
            MySQL.Async.execute('DELETE FROM lux_vehicle_names WHERE vehicle = @vehicle', {
                ['@vehicle'] = vehicle,
            })
            Wait(1000)
            TriggerClientEvent('Lux_VehicleNames:DeleteVehicleName', -1, vehicle)
            xPlayer.showNotification(string.format(Translation[Config.Locale]['vehicle_name_deleted']))
        else
            xPlayer.showNotification(string.format(Translation[Config.Locale]['vehicle_has_no_name']))
        end
    end)
end)

RegisterServerEvent('Lux_VehicleNames:UpdateVehicleNamesSV')
AddEventHandler('Lux_VehicleNames:UpdateVehicleNamesSV', function()
    MySQL.Async.fetchAll('SELECT * FROM lux_vehicle_names', {}, function(result)
        if (#result > 0) then
            TriggerClientEvent('Lux_VehicleNames:UpdateVehicleNamesCL', -1, result)
        end
    end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(xPlayer, isNew, skin)
    TriggerEvent('Lux_VehicleNames:UpdateVehicleNamesSV')
end)

