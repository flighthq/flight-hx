package flight._cpp;

private extern class TextureAtlasAsepriteSize_Ffi {
	@:native("flight_get_texture_atlas_aseprite_size_h") static function get_h(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_aseprite_size_h") static function set_h(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_texture_atlas_aseprite_size_w") static function get_w(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_aseprite_size_w") static function set_w(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextureAtlasAsepriteSize(cpp.Star<cpp.Void>) {
	public var h(get, set):Single;

	inline function get_h():Single return TextureAtlasAsepriteSize_Ffi.get_h(this);

	inline function set_h(value:Single):Single return TextureAtlasAsepriteSize_Ffi.set_h(this, value);
	public var w(get, set):Single;

	inline function get_w():Single return TextureAtlasAsepriteSize_Ffi.get_w(this);

	inline function set_w(value:Single):Single return TextureAtlasAsepriteSize_Ffi.set_w(this, value);
}
