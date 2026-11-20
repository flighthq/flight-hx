package flight.esm.types.midi_contract;

#if (js && flight_esm)
typedef HostMidiAccessCapability = { requestAccess:(() -> js.lib.Promise<flight.esm.types.midi_contract.Types.MidiAccessRequestOutcome>) };

typedef HostMidiPermissionCapability = { getPermission:(() -> js.lib.Promise<flight.esm.types.permissions_contract.Types.PermissionQueryOutcome>) };

typedef MidiAccess = Dynamic;

typedef MidiAccessDisposeOutcome = Dynamic;

typedef MidiAccessLifecycleFailure = Dynamic;

typedef MidiAccessPortsOutcome<Port> = Dynamic;

typedef MidiAccessRequestOutcome = Dynamic;

typedef MidiAccessResourceOperations = { attachStateChange:((listener:Dynamic) -> js.lib.Promise<flight.esm.types.midi_contract.Types.MidiEventBackendAttachOutcome>), getInputPorts:(() -> Array<flight.esm.types.midi_contract.Types.MidiInputPort>), getOutputPorts:(() -> Array<flight.esm.types.midi_contract.Types.MidiOutputPort>) };

typedef MidiAccessStateSubscription = { onMidiAccessStateChange:flight.esm.types.signals.Types.Signal<flight.esm.types.midi_contract.Types.MidiPort> };

typedef MidiEventAttachment = { release:(() -> js.lib.Promise<flight.esm.types.midi_contract.Types.MidiEventReleaseOutcome>) };

typedef MidiEventBackendAttachOutcome = Dynamic;

typedef MidiEventReleaseOutcome = { reason:String };

typedef MidiInputMessage = { data:js.lib.Uint8Array, timestamp:Float };

typedef MidiInputMessageSubscription = { onMidiInputMessage:flight.esm.types.signals.Types.Signal<flight.esm.types.midi_contract.Types.MidiInputMessage> };

typedef MidiInputPort = { id:String, manufacturer:Null<String>, name:Null<String>, type:String, version:Null<String> };

typedef MidiInputPortResourceOperations = { attachMessage:((listener:Dynamic) -> js.lib.Promise<flight.esm.types.midi_contract.Types.MidiEventBackendAttachOutcome>), attachStateChange:((listener:Dynamic) -> js.lib.Promise<flight.esm.types.midi_contract.Types.MidiEventBackendAttachOutcome>), close:(() -> js.lib.Promise<Void>), getConnection:(() -> flight.esm.types.midi_contract.Types.MidiPortConnection), getState:(() -> flight.esm.types.midi_contract.Types.MidiPortState), open:(() -> js.lib.Promise<Void>) };

typedef MidiMessageSendOutcome = { reason:String };

typedef MidiOutputPort = { id:String, manufacturer:Null<String>, name:Null<String>, type:String, version:Null<String> };

typedef MidiOutputPortResourceOperations = { send:((data:Array<Float>, ?timestamp:Null<Float>) -> Void), attachStateChange:((listener:Dynamic) -> js.lib.Promise<flight.esm.types.midi_contract.Types.MidiEventBackendAttachOutcome>), close:(() -> js.lib.Promise<Void>), getConnection:(() -> flight.esm.types.midi_contract.Types.MidiPortConnection), getState:(() -> flight.esm.types.midi_contract.Types.MidiPortState), open:(() -> js.lib.Promise<Void>) };

typedef MidiPort = Dynamic;

typedef MidiPortCloseOutcome = { reason:String };

typedef MidiPortConnection = String;

typedef MidiPortConnectionOutcome = Dynamic;

typedef MidiPortDisposeOutcome = Dynamic;

typedef MidiPortLifecycleFailure = { operation:String };

typedef MidiPortOpenOutcome = { reason:String };

typedef MidiPortResourceOperations = { attachStateChange:((listener:Dynamic) -> js.lib.Promise<flight.esm.types.midi_contract.Types.MidiEventBackendAttachOutcome>), close:(() -> js.lib.Promise<Void>), getConnection:(() -> flight.esm.types.midi_contract.Types.MidiPortConnection), getState:(() -> flight.esm.types.midi_contract.Types.MidiPortState), open:(() -> js.lib.Promise<Void>) };

typedef MidiPortState = String;

typedef MidiPortStateOutcome = Dynamic;

typedef MidiPortStateSubscription = { onMidiPortStateChange:flight.esm.types.signals.Types.Signal<flight.esm.types.midi_contract.Types.MidiPort> };

typedef MidiSubscriptionAttachOutcome = Dynamic;

typedef MidiSubscriptionDetachOutcome = Dynamic;

typedef MidiSubscriptionDisposeOutcome = Dynamic;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
