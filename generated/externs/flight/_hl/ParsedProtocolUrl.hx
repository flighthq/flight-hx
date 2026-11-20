package flight._hl;

private extern class ParsedProtocolUrl_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_parsed_protocol_url_scheme")
	static function get_scheme(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_parsed_protocol_url_scheme")
	static function set_scheme(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_parsed_protocol_url_host")
	static function get_host(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_parsed_protocol_url_host")
	static function set_host(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_parsed_protocol_url_path")
	static function get_path(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_parsed_protocol_url_path")
	static function set_path(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ParsedProtocolUrl(hl.Bytes) {
	public var scheme(get, set):String;
	inline function get_scheme():String { var raw = ParsedProtocolUrl_Ffi.get_scheme(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ParsedProtocolUrl_Ffi.freeString(raw); return value; }
	inline function set_scheme(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ParsedProtocolUrl_Ffi.set_scheme(this, raw); return value; }
	public var host(get, set):String;
	inline function get_host():String { var raw = ParsedProtocolUrl_Ffi.get_host(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ParsedProtocolUrl_Ffi.freeString(raw); return value; }
	inline function set_host(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ParsedProtocolUrl_Ffi.set_host(this, raw); return value; }
	public var path(get, set):String;
	inline function get_path():String { var raw = ParsedProtocolUrl_Ffi.get_path(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ParsedProtocolUrl_Ffi.freeString(raw); return value; }
	inline function set_path(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ParsedProtocolUrl_Ffi.set_path(this, raw); return value; }
}
