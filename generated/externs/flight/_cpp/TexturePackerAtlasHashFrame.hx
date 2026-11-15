package flight._cpp;

private extern class TexturePackerAtlasHashFrame_Ffi {
	@:native("flight_get_texture_packer_atlas_hash_frame_rotated") static function get_rotated(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_texture_packer_atlas_hash_frame_rotated") static function set_rotated(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_texture_packer_atlas_hash_frame_trimmed") static function get_trimmed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_texture_packer_atlas_hash_frame_trimmed") static function set_trimmed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract TexturePackerAtlasHashFrame(cpp.Star<cpp.Void>) {
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return TexturePackerAtlasHashFrame_Ffi.get_rotated(this);

	inline function set_rotated(value:Bool):Bool return TexturePackerAtlasHashFrame_Ffi.set_rotated(this, value);
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return TexturePackerAtlasHashFrame_Ffi.get_trimmed(this);

	inline function set_trimmed(value:Bool):Bool return TexturePackerAtlasHashFrame_Ffi.set_trimmed(this, value);
}
