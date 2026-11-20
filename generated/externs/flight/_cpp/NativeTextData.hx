package flight._cpp;

private extern class NativeTextData_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_native_text_data_height") static function get_height(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_native_text_data_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_native_text_data_text") static function get_text(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_native_text_data_text") static function set_text(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_native_text_data_width") static function get_width(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_native_text_data_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract NativeTextData(cpp.Star<cpp.Void>) {
	public var height(get, set):Float;

	inline function get_height():Float return NativeTextData_Ffi.get_height(this);

	inline function set_height(value:Float):Float { NativeTextData_Ffi.set_height(this, value); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = NativeTextData_Ffi.get_text(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); NativeTextData_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:cpp.ConstCharStar = cast value; NativeTextData_Ffi.set_text(this, raw); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return NativeTextData_Ffi.get_width(this);

	inline function set_width(value:Float):Float { NativeTextData_Ffi.set_width(this, value); return value; }
}
