package flight._hl;

private extern class TextureAtlasScaleString_Ffi {
	@:hlNative("flight", "flight_field_get_texture_atlas_scale_string_value")
	static function get_value(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_texture_atlas_scale_string_value")
	static function set_value(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract TextureAtlasScaleString(hl.Bytes) {
	public var value(get, set):String;
	inline function get_value():String {
		final bytes = TextureAtlasScaleString_Ffi.get_value(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_value(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TextureAtlasScaleString_Ffi.set_value(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
