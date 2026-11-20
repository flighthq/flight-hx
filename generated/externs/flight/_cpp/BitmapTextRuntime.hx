package flight._cpp;

private extern class BitmapTextRuntime_Ffi {
	@:native("flight_get_bitmap_text_runtime_glyph_layout_version") static function get_glyphLayoutVersion(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_bitmap_text_runtime_glyph_layout_version") static function set_glyphLayoutVersion(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_bitmap_text_runtime_line_count") static function get_lineCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_text_runtime_line_count") static function set_lineCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_text_runtime_truncated") static function get_truncated(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_bitmap_text_runtime_truncated") static function set_truncated(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract BitmapTextRuntime(cpp.Star<cpp.Void>) {
	public var glyphLayoutVersion(get, set):haxe.Int64;

	inline function get_glyphLayoutVersion():haxe.Int64 return BitmapTextRuntime_Ffi.get_glyphLayoutVersion(this);

	inline function set_glyphLayoutVersion(value:haxe.Int64):haxe.Int64 { BitmapTextRuntime_Ffi.set_glyphLayoutVersion(this, value); return value; }
	public var lineCount(get, set):Int;

	inline function get_lineCount():Int return BitmapTextRuntime_Ffi.get_lineCount(this);

	inline function set_lineCount(value:Int):Int { BitmapTextRuntime_Ffi.set_lineCount(this, value); return value; }
	public var truncated(get, set):Bool;

	inline function get_truncated():Bool return BitmapTextRuntime_Ffi.get_truncated(this);

	inline function set_truncated(value:Bool):Bool { BitmapTextRuntime_Ffi.set_truncated(this, value); return value; }
}
