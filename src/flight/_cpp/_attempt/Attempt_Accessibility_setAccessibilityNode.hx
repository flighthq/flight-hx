// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/accessibility/contract.hpp")
extern class Attempt_Accessibility_setAccessibilityNode extends AttemptConfig {
  @:native("flight::accessibility::set_accessibility_node")
  public static function setAccessibilityNode(hostAccessibility:flight.HostAccessibilityCapability, node:flight.AccessibilityNode):flight.AccessibilityOperationOutcome<Dynamic>;
}
#end
