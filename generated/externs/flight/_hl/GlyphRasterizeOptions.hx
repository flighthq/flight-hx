package flight._hl;

private extern class GlyphRasterizeOptions_Ffi {
	@:hlNative("flight", "flight_field_get_glyph_rasterize_options_font_family")
	static function get_fontFamily(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_glyph_rasterize_options_font_family")
	static function set_fontFamily(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract GlyphRasterizeOptions(hl.Bytes) {
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
		GlyphRasterizeOptions_Ffi.set_fontFamily(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var fontSize(get, set):Single;

	inline function get_fontSize():Single return this.getF32(24);

	inline function set_fontSize(value:Single):Single { this.setF32(24, value); return value; }
}
