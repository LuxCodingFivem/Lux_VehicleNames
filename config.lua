Config = {}

Config.Locale = 'de' -- Translation en, de you can add more

Config.AddVehicleNameCommand = 'AddVehicleName' -- Command to Add Vehicle Name
Config.EditVehicleNameCommand = 'EditVehicleName' -- Command to Edit Vehicle Name
Config.DeleteVehicleNameCommand = 'DeleteVehicleName' -- Command to Delete Vehicle Name

Config.TrustedIdentifiers = {
    ['char1:8d4aa45e65b00ebb8e8ef9426ec6e5ee4ff5583d'] = true, -- Jason Blossom
}

Translation = {
    ['de'] = {
        ['no_access'] = '~r~Du hast keinen Zugriff auf diesen Befehl!',
        ['vehicle_name_allready_exist'] = '~r~Für dieses Fahrzeug existiert bereits ein Vehicle Name!',
        ['vehicle_name_added'] = '~g~Du hast den Fahrzeug Namen Erfolgreich hinzugefügt',
        ['vehicle_has_no_name'] = '~r~Dieses Fahrzeug hat noch keinen Namen!',
        ['vehicle_name_edited'] = '~g~Du hast den Fahrzeug Namen erfolgreich geändert',
        ['vehicle_name_deleted'] = '~g~Du hast den Fahrzeug Namen Erfolgreich gelöscht',
    },
    ['en'] = {
        ['no_access'] = '~r~You do not have access to this command!',
        ['vehicle_name_allready_exist'] = '~r~A vehicle name already exists for this vehicle!',
        ['vehicle_name_added'] = '~g~You have successfully added the vehicle name',
        ['vehicle_has_no_name'] = '~r~This vehicle does not yet have a name!',
        ['vehicle_name_edited'] = '~g~You have successfully changed the vehicle name',
        ['vehicle_name_deleted'] = '~g~You have successfully deleted the vehicle name',
    },
}