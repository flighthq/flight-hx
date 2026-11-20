package flight._hl._fn;

extern class Midi {
	@:hlNative("flight", "flight_get_midi_port_connection")
	public static function getMidiPortConnection(port:flight._hl.MidiPort):flight._hl.MidiPortConnectionOutcome;
	@:hlNative("flight", "flight_get_midi_port_state")
	public static function getMidiPortState(port:flight._hl.MidiPort):flight._hl.MidiPortStateOutcome;
	@:hlNative("flight", "flight_send_midi_message")
	public static function sendMidiMessage(port:hl.Bytes, data:hl.Bytes, dataLen:Int, timestamp:Float):flight._hl.MidiMessageSendOutcome;
	@:hlNative("flight", "flight_create_midi_access_state_subscription")
	public static function createMidiAccessStateSubscription():hl.Bytes;
	@:hlNative("flight", "flight_create_midi_input_message_subscription")
	public static function createMidiInputMessageSubscription():hl.Bytes;
	@:hlNative("flight", "flight_create_midi_port_state_subscription")
	public static function createMidiPortStateSubscription():hl.Bytes;
	@:hlNative("flight", "flight_free_midi_port_connection_outcome")
	public static function freeMidiPortConnectionOutcome(ptr:flight._hl.MidiPortConnectionOutcome):Void;
	@:hlNative("flight", "flight_free_midi_port_state_outcome")
	public static function freeMidiPortStateOutcome(ptr:flight._hl.MidiPortStateOutcome):Void;
	@:hlNative("flight", "flight_free_midi_message_send_outcome")
	public static function freeMidiMessageSendOutcome(ptr:flight._hl.MidiMessageSendOutcome):Void;
	@:hlNative("flight", "flight_free_midi_access_state_subscription_ref")
	public static function freeMidiAccessStateSubscriptionRef(ptr:flight._hl.MidiAccessStateSubscription):Void;
	@:hlNative("flight", "flight_free_midi_input_message_subscription_ref")
	public static function freeMidiInputMessageSubscriptionRef(ptr:flight._hl.MidiInputMessageSubscription):Void;
	@:hlNative("flight", "flight_free_midi_port_state_subscription_ref")
	public static function freeMidiPortStateSubscriptionRef(ptr:flight._hl.MidiPortStateSubscription):Void;
}
