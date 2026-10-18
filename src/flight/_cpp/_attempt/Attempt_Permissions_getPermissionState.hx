// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/permissions/contract.hpp")
extern class Attempt_Permissions_getPermissionState extends AttemptConfig {
  @:native("flight::permissions::get_permission_state")
  public static function getPermissionState(hostPermissions:flight.HostPermissionsCapability, hostMidiPermission:Null<flight.HostMidiPermissionCapability>, hostPreferencesPersistenceQuery:Null<flight.HostPreferencesPersistenceQueryCapability>, name:flight.PermissionName):flight._internal._Promise<flight.PermissionQueryOutcome>;
}
#end
