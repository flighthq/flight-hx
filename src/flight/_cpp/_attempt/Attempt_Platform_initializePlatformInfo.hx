// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/platform/contract.hpp")
extern class Attempt_Platform_initializePlatformInfo extends AttemptConfig {
  @:native("flight::platform::initialize_platform_info")
  public static function initializePlatformInfo(out:flight.EntityConstruction<flight.PlatformInfo>):Void;
}
#end
