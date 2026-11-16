package flight._cpp;

private extern class Woff2GlyfStreams_Ffi {
	@:native("flight_get_woff2_glyf_streams_glyph_count") static function get_glyphCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff2_glyf_streams_glyph_count") static function set_glyphCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_woff2_glyf_streams_index_format") static function get_indexFormat(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff2_glyf_streams_index_format") static function set_indexFormat(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Woff2GlyfStreams(cpp.Star<cpp.Void>) {
	public var glyphCount(get, set):Int;

	inline function get_glyphCount():Int return Woff2GlyfStreams_Ffi.get_glyphCount(this);

	inline function set_glyphCount(value:Int):Int { Woff2GlyfStreams_Ffi.set_glyphCount(this, value); return value; }
	public var indexFormat(get, set):Int;

	inline function get_indexFormat():Int return Woff2GlyfStreams_Ffi.get_indexFormat(this);

	inline function set_indexFormat(value:Int):Int { Woff2GlyfStreams_Ffi.set_indexFormat(this, value); return value; }
}
