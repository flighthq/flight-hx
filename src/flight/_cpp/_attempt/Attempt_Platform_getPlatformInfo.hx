// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/platform/contract.hpp")
extern class Attempt_Platform_getPlatformInfo extends AttemptConfig {
  @:native("flight::platform::get_platform_info")
  public static function getPlatformInfo(hostPlatform:flight.HostPlatformCapability, out:flight.PlatformInfo):flight.PlatformInfo;
}
#end
