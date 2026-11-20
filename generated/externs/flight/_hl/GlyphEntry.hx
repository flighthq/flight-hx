package flight._hl;

private extern class GlyphEntry_Ffi {
	@:hlNative("flight", "flight_get_glyph_entry_advance")
	static function get_advance(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_glyph_entry_advance")
	static function set_advance(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_glyph_entry_bearing_x")
	static function get_bearingX(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_glyph_entry_bearing_x")
	static function set_bearingX(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_glyph_entry_bearing_y")
	static function get_bearingY(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_glyph_entry_bearing_y")
	static function set_bearingY(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_glyph_entry_height")
	static function get_height(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_glyph_entry_height")
	static function set_height(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_glyph_entry_page")
	static function get_page(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_glyph_entry_page")
	static function set_page(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_glyph_entry_width")
	static function get_width(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_glyph_entry_width")
	static function set_width(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_glyph_entry_x")
	static function get_x(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_glyph_entry_x")
	static function set_x(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_glyph_entry_y")
	static function get_y(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_glyph_entry_y")
	static function set_y(ptr:hl.Bytes, value:Int):Int;
}

abstract GlyphEntry(hl.Bytes) {
	public var advance(get, set):Single;

	inline function get_advance():Single return GlyphEntry_Ffi.get_advance(this);

	inline function set_advance(value:Single):Single { GlyphEntry_Ffi.set_advance(this, value); return value; }
	public var bearingX(get, set):Int;

	inline function get_bearingX():Int return GlyphEntry_Ffi.get_bearingX(this);

	inline function set_bearingX(value:Int):Int { GlyphEntry_Ffi.set_bearingX(this, value); return value; }
	public var bearingY(get, set):Int;

	inline function get_bearingY():Int return GlyphEntry_Ffi.get_bearingY(this);

	inline function set_bearingY(value:Int):Int { GlyphEntry_Ffi.set_bearingY(this, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return GlyphEntry_Ffi.get_height(this);

	inline function set_height(value:Int):Int { GlyphEntry_Ffi.set_height(this, value); return value; }
	public var page(get, set):Int;

	inline function get_page():Int return GlyphEntry_Ffi.get_page(this);

	inline function set_page(value:Int):Int { GlyphEntry_Ffi.set_page(this, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return GlyphEntry_Ffi.get_width(this);

	inline function set_width(value:Int):Int { GlyphEntry_Ffi.set_width(this, value); return value; }
	public var x(get, set):Int;

	inline function get_x():Int return GlyphEntry_Ffi.get_x(this);

	inline function set_x(value:Int):Int { GlyphEntry_Ffi.set_x(this, value); return value; }
	public var y(get, set):Int;

	inline function get_y():Int return GlyphEntry_Ffi.get_y(this);

	inline function set_y(value:Int):Int { GlyphEntry_Ffi.set_y(this, value); return value; }
}
