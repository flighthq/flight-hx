// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/platform/contract.hpp")
extern class Attempt_Platform_comparePlatformVersions extends AttemptConfig {
  @:native("flight::platform::compare_platform_versions")
  public static function comparePlatformVersions(a:String, b:String):Dynamic;
}
#end
