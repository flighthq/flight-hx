// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/permissions/contract.hpp")
extern class Attempt_Permissions_getPermissionStates extends AttemptConfig {
  @:native("flight::permissions::get_permission_states")
  public static function getPermissionStates(hostPermissions:flight.HostPermissionsCapability, hostMidiPermission:Null<flight.HostMidiPermissionCapability>, hostPreferencesPersistenceQuery:Null<flight.HostPreferencesPersistenceQueryCapability>, names:Array<flight.PermissionName>):flight._internal._Promise<Array<flight.PermissionQueryOutcome>>;
}
#end
