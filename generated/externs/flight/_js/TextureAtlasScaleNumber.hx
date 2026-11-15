package flight._js;

@:jsRequire("flight")
private extern class TextureAtlasScaleNumber_Ffi {
	@:native("flight_get_texture_atlas_scale_number_value") static function get_value(ptr:Dynamic):Float;
	@:native("flight_set_texture_atlas_scale_number_value") static function set_value(ptr:Dynamic, value:Float):Float;
}

abstract TextureAtlasScaleNumber(Dynamic) {
	public var value(get, set):Float;

	inline function get_value():Float return TextureAtlasScaleNumber_Ffi.get_value(this);

	inline function set_value(value:Float):Float return TextureAtlasScaleNumber_Ffi.set_value(this, value);
}
