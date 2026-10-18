// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function getPermissionState(hostPermissions:flight.HostPermissionsCapability, hostMidiPermission:Null<flight.HostMidiPermissionCapability>, hostPreferencesPersistenceQuery:Null<flight.HostPreferencesPersistenceQueryCapability>, name:flight.PermissionName):flight._internal._Promise<flight.PermissionQueryOutcome> {
  return flight._cpp._attempt.Attempt_Permissions_getPermissionState.getPermissionState(hostPermissions, hostMidiPermission, hostPreferencesPersistenceQuery, name);
}

extern inline function getPermissionStates(hostPermissions:flight.HostPermissionsCapability, hostMidiPermission:Null<flight.HostMidiPermissionCapability>, hostPreferencesPersistenceQuery:Null<flight.HostPreferencesPersistenceQueryCapability>, names:Array<flight.PermissionName>):flight._internal._Promise<Array<flight.PermissionQueryOutcome>> {
  return flight._cpp._attempt.Attempt_Permissions_getPermissionStates.getPermissionStates(hostPermissions, hostMidiPermission, hostPreferencesPersistenceQuery, names);
}

extern inline function requestPermission(hostPermissions:flight.HostPermissionsCapability, hostPreferencesPersistenceRequest:Null<flight.HostPreferencesPersistenceRequestCapability>, hostGeolocation:Null<flight.HostGeolocationCapability>, name:flight.PermissionName):flight._internal._Promise<flight.PermissionRequestOutcome> {
  return flight._cpp._attempt.Attempt_Permissions_requestPermission.requestPermission(hostPermissions, hostPreferencesPersistenceRequest, hostGeolocation, name);
}
