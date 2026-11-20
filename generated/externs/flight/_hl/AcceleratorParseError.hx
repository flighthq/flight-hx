package flight._hl;

private extern class AcceleratorParseError_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_accelerator_parse_error_token")
	static function get_token(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_accelerator_parse_error_token")
	static function set_token(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract AcceleratorParseError(hl.Bytes) {
	public var token(get, set):String;
	inline function get_token():String { var raw = AcceleratorParseError_Ffi.get_token(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); AcceleratorParseError_Ffi.freeString(raw); return value; }
	inline function set_token(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } AcceleratorParseError_Ffi.set_token(this, raw); return value; }
}
