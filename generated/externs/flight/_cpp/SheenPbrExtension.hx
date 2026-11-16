package flight._cpp;

private extern class SheenPbrExtension_Ffi {
	@:native("flight_get_sheen_pbr_extension_sheen_color") static function get_sheenColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_sheen_pbr_extension_sheen_color") static function set_sheenColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_sheen_pbr_extension_sheen_roughness") static function get_sheenRoughness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_sheen_pbr_extension_sheen_roughness") static function set_sheenRoughness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SheenPbrExtension(cpp.Star<cpp.Void>) {
	public var sheenColor(get, set):Int;

	inline function get_sheenColor():Int return SheenPbrExtension_Ffi.get_sheenColor(this);

	inline function set_sheenColor(value:Int):Int { SheenPbrExtension_Ffi.set_sheenColor(this, value); return value; }
	public var sheenRoughness(get, set):Single;

	inline function get_sheenRoughness():Single return SheenPbrExtension_Ffi.get_sheenRoughness(this);

	inline function set_sheenRoughness(value:Single):Single { SheenPbrExtension_Ffi.set_sheenRoughness(this, value); return value; }
}
