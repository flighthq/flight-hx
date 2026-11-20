package flight._hl;

private extern class AbortError_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_abort_error_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_abort_error_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_abort_error_message")
	static function get_message(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_abort_error_message")
	static function set_message(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract AbortError(hl.Bytes) {
	public var name(get, set):String;
	inline function get_name():String { var raw = AbortError_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); AbortError_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } AbortError_Ffi.set_name(this, raw); return value; }
	public var message(get, set):String;
	inline function get_message():String { var raw = AbortError_Ffi.get_message(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); AbortError_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } AbortError_Ffi.set_message(this, raw); return value; }
}
