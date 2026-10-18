// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/platform/contract.hpp")
extern class Attempt_Platform_getPlatformRuntime extends AttemptConfig {
  @:native("flight::platform::get_platform_runtime")
  public static function getPlatformRuntime(hostPlatform:flight.HostPlatformCapability):flight.PlatformRuntime;
}
#end
