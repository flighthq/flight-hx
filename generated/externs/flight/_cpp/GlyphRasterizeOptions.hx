package flight._cpp;

private extern class GlyphRasterizeOptions_Ffi {
	@:native("flight_field_get_glyph_rasterize_options_font_family")
	static function get_fontFamily(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_glyph_rasterize_options_font_family")
	static function set_fontFamily(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_glyph_rasterize_options_font_size") static function get_fontSize(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_glyph_rasterize_options_font_size") static function set_fontSize(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GlyphRasterizeOptions(cpp.Star<cpp.Void>) {
	public var fontFamily(get, set):String;
	inline function get_fontFamily():String {
		final bytes = GlyphRasterizeOptions_Ffi.get_fontFamily(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_fontFamily(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		GlyphRasterizeOptions_Ffi.set_fontFamily(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var fontSize(get, set):Single;

	inline function get_fontSize():Single return GlyphRasterizeOptions_Ffi.get_fontSize(this);

	inline function set_fontSize(value:Single):Single { GlyphRasterizeOptions_Ffi.set_fontSize(this, value); return value; }
}
