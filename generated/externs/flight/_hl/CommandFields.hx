package flight._hl;

private extern class CommandFields_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_command_fields_label")
	static function get_label(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_command_fields_label")
	static function set_label(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract CommandFields(hl.Bytes) {
	public var label(get, set):String;
	inline function get_label():String { var raw = CommandFields_Ffi.get_label(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); CommandFields_Ffi.freeString(raw); return value; }
	inline function set_label(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } CommandFields_Ffi.set_label(this, raw); return value; }
}
