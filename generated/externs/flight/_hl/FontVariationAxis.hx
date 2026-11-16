package flight._hl;

private extern class FontVariationAxis_Ffi {
	@:hlNative("flight", "flight_field_get_font_variation_axis_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_font_variation_axis_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_font_variation_axis_tag")
	static function get_tag(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_font_variation_axis_tag")
	static function set_tag(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
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
	inline function get_name():String {
		final bytes = FontVariationAxis_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		FontVariationAxis_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var tag(get, set):String;
	inline function get_tag():String {
		final bytes = FontVariationAxis_Ffi.get_tag(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_tag(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		FontVariationAxis_Ffi.set_tag(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
