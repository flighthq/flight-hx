package flight._cpp._fn;

extern class Midi {
	@:native("flight_get_midi_port_connection")
	public static function getMidiPortConnection(port:flight._cpp.MidiPort):flight._cpp.MidiPortConnectionOutcome;
	@:native("flight_get_midi_port_state")
	public static function getMidiPortState(port:flight._cpp.MidiPort):flight._cpp.MidiPortStateOutcome;
	@:native("flight_send_midi_message")
	public static function sendMidiMessage(port:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, dataLen:Int, timestamp:Float):flight._cpp.MidiMessageSendOutcome;
	@:native("flight_create_midi_access_state_subscription")
	public static function createMidiAccessStateSubscription():cpp.Star<cpp.Void>;
	@:native("flight_create_midi_input_message_subscription")
	public static function createMidiInputMessageSubscription():cpp.Star<cpp.Void>;
	@:native("flight_create_midi_port_state_subscription")
	public static function createMidiPortStateSubscription():cpp.Star<cpp.Void>;
	@:native("flight_free_midi_port_connection_outcome")
	public static function freeMidiPortConnectionOutcome(ptr:flight._cpp.MidiPortConnectionOutcome):Void;
	@:native("flight_free_midi_port_state_outcome")
	public static function freeMidiPortStateOutcome(ptr:flight._cpp.MidiPortStateOutcome):Void;
	@:native("flight_free_midi_message_send_outcome")
	public static function freeMidiMessageSendOutcome(ptr:flight._cpp.MidiMessageSendOutcome):Void;
	@:native("flight_free_midi_access_state_subscription_ref")
	public static function freeMidiAccessStateSubscriptionRef(ptr:flight._cpp.MidiAccessStateSubscription):Void;
	@:native("flight_free_midi_input_message_subscription_ref")
	public static function freeMidiInputMessageSubscriptionRef(ptr:flight._cpp.MidiInputMessageSubscription):Void;
	@:native("flight_free_midi_port_state_subscription_ref")
	public static function freeMidiPortStateSubscriptionRef(ptr:flight._cpp.MidiPortStateSubscription):Void;
}
