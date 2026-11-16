package flight._cpp;

private extern class TextureAtlasAsepriteRect_Ffi {
	@:native("flight_get_texture_atlas_aseprite_rect_h") static function get_h(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_aseprite_rect_h") static function set_h(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_texture_atlas_aseprite_rect_w") static function get_w(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_aseprite_rect_w") static function set_w(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_texture_atlas_aseprite_rect_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_aseprite_rect_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_texture_atlas_aseprite_rect_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_aseprite_rect_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextureAtlasAsepriteRect(cpp.Star<cpp.Void>) {
	public var h(get, set):Single;

	inline function get_h():Single return TextureAtlasAsepriteRect_Ffi.get_h(this);

	inline function set_h(value:Single):Single { TextureAtlasAsepriteRect_Ffi.set_h(this, value); return value; }
	public var w(get, set):Single;

	inline function get_w():Single return TextureAtlasAsepriteRect_Ffi.get_w(this);

	inline function set_w(value:Single):Single { TextureAtlasAsepriteRect_Ffi.set_w(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return TextureAtlasAsepriteRect_Ffi.get_x(this);

	inline function set_x(value:Single):Single { TextureAtlasAsepriteRect_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return TextureAtlasAsepriteRect_Ffi.get_y(this);

	inline function set_y(value:Single):Single { TextureAtlasAsepriteRect_Ffi.set_y(this, value); return value; }
}
