// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_getScreenDetailPermission extends AttemptConfig {
  @:native("flight::screen::get_screen_detail_permission")
  public static function getScreenDetailPermission(hostScreenDetails:flight.HostScreenDetailsCapability):flight._internal._Promise<flight.ScreenPermissionState>;
}
#end
