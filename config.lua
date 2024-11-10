Config = {}

Config.Locale = 'en' -- Translation en, de you can add more

Config.AddVehicleNameCommand = 'AddVehicleName' -- Command to Add Vehicle Name
Config.EditVehicleNameCommand = 'EditVehicleName' -- Command to Edit Vehicle Name
Config.DeleteVehicleNameCommand = 'DeleteVehicleName' -- Command to Delete Vehicle Name

Config.TrustedIdentifiers = {
   -- [LicenxeID] = true, 
}

Translation = {
    ['de'] = {
        ['no_access'] = '~r~Du hast keinen Zugriff auf diesen Befehl!',
        ['vehicle_name_allready_exist'] = '~r~Für dieses Fahrzeug existiert bereits ein Vehicle Name!',
        ['vehicle_name_added'] = '~g~Du hast den Fahrzeug Namen Erfolgreich hinzugefügt',
        ['vehicle_has_no_name'] = '~r~Dieses Fahrzeug hat noch keinen Namen!',
        ['vehicle_name_edited'] = '~g~Du hast den Fahrzeug Namen erfolgreich geändert',
        ['vehicle_name_deleted'] = '~g~Du hast den Fahrzeug Namen Erfolgreich gelöscht',
        ['not_in_vehicle'] = '~r~Du musst in einem Fahrzeug sein',
        ['chat_suggest_vehicle_name'] = 'Fahrzeug Name',
        ['add_vehicle_name_chat_suggest'] = 'Fahrzeug Name',
        ['add_vehicle_name_chat_suggest'] = 'Gebe dem Fahrzeug einen Namen',
        ['edit_vehicle_name_chat_suggest'] = 'Bearbeite den namen des Fahrzeugs',
        ['delete_vehicle_name_chat_suggest'] = 'Lösche den namen des Fahrzeugs',
        ['vehicle_name_chat_suggest_vehicle_name'] = 'Der name den das Fahrzeug bekommen soll',
    },
    ['en'] = {
        ['no_access'] = '~r~You do not have access to this command!',
        ['vehicle_name_allready_exist'] = '~r~A vehicle name already exists for this vehicle!',
        ['vehicle_name_added'] = '~g~You have successfully added the vehicle name',
        ['vehicle_has_no_name'] = '~r~This vehicle does not yet have a name!',
        ['vehicle_name_edited'] = '~g~You have successfully changed the vehicle name',
        ['vehicle_name_deleted'] = '~g~You have successfully deleted the vehicle name',
        ['not_in_vehicle'] = '~r~You must be in a vehicle!',
        ['chat_suggest_vehicle_name'] = 'Vehicle Name',
        ['add_vehicle_name_chat_suggest'] = 'Vehicle name',
        ['add_vehicle_name_chat_suggest'] = 'Give the vehicle a name',
        ['edit_vehicle_name_chat_suggest'] = 'Edit the name of the vehicle',
        ['delete_vehicle_name_chat_suggest'] = 'Delete the name of the vehicle',
        ['vehicle_name_chat_suggest_vehicle_name'] = 'The name to be given to the vehicle',
    },
}
