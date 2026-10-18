// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/platform/contract.hpp")
extern class Attempt_Platform_createPlatformInfo extends AttemptConfig {
  @:native("flight::platform::create_platform_info")
  public static function createPlatformInfo():flight.PlatformInfo;
}
#end
