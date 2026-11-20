package flight._hl;

private extern class FontVariationAxis_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_font_variation_axis_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_font_variation_axis_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_font_variation_axis_tag")
	static function get_tag(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_font_variation_axis_tag")
	static function set_tag(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract FontVariationAxis(hl.Bytes) {
	public var defaultValue(get, set):Single;

	inline function get_defaultValue():Single return this.getF32(0);

	inline function set_defaultValue(value:Single):Single { this.setF32(0, value); return value; }
	public var max(get, set):Single;

	inline function get_max():Single return this.getF32(4);

	inline function set_max(value:Single):Single { this.setF32(4, value); return value; }
	public var min(get, set):Single;

	inline function get_min():Single return this.getF32(8);

	inline function set_min(value:Single):Single { this.setF32(8, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = FontVariationAxis_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); FontVariationAxis_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } FontVariationAxis_Ffi.set_name(this, raw); return value; }
	public var tag(get, set):String;
	inline function get_tag():String { var raw = FontVariationAxis_Ffi.get_tag(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); FontVariationAxis_Ffi.freeString(raw); return value; }
	inline function set_tag(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } FontVariationAxis_Ffi.set_tag(this, raw); return value; }
}
