package flight._cpp;

private extern class MidiInputMessage_Ffi {
	@:native("flight_get_midi_input_message_timestamp") static function get_timestamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_midi_input_message_timestamp") static function set_timestamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract MidiInputMessage(cpp.Star<cpp.Void>) {
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return MidiInputMessage_Ffi.get_timestamp(this);

	inline function set_timestamp(value:Float):Float { MidiInputMessage_Ffi.set_timestamp(this, value); return value; }
}
