package flight._hl;

private extern class MidiInputPort_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_midi_input_port_id")
	static function get_id(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_midi_input_port_id")
	static function set_id(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract MidiInputPort(hl.Bytes) {
	public var id(get, set):String;
	inline function get_id():String { var raw = MidiInputPort_Ffi.get_id(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); MidiInputPort_Ffi.freeString(raw); return value; }
	inline function set_id(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } MidiInputPort_Ffi.set_id(this, raw); return value; }
}
