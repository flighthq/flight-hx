package flight._cpp;

private extern class AbortError_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_abort_error_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_abort_error_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_abort_error_message") static function get_message(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_abort_error_message") static function set_message(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract AbortError(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = AbortError_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AbortError_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; AbortError_Ffi.set_name(this, raw); return value; }
	public var message(get, set):String;
	inline function get_message():String { var raw = AbortError_Ffi.get_message(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AbortError_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:cpp.ConstCharStar = cast value; AbortError_Ffi.set_message(this, raw); return value; }
}
