package flight._cpp;

private extern class ShapedRun_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_shaped_run_advance_width") static function get_advanceWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_shaped_run_advance_width") static function set_advanceWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_shaped_run_glyph_count") static function get_glyphCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_shaped_run_glyph_count") static function set_glyphCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_shaped_run_script") static function get_script(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_shaped_run_script") static function set_script(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ShapedRun(cpp.Star<cpp.Void>) {
	public var advanceWidth(get, set):Single;

	inline function get_advanceWidth():Single return ShapedRun_Ffi.get_advanceWidth(this);

	inline function set_advanceWidth(value:Single):Single { ShapedRun_Ffi.set_advanceWidth(this, value); return value; }
	public var glyphCount(get, set):Int;

	inline function get_glyphCount():Int return ShapedRun_Ffi.get_glyphCount(this);

	inline function set_glyphCount(value:Int):Int { ShapedRun_Ffi.set_glyphCount(this, value); return value; }
	public var script(get, set):String;
	inline function get_script():String { var raw = ShapedRun_Ffi.get_script(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ShapedRun_Ffi.freeString(raw); return value; }
	inline function set_script(value:String):String { var raw:cpp.ConstCharStar = cast value; ShapedRun_Ffi.set_script(this, raw); return value; }
}
