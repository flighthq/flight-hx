package flight._js._fn;

@:jsRequire("@flighthq/midi")
extern class Midi {
	@:native("getMidiPortConnection")
	public static function getMidiPortConnection(port:flight._js.MidiPort):flight._js.MidiPortConnectionOutcome;
	@:native("getMidiPortState")
	public static function getMidiPortState(port:flight._js.MidiPort):flight._js.MidiPortStateOutcome;
	@:native("sendMidiMessage")
	public static function sendMidiMessage(port:Dynamic, data:Dynamic, timestamp:Null<Float>):flight._js.MidiMessageSendOutcome;
	@:native("createMidiAccessStateSubscription")
	public static function createMidiAccessStateSubscription():Dynamic;
	@:native("createMidiInputMessageSubscription")
	public static function createMidiInputMessageSubscription():Dynamic;
	@:native("createMidiPortStateSubscription")
	public static function createMidiPortStateSubscription():Dynamic;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMidiPortConnectionOutcome(ptr:flight._js.MidiPortConnectionOutcome):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMidiPortStateOutcome(ptr:flight._js.MidiPortStateOutcome):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMidiMessageSendOutcome(ptr:flight._js.MidiMessageSendOutcome):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMidiAccessStateSubscriptionRef(ptr:flight._js.MidiAccessStateSubscription):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMidiInputMessageSubscriptionRef(ptr:flight._js.MidiInputMessageSubscription):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMidiPortStateSubscriptionRef(ptr:flight._js.MidiPortStateSubscription):Void {}
}
