package flight._cpp;

private extern class Awd2StringRead_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_awd2_string_read_end") static function get_end(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_string_read_end") static function set_end(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_awd2_string_read_value") static function get_value(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_awd2_string_read_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract Awd2StringRead(cpp.Star<cpp.Void>) {
	public var end(get, set):Int;

	inline function get_end():Int return Awd2StringRead_Ffi.get_end(this);

	inline function set_end(value:Int):Int { Awd2StringRead_Ffi.set_end(this, value); return value; }
	public var value(get, set):String;
	inline function get_value():String { var raw = Awd2StringRead_Ffi.get_value(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Awd2StringRead_Ffi.freeString(raw); return value; }
	inline function set_value(value:String):String { var raw:cpp.ConstCharStar = cast value; Awd2StringRead_Ffi.set_value(this, raw); return value; }
}
