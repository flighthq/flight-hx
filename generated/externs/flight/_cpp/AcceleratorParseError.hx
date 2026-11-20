package flight._cpp;

private extern class AcceleratorParseError_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_accelerator_parse_error_token") static function get_token(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_accelerator_parse_error_token") static function set_token(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract AcceleratorParseError(cpp.Star<cpp.Void>) {
	public var token(get, set):String;
	inline function get_token():String { var raw = AcceleratorParseError_Ffi.get_token(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AcceleratorParseError_Ffi.freeString(raw); return value; }
	inline function set_token(value:String):String { var raw:cpp.ConstCharStar = cast value; AcceleratorParseError_Ffi.set_token(this, raw); return value; }
}
