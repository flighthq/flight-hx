// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/accessibility/contract.hpp")
extern class Attempt_Accessibility_clearAccessibilityTree extends AttemptConfig {
  @:native("flight::accessibility::clear_accessibility_tree")
  public static function clearAccessibilityTree(hostAccessibility:flight.HostAccessibilityCapability):flight.AccessibilityOperationOutcome<Dynamic>;
}
#end
