package flight._cpp;

private extern class ParsedProtocolUrl_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_parsed_protocol_url_scheme") static function get_scheme(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_parsed_protocol_url_scheme") static function set_scheme(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_parsed_protocol_url_host") static function get_host(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_parsed_protocol_url_host") static function set_host(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_parsed_protocol_url_path") static function get_path(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_parsed_protocol_url_path") static function set_path(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ParsedProtocolUrl(cpp.Star<cpp.Void>) {
	public var scheme(get, set):String;
	inline function get_scheme():String { var raw = ParsedProtocolUrl_Ffi.get_scheme(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ParsedProtocolUrl_Ffi.freeString(raw); return value; }
	inline function set_scheme(value:String):String { var raw:cpp.ConstCharStar = cast value; ParsedProtocolUrl_Ffi.set_scheme(this, raw); return value; }
	public var host(get, set):String;
	inline function get_host():String { var raw = ParsedProtocolUrl_Ffi.get_host(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ParsedProtocolUrl_Ffi.freeString(raw); return value; }
	inline function set_host(value:String):String { var raw:cpp.ConstCharStar = cast value; ParsedProtocolUrl_Ffi.set_host(this, raw); return value; }
	public var path(get, set):String;
	inline function get_path():String { var raw = ParsedProtocolUrl_Ffi.get_path(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ParsedProtocolUrl_Ffi.freeString(raw); return value; }
	inline function set_path(value:String):String { var raw:cpp.ConstCharStar = cast value; ParsedProtocolUrl_Ffi.set_path(this, raw); return value; }
}
