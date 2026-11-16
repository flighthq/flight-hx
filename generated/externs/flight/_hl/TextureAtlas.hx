package flight._hl;

private extern class TextureAtlas_Ffi {
	@:hlNative("flight", "flight_get_texture_atlas_image_height")
	static function get_imageHeight(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_texture_atlas_image_height")
	static function set_imageHeight(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_texture_atlas_image_width")
	static function get_imageWidth(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_texture_atlas_image_width")
	static function set_imageWidth(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_texture_atlas_scale")
	static function get_scale(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_texture_atlas_scale")
	static function set_scale(ptr:hl.Bytes, value:Single):Single;
}

abstract TextureAtlas(hl.Bytes) {
	public var imageHeight(get, set):Single;

	inline function get_imageHeight():Single return TextureAtlas_Ffi.get_imageHeight(this);
	inline function set_imageHeight(value:Single):Single { TextureAtlas_Ffi.set_imageHeight(this, value); return value; }
	public var imageWidth(get, set):Single;

	inline function get_imageWidth():Single return TextureAtlas_Ffi.get_imageWidth(this);
	inline function set_imageWidth(value:Single):Single { TextureAtlas_Ffi.set_imageWidth(this, value); return value; }
	public var scale(get, set):Single;

	inline function get_scale():Single return TextureAtlas_Ffi.get_scale(this);
	inline function set_scale(value:Single):Single { TextureAtlas_Ffi.set_scale(this, value); return value; }
}
