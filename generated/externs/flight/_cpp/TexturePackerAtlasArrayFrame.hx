package flight._cpp;

private extern class TexturePackerAtlasArrayFrame_Ffi {
	@:native("flight_field_get_texture_packer_atlas_array_frame_filename")
	static function get_filename(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_texture_packer_atlas_array_frame_filename")
	static function set_filename(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_texture_packer_atlas_array_frame_rotated") static function get_rotated(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_texture_packer_atlas_array_frame_rotated") static function set_rotated(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_texture_packer_atlas_array_frame_trimmed") static function get_trimmed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_texture_packer_atlas_array_frame_trimmed") static function set_trimmed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract TexturePackerAtlasArrayFrame(cpp.Star<cpp.Void>) {
	public var filename(get, set):String;
	inline function get_filename():String {
		final bytes = TexturePackerAtlasArrayFrame_Ffi.get_filename(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_filename(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TexturePackerAtlasArrayFrame_Ffi.set_filename(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return TexturePackerAtlasArrayFrame_Ffi.get_rotated(this);

	inline function set_rotated(value:Bool):Bool { TexturePackerAtlasArrayFrame_Ffi.set_rotated(this, value); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return TexturePackerAtlasArrayFrame_Ffi.get_trimmed(this);

	inline function set_trimmed(value:Bool):Bool { TexturePackerAtlasArrayFrame_Ffi.set_trimmed(this, value); return value; }
}
