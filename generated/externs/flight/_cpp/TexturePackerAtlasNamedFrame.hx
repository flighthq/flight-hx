package flight._cpp;

private extern class TexturePackerAtlasNamedFrame_Ffi {
	@:native("flight_field_get_texture_packer_atlas_named_frame_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_texture_packer_atlas_named_frame_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract TexturePackerAtlasNamedFrame(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = TexturePackerAtlasNamedFrame_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TexturePackerAtlasNamedFrame_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
