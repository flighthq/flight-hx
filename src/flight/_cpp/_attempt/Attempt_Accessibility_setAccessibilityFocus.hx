// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/accessibility/contract.hpp")
extern class Attempt_Accessibility_setAccessibilityFocus extends AttemptConfig {
  @:native("flight::accessibility::set_accessibility_focus")
  public static function setAccessibilityFocus(hostAccessibility:flight.HostAccessibilityCapability, id:String):flight.AccessibilityOperationOutcome<Dynamic>;
}
#end
