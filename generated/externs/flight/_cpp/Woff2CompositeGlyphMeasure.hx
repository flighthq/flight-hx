package flight._cpp;

private extern class Woff2CompositeGlyphMeasure_Ffi {
	@:native("flight_get_woff2_composite_glyph_measure_byte_length") static function get_byteLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff2_composite_glyph_measure_byte_length") static function set_byteLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_woff2_composite_glyph_measure_has_instructions") static function get_hasInstructions(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_woff2_composite_glyph_measure_has_instructions") static function set_hasInstructions(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Woff2CompositeGlyphMeasure(cpp.Star<cpp.Void>) {
	public var byteLength(get, set):Int;

	inline function get_byteLength():Int return Woff2CompositeGlyphMeasure_Ffi.get_byteLength(this);

	inline function set_byteLength(value:Int):Int { Woff2CompositeGlyphMeasure_Ffi.set_byteLength(this, value); return value; }
	public var hasInstructions(get, set):Bool;

	inline function get_hasInstructions():Bool return Woff2CompositeGlyphMeasure_Ffi.get_hasInstructions(this);

	inline function set_hasInstructions(value:Bool):Bool { Woff2CompositeGlyphMeasure_Ffi.set_hasInstructions(this, value); return value; }
}
