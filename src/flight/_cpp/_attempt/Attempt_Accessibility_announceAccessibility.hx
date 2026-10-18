// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/accessibility/contract.hpp")
extern class Attempt_Accessibility_announceAccessibility extends AttemptConfig {
  @:native("flight::accessibility::announce_accessibility")
  public static function announceAccessibility(hostAccessibility:flight.HostAccessibilityCapability, message:String, ?liveness:flight.AccessibilityLiveness):flight.AccessibilityOperationOutcome<Dynamic>;
}
#end
