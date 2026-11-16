package flight._cpp;

private extern class TextureAtlasScaleNumber_Ffi {
	@:native("flight_get_texture_atlas_scale_number_value") static function get_value(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_texture_atlas_scale_number_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextureAtlasScaleNumber(cpp.Star<cpp.Void>) {
	public var value(get, set):Single;

	inline function get_value():Single return TextureAtlasScaleNumber_Ffi.get_value(this);

	inline function set_value(value:Single):Single { TextureAtlasScaleNumber_Ffi.set_value(this, value); return value; }
}
