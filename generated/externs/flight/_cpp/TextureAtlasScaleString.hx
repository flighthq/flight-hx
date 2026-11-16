package flight._cpp;

private extern class TextureAtlasScaleString_Ffi {
	@:native("flight_field_get_texture_atlas_scale_string_value")
	static function get_value(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_texture_atlas_scale_string_value")
	static function set_value(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract TextureAtlasScaleString(cpp.Star<cpp.Void>) {
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
		TextureAtlasScaleString_Ffi.set_value(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
