package flight._js;

@:jsRequire("flight")
private extern class TexturePackerAtlasArrayFrame_Ffi {
	@:native("flight_get_texture_packer_atlas_array_frame_rotated") static function get_rotated(ptr:Dynamic):Bool;
	@:native("flight_set_texture_packer_atlas_array_frame_rotated") static function set_rotated(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_texture_packer_atlas_array_frame_trimmed") static function get_trimmed(ptr:Dynamic):Bool;
	@:native("flight_set_texture_packer_atlas_array_frame_trimmed") static function set_trimmed(ptr:Dynamic, value:Bool):Bool;
}

abstract TexturePackerAtlasArrayFrame(Dynamic) {
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return TexturePackerAtlasArrayFrame_Ffi.get_rotated(this);

	inline function set_rotated(value:Bool):Bool return TexturePackerAtlasArrayFrame_Ffi.set_rotated(this, value);
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return TexturePackerAtlasArrayFrame_Ffi.get_trimmed(this);

	inline function set_trimmed(value:Bool):Bool return TexturePackerAtlasArrayFrame_Ffi.set_trimmed(this, value);
}
