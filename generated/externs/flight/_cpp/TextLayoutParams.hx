package flight._cpp;

private extern class TextLayoutParams_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_text_layout_params_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_layout_params_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_text_layout_params_text") static function get_text(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_layout_params_text") static function set_text(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_text_layout_params_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_layout_params_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextLayoutParams(cpp.Star<cpp.Void>) {
	public var height(get, set):Single;

	inline function get_height():Single return TextLayoutParams_Ffi.get_height(this);

	inline function set_height(value:Single):Single { TextLayoutParams_Ffi.set_height(this, value); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = TextLayoutParams_Ffi.get_text(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextLayoutParams_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:cpp.ConstCharStar = cast value; TextLayoutParams_Ffi.set_text(this, raw); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return TextLayoutParams_Ffi.get_width(this);

	inline function set_width(value:Single):Single { TextLayoutParams_Ffi.set_width(this, value); return value; }
}
