package flight._cpp;

private extern class TextureAtlasAsepriteArrayFrame_Ffi {
	@:native("flight_get_texture_atlas_aseprite_array_frame_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_aseprite_array_frame_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_texture_atlas_aseprite_array_frame_filename")
	static function get_filename(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_texture_atlas_aseprite_array_frame_filename")
	static function set_filename(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_texture_atlas_aseprite_array_frame_rotated") static function get_rotated(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_texture_atlas_aseprite_array_frame_rotated") static function set_rotated(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_texture_atlas_aseprite_array_frame_trimmed") static function get_trimmed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_texture_atlas_aseprite_array_frame_trimmed") static function set_trimmed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract TextureAtlasAsepriteArrayFrame(cpp.Star<cpp.Void>) {
	public var duration(get, set):Single;

	inline function get_duration():Single return TextureAtlasAsepriteArrayFrame_Ffi.get_duration(this);

	inline function set_duration(value:Single):Single { TextureAtlasAsepriteArrayFrame_Ffi.set_duration(this, value); return value; }
	public var filename(get, set):String;
	inline function get_filename():String {
		final bytes = TextureAtlasAsepriteArrayFrame_Ffi.get_filename(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_filename(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TextureAtlasAsepriteArrayFrame_Ffi.set_filename(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return TextureAtlasAsepriteArrayFrame_Ffi.get_rotated(this);

	inline function set_rotated(value:Bool):Bool { TextureAtlasAsepriteArrayFrame_Ffi.set_rotated(this, value); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return TextureAtlasAsepriteArrayFrame_Ffi.get_trimmed(this);

	inline function set_trimmed(value:Bool):Bool { TextureAtlasAsepriteArrayFrame_Ffi.set_trimmed(this, value); return value; }
}
