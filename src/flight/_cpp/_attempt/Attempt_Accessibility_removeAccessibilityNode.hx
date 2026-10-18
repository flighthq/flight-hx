// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/accessibility/contract.hpp")
extern class Attempt_Accessibility_removeAccessibilityNode extends AttemptConfig {
  @:native("flight::accessibility::remove_accessibility_node")
  public static function removeAccessibilityNode(hostAccessibility:flight.HostAccessibilityCapability, id:String):flight.AccessibilityOperationOutcome<Dynamic>;
}
#end
