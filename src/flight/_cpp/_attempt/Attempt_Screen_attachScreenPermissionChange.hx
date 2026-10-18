// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_attachScreenPermissionChange extends AttemptConfig {
  @:native("flight::screen::attach_screen_permission_change")
  public static function attachScreenPermissionChange(hostScreenPermissionChange:flight.HostScreenPermissionChangeCapability, permissionChange:flight.ScreenPermissionChange):Void;
}
#end
