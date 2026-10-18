// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/platform/contract.hpp")
extern class Attempt_Platform_isPlatformVersionAtLeast extends AttemptConfig {
  @:native("flight::platform::is_platform_version_at_least")
  public static function isPlatformVersionAtLeast(hostPlatform:flight.HostPlatformCapability, minimum:String):Bool;
}
#end
