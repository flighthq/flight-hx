package flight._hl;

private extern class GlyphRasterizeOptions_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_glyph_rasterize_options_font_family")
	static function get_fontFamily(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_glyph_rasterize_options_font_family")
	static function set_fontFamily(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract GlyphRasterizeOptions(hl.Bytes) {
	public var fontFamily(get, set):String;
	inline function get_fontFamily():String { var raw = GlyphRasterizeOptions_Ffi.get_fontFamily(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); GlyphRasterizeOptions_Ffi.freeString(raw); return value; }
	inline function set_fontFamily(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } GlyphRasterizeOptions_Ffi.set_fontFamily(this, raw); return value; }
	public var fontSize(get, set):Single;

	inline function get_fontSize():Single return this.getF32(24);

	inline function set_fontSize(value:Single):Single { this.setF32(24, value); return value; }
}
