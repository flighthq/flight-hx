package flight._cpp;

private extern class GlyphAtlasRuntime_Ffi {
	@:native("flight_get_glyph_atlas_runtime_dirty") static function get_dirty(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_glyph_atlas_runtime_dirty") static function set_dirty(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_glyph_atlas_runtime_dirty_max_x") static function get_dirtyMaxX(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_dirty_max_x") static function set_dirtyMaxX(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_runtime_dirty_max_y") static function get_dirtyMaxY(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_dirty_max_y") static function set_dirtyMaxY(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_runtime_dirty_min_x") static function get_dirtyMinX(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_dirty_min_x") static function set_dirtyMinX(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_runtime_dirty_min_y") static function get_dirtyMinY(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_dirty_min_y") static function set_dirtyMinY(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_runtime_layout_version") static function get_layoutVersion(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_layout_version") static function set_layoutVersion(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_runtime_max_area") static function get_maxArea(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_max_area") static function set_maxArea(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_runtime_max_bytes") static function get_maxBytes(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_max_bytes") static function set_maxBytes(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_runtime_max_glyphs") static function get_maxGlyphs(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_max_glyphs") static function set_maxGlyphs(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_runtime_occupied_area") static function get_occupiedArea(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_occupied_area") static function set_occupiedArea(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_runtime_pack_bottom") static function get_packBottom(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_pack_bottom") static function set_packBottom(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_runtime_padding") static function get_padding(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_padding") static function set_padding(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_runtime_retained_bytes") static function get_retainedBytes(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_runtime_retained_bytes") static function set_retainedBytes(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract GlyphAtlasRuntime(cpp.Star<cpp.Void>) {
	public var dirty(get, set):Bool;

	inline function get_dirty():Bool return GlyphAtlasRuntime_Ffi.get_dirty(this);

	inline function set_dirty(value:Bool):Bool { GlyphAtlasRuntime_Ffi.set_dirty(this, value); return value; }
	public var dirtyMaxX(get, set):Int;

	inline function get_dirtyMaxX():Int return GlyphAtlasRuntime_Ffi.get_dirtyMaxX(this);

	inline function set_dirtyMaxX(value:Int):Int { GlyphAtlasRuntime_Ffi.set_dirtyMaxX(this, value); return value; }
	public var dirtyMaxY(get, set):Int;

	inline function get_dirtyMaxY():Int return GlyphAtlasRuntime_Ffi.get_dirtyMaxY(this);

	inline function set_dirtyMaxY(value:Int):Int { GlyphAtlasRuntime_Ffi.set_dirtyMaxY(this, value); return value; }
	public var dirtyMinX(get, set):Int;

	inline function get_dirtyMinX():Int return GlyphAtlasRuntime_Ffi.get_dirtyMinX(this);

	inline function set_dirtyMinX(value:Int):Int { GlyphAtlasRuntime_Ffi.set_dirtyMinX(this, value); return value; }
	public var dirtyMinY(get, set):Int;

	inline function get_dirtyMinY():Int return GlyphAtlasRuntime_Ffi.get_dirtyMinY(this);

	inline function set_dirtyMinY(value:Int):Int { GlyphAtlasRuntime_Ffi.set_dirtyMinY(this, value); return value; }
	public var layoutVersion(get, set):Int;

	inline function get_layoutVersion():Int return GlyphAtlasRuntime_Ffi.get_layoutVersion(this);

	inline function set_layoutVersion(value:Int):Int { GlyphAtlasRuntime_Ffi.set_layoutVersion(this, value); return value; }
	public var maxArea(get, set):Int;

	inline function get_maxArea():Int return GlyphAtlasRuntime_Ffi.get_maxArea(this);

	inline function set_maxArea(value:Int):Int { GlyphAtlasRuntime_Ffi.set_maxArea(this, value); return value; }
	public var maxBytes(get, set):Int;

	inline function get_maxBytes():Int return GlyphAtlasRuntime_Ffi.get_maxBytes(this);

	inline function set_maxBytes(value:Int):Int { GlyphAtlasRuntime_Ffi.set_maxBytes(this, value); return value; }
	public var maxGlyphs(get, set):Int;

	inline function get_maxGlyphs():Int return GlyphAtlasRuntime_Ffi.get_maxGlyphs(this);

	inline function set_maxGlyphs(value:Int):Int { GlyphAtlasRuntime_Ffi.set_maxGlyphs(this, value); return value; }
	public var occupiedArea(get, set):Int;

	inline function get_occupiedArea():Int return GlyphAtlasRuntime_Ffi.get_occupiedArea(this);

	inline function set_occupiedArea(value:Int):Int { GlyphAtlasRuntime_Ffi.set_occupiedArea(this, value); return value; }
	public var packBottom(get, set):Int;

	inline function get_packBottom():Int return GlyphAtlasRuntime_Ffi.get_packBottom(this);

	inline function set_packBottom(value:Int):Int { GlyphAtlasRuntime_Ffi.set_packBottom(this, value); return value; }
	public var padding(get, set):Int;

	inline function get_padding():Int return GlyphAtlasRuntime_Ffi.get_padding(this);

	inline function set_padding(value:Int):Int { GlyphAtlasRuntime_Ffi.set_padding(this, value); return value; }
	public var retainedBytes(get, set):Int;

	inline function get_retainedBytes():Int return GlyphAtlasRuntime_Ffi.get_retainedBytes(this);

	inline function set_retainedBytes(value:Int):Int { GlyphAtlasRuntime_Ffi.set_retainedBytes(this, value); return value; }
}
