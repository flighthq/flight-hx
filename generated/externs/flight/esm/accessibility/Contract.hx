package flight.esm.accessibility;

#if (js && flight_esm)
@:jsRequire("@flighthq/accessibility/contract")
extern class Contract {
  public static function announceAccessibility(hostAccessibility:flight.esm.types.accessibility_contract.Types.HostAccessibilityCapability, message:String, ?liveness:Null<String>):flight.esm.types.accessibility_contract.Types.AccessibilityOperationOutcome<String>;
  public static function clearAccessibilityTree(hostAccessibility:flight.esm.types.accessibility_contract.Types.HostAccessibilityCapability):flight.esm.types.accessibility_contract.Types.AccessibilityOperationOutcome<String>;
  public static function destroyAccessibility(hostAccessibility:flight.esm.types.accessibility_contract.Types.HostAccessibilityCapability):Void;
  public static function removeAccessibilityNode(hostAccessibility:flight.esm.types.accessibility_contract.Types.HostAccessibilityCapability, id:String):flight.esm.types.accessibility_contract.Types.AccessibilityOperationOutcome<String>;
  public static function setAccessibilityFocus(hostAccessibility:flight.esm.types.accessibility_contract.Types.HostAccessibilityCapability, id:String):flight.esm.types.accessibility_contract.Types.AccessibilityOperationOutcome<String>;
  public static function setAccessibilityNode(hostAccessibility:flight.esm.types.accessibility_contract.Types.HostAccessibilityCapability, node:flight.esm.types.accessibility_contract.Types.AccessibilityNode):flight.esm.types.accessibility_contract.Types.AccessibilityOperationOutcome<String>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
