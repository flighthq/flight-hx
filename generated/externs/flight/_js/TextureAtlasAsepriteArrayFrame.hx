package flight._js;

@:jsRequire("flight")
private extern class TextureAtlasAsepriteArrayFrame_Ffi {
	@:native("flight_get_texture_atlas_aseprite_array_frame_duration") static function get_duration(ptr:Dynamic):Float;
	@:native("flight_set_texture_atlas_aseprite_array_frame_duration") static function set_duration(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_texture_atlas_aseprite_array_frame_rotated") static function get_rotated(ptr:Dynamic):Bool;
	@:native("flight_set_texture_atlas_aseprite_array_frame_rotated") static function set_rotated(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_texture_atlas_aseprite_array_frame_trimmed") static function get_trimmed(ptr:Dynamic):Bool;
	@:native("flight_set_texture_atlas_aseprite_array_frame_trimmed") static function set_trimmed(ptr:Dynamic, value:Bool):Bool;
}

abstract TextureAtlasAsepriteArrayFrame(Dynamic) {
	public var duration(get, set):Float;

	inline function get_duration():Float return TextureAtlasAsepriteArrayFrame_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float return TextureAtlasAsepriteArrayFrame_Ffi.set_duration(this, value);
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return TextureAtlasAsepriteArrayFrame_Ffi.get_rotated(this);

	inline function set_rotated(value:Bool):Bool return TextureAtlasAsepriteArrayFrame_Ffi.set_rotated(this, value);
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return TextureAtlasAsepriteArrayFrame_Ffi.get_trimmed(this);

	inline function set_trimmed(value:Bool):Bool return TextureAtlasAsepriteArrayFrame_Ffi.set_trimmed(this, value);
}
