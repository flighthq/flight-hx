// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/accessibility/contract.hpp")
extern class Attempt_Accessibility_destroyAccessibility extends AttemptConfig {
  @:native("flight::accessibility::destroy_accessibility")
  public static function destroyAccessibility(hostAccessibility:flight.HostAccessibilityCapability):Void;
}
#end
