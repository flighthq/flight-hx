// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/platform/contract.hpp")
extern class Attempt_Platform_isPlatformMobile extends AttemptConfig {
  @:native("flight::platform::is_platform_mobile")
  public static function isPlatformMobile(hostPlatform:flight.HostPlatformCapability):Bool;
}
#end
