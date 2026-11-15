package flight._cpp;

private extern class TextureAtlas_Ffi {
	@:native("flight_get_texture_atlas_image_height") static function get_imageHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_image_height") static function set_imageHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_texture_atlas_image_width") static function get_imageWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_image_width") static function set_imageWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_texture_atlas_scale") static function get_scale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_scale") static function set_scale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextureAtlas(cpp.Star<cpp.Void>) {
	public var imageHeight(get, set):Single;

	inline function get_imageHeight():Single return TextureAtlas_Ffi.get_imageHeight(this);

	inline function set_imageHeight(value:Single):Single return TextureAtlas_Ffi.set_imageHeight(this, value);
	public var imageWidth(get, set):Single;

	inline function get_imageWidth():Single return TextureAtlas_Ffi.get_imageWidth(this);

	inline function set_imageWidth(value:Single):Single return TextureAtlas_Ffi.set_imageWidth(this, value);
	public var scale(get, set):Single;

	inline function get_scale():Single return TextureAtlas_Ffi.get_scale(this);

	inline function set_scale(value:Single):Single return TextureAtlas_Ffi.set_scale(this, value);
}
