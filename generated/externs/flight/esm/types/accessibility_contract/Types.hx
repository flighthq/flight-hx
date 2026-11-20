package flight.esm.types.accessibility_contract;

#if (js && flight_esm)
typedef AccessibilityDescriptor = { ?label:Null<String>, ?role:Null<String>, ?tabFocusable:Null<Bool> };

typedef AccessibilityLiveness = String;

typedef AccessibilityNode = { id:String, role:flight.esm.types.accessibility_contract.Types.AccessibilityRole, ?label:Null<String>, ?description:Null<String>, ?value:Null<String>, ?parentId:Null<String>, ?bounds:Null<flight.esm.types.geometry.Types.Rectangle>, ?states:Null<flight.esm.types.accessibility_contract.Types.AccessibilityState> };

typedef AccessibilityOperationBlockReason = String;

typedef AccessibilityOperationOutcome<BlockReason> = Dynamic;

typedef AccessibilityRole = Dynamic;

typedef AccessibilityState = { ?disabled:Null<Bool>, ?checked:Null<Bool>, ?expanded:Null<Bool>, ?selected:Null<Bool>, ?pressed:Null<Bool>, ?busy:Null<Bool>, ?hidden:Null<Bool>, ?readonly:Null<Bool>, ?required:Null<Bool>, ?level:Null<Float>, ?valueMin:Null<Float>, ?valueMax:Null<Float>, ?valueNow:Null<Float> };

typedef HostAccessibilityCapability = { announce:((message:String, liveness:flight.esm.types.accessibility_contract.Types.AccessibilityLiveness) -> flight.esm.types.accessibility_contract.Types.AccessibilityOperationOutcome<String>), clear:(() -> flight.esm.types.accessibility_contract.Types.AccessibilityOperationOutcome<String>), destroy:(() -> Void), removeNode:((id:String) -> flight.esm.types.accessibility_contract.Types.AccessibilityOperationOutcome<String>), setFocus:((id:String) -> flight.esm.types.accessibility_contract.Types.AccessibilityOperationOutcome<String>), setNode:((node:flight.esm.types.accessibility_contract.Types.AccessibilityNode) -> flight.esm.types.accessibility_contract.Types.AccessibilityOperationOutcome<String>) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
