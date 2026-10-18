// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function announceAccessibility(hostAccessibility:flight.HostAccessibilityCapability, message:String, ?liveness:flight.AccessibilityLiveness):flight.AccessibilityOperationOutcome<Dynamic> {
  return flight._cpp._attempt.Attempt_Accessibility_announceAccessibility.announceAccessibility(hostAccessibility, message, liveness);
}

extern inline function clearAccessibilityTree(hostAccessibility:flight.HostAccessibilityCapability):flight.AccessibilityOperationOutcome<Dynamic> {
  return flight._cpp._attempt.Attempt_Accessibility_clearAccessibilityTree.clearAccessibilityTree(hostAccessibility);
}

extern inline function destroyAccessibility(hostAccessibility:flight.HostAccessibilityCapability):Void {
  flight._cpp._attempt.Attempt_Accessibility_destroyAccessibility.destroyAccessibility(hostAccessibility);
}

extern inline function removeAccessibilityNode(hostAccessibility:flight.HostAccessibilityCapability, id:String):flight.AccessibilityOperationOutcome<Dynamic> {
  return flight._cpp._attempt.Attempt_Accessibility_removeAccessibilityNode.removeAccessibilityNode(hostAccessibility, id);
}

extern inline function setAccessibilityFocus(hostAccessibility:flight.HostAccessibilityCapability, id:String):flight.AccessibilityOperationOutcome<Dynamic> {
  return flight._cpp._attempt.Attempt_Accessibility_setAccessibilityFocus.setAccessibilityFocus(hostAccessibility, id);
}

extern inline function setAccessibilityNode(hostAccessibility:flight.HostAccessibilityCapability, node:flight.AccessibilityNode):flight.AccessibilityOperationOutcome<Dynamic> {
  return flight._cpp._attempt.Attempt_Accessibility_setAccessibilityNode.setAccessibilityNode(hostAccessibility, node);
}
