package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/permissions")
extern class Permissions {
  public static function getPermissionState(hostPermissions:flight.esm.types.permissions_contract.Types.HostPermissionsCapability, hostMidiPermission:Null<flight.esm.types.midi_contract.Types.HostMidiPermissionCapability>, hostPreferencesPersistenceQuery:Null<flight.esm.types.preferences_contract.Types.HostPreferencesPersistenceQueryCapability>, name:flight.esm.types.permissions_contract.Types.PermissionName):js.lib.Promise<flight.esm.types.permissions_contract.Types.PermissionQueryOutcome>;
  public static function getPermissionStates(hostPermissions:flight.esm.types.permissions_contract.Types.HostPermissionsCapability, hostMidiPermission:Null<flight.esm.types.midi_contract.Types.HostMidiPermissionCapability>, hostPreferencesPersistenceQuery:Null<flight.esm.types.preferences_contract.Types.HostPreferencesPersistenceQueryCapability>, names:Array<flight.esm.types.permissions_contract.Types.PermissionName>):js.lib.Promise<Array<flight.esm.types.permissions_contract.Types.PermissionQueryOutcome>>;
  public static function requestPermission(hostPermissions:flight.esm.types.permissions_contract.Types.HostPermissionsCapability, hostPreferencesPersistenceRequest:Null<flight.esm.types.preferences_contract.Types.HostPreferencesPersistenceRequestCapability>, hostGeolocation:Null<flight.esm.types.geolocation_contract.Types.HostGeolocationCapability>, name:flight.esm.types.permissions_contract.Types.PermissionName):js.lib.Promise<flight.esm.types.permissions_contract.Types.PermissionRequestOutcome>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
