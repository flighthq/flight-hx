package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/midi")
extern class Midi {
  public static function attachMidiAccessStateSubscription(access:flight.esm.types.midi_contract.Types.MidiAccess, subscription:flight.esm.types.midi_contract.Types.MidiAccessStateSubscription):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiSubscriptionAttachOutcome>;
  public static function attachMidiInputMessageSubscription(input:flight.esm.types.midi_contract.Types.MidiInputPort, subscription:flight.esm.types.midi_contract.Types.MidiInputMessageSubscription):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiSubscriptionAttachOutcome>;
  public static function attachMidiPortStateSubscription(port:flight.esm.types.midi_contract.Types.MidiPort, subscription:flight.esm.types.midi_contract.Types.MidiPortStateSubscription):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiSubscriptionAttachOutcome>;
  public static function closeMidiPort(port:flight.esm.types.midi_contract.Types.MidiPort):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiPortCloseOutcome>;
  public static function createMidiAccessStateSubscription():flight.esm.types.midi_contract.Types.MidiAccessStateSubscription;
  public static function createMidiInputMessageSubscription():flight.esm.types.midi_contract.Types.MidiInputMessageSubscription;
  public static function createMidiPortStateSubscription():flight.esm.types.midi_contract.Types.MidiPortStateSubscription;
  public static function detachMidiAccessStateSubscription(subscription:flight.esm.types.midi_contract.Types.MidiAccessStateSubscription):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiSubscriptionDetachOutcome>;
  public static function detachMidiInputMessageSubscription(subscription:flight.esm.types.midi_contract.Types.MidiInputMessageSubscription):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiSubscriptionDetachOutcome>;
  public static function detachMidiPortStateSubscription(subscription:flight.esm.types.midi_contract.Types.MidiPortStateSubscription):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiSubscriptionDetachOutcome>;
  public static function disposeMidiAccess(access:flight.esm.types.midi_contract.Types.MidiAccess):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiAccessDisposeOutcome>;
  public static function disposeMidiAccessStateSubscription(subscription:flight.esm.types.midi_contract.Types.MidiAccessStateSubscription):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiSubscriptionDisposeOutcome>;
  public static function disposeMidiInputMessageSubscription(subscription:flight.esm.types.midi_contract.Types.MidiInputMessageSubscription):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiSubscriptionDisposeOutcome>;
  public static function disposeMidiPort(port:flight.esm.types.midi_contract.Types.MidiPort):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiPortDisposeOutcome>;
  public static function disposeMidiPortStateSubscription(subscription:flight.esm.types.midi_contract.Types.MidiPortStateSubscription):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiSubscriptionDisposeOutcome>;
  public static function getMidiAccessInputPorts(access:flight.esm.types.midi_contract.Types.MidiAccess):flight.esm.types.midi_contract.Types.MidiAccessPortsOutcome<flight.esm.types.midi_contract.Types.MidiInputPort>;
  public static function getMidiAccessOutputPorts(access:flight.esm.types.midi_contract.Types.MidiAccess):flight.esm.types.midi_contract.Types.MidiAccessPortsOutcome<flight.esm.types.midi_contract.Types.MidiOutputPort>;
  public static function getMidiPermission(hostMidiPermission:flight.esm.types.midi_contract.Types.HostMidiPermissionCapability):js.lib.Promise<flight.esm.types.permissions_contract.Types.PermissionQueryOutcome>;
  public static function getMidiPortConnection(port:flight.esm.types.midi_contract.Types.MidiPort):flight.esm.types.midi_contract.Types.MidiPortConnectionOutcome;
  public static function getMidiPortState(port:flight.esm.types.midi_contract.Types.MidiPort):flight.esm.types.midi_contract.Types.MidiPortStateOutcome;
  public static function openMidiPort(port:flight.esm.types.midi_contract.Types.MidiPort):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiPortOpenOutcome>;
  public static function requestMidiAccess(hostMidiAccess:flight.esm.types.midi_contract.Types.HostMidiAccessCapability):js.lib.Promise<flight.esm.types.midi_contract.Types.MidiAccessRequestOutcome>;
  public static function sendMidiMessage(port:flight.esm.types.midi_contract.Types.MidiOutputPort, data:js.lib.Uint8Array, ?timestamp:Null<Float>):flight.esm.types.midi_contract.Types.MidiMessageSendOutcome;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
