package flight._cpp;

private extern class TexturePackerAtlasFrameTag_Ffi {
	@:native("flight_get_texture_packer_atlas_frame_tag_from") static function get_from(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_packer_atlas_frame_tag_from") static function set_from(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_texture_packer_atlas_frame_tag_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_texture_packer_atlas_frame_tag_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_texture_packer_atlas_frame_tag_to") static function get_to(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_texture_packer_atlas_frame_tag_to") static function set_to(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TexturePackerAtlasFrameTag(cpp.Star<cpp.Void>) {
	public var from(get, set):Int;

	inline function get_from():Int return TexturePackerAtlasFrameTag_Ffi.get_from(this);

	inline function set_from(value:Int):Int { TexturePackerAtlasFrameTag_Ffi.set_from(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = TexturePackerAtlasFrameTag_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TexturePackerAtlasFrameTag_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var to(get, set):Int;

	inline function get_to():Int return TexturePackerAtlasFrameTag_Ffi.get_to(this);

	inline function set_to(value:Int):Int { TexturePackerAtlasFrameTag_Ffi.set_to(this, value); return value; }
}
