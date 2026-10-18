// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_getScreens extends AttemptConfig {
  @:native("flight::screen::get_screens")
  public static function getScreens(hostScreenQuery:flight.HostScreenQueryCapability, out:Array<flight.ScreenInfo>):Array<flight.ScreenInfo>;
}
#end
