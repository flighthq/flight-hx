// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/permissions/contract.hpp")
extern class Attempt_Permissions_requestPermission extends AttemptConfig {
  @:native("flight::permissions::request_permission")
  public static function requestPermission(hostPermissions:flight.HostPermissionsCapability, hostPreferencesPersistenceRequest:Null<flight.HostPreferencesPersistenceRequestCapability>, hostGeolocation:Null<flight.HostGeolocationCapability>, name:flight.PermissionName):flight._internal._Promise<flight.PermissionRequestOutcome>;
}
#end
