// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_requestScreenDetails extends AttemptConfig {
  @:native("flight::screen::request_screen_details")
  public static function requestScreenDetails(hostScreenDetails:flight.HostScreenDetailsCapability):flight._internal._Promise<Bool>;
}
#end
