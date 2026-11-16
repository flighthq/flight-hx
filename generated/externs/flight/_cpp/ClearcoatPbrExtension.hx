package flight._cpp;

private extern class ClearcoatPbrExtension_Ffi {
	@:native("flight_get_clearcoat_pbr_extension_clearcoat") static function get_clearcoat(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_clearcoat_pbr_extension_clearcoat") static function set_clearcoat(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_clearcoat_pbr_extension_clearcoat_normal_scale") static function get_clearcoatNormalScale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_clearcoat_pbr_extension_clearcoat_normal_scale") static function set_clearcoatNormalScale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_clearcoat_pbr_extension_clearcoat_roughness") static function get_clearcoatRoughness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_clearcoat_pbr_extension_clearcoat_roughness") static function set_clearcoatRoughness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ClearcoatPbrExtension(cpp.Star<cpp.Void>) {
	public var clearcoat(get, set):Single;

	inline function get_clearcoat():Single return ClearcoatPbrExtension_Ffi.get_clearcoat(this);

	inline function set_clearcoat(value:Single):Single { ClearcoatPbrExtension_Ffi.set_clearcoat(this, value); return value; }
	public var clearcoatNormalScale(get, set):Single;

	inline function get_clearcoatNormalScale():Single return ClearcoatPbrExtension_Ffi.get_clearcoatNormalScale(this);

	inline function set_clearcoatNormalScale(value:Single):Single { ClearcoatPbrExtension_Ffi.set_clearcoatNormalScale(this, value); return value; }
	public var clearcoatRoughness(get, set):Single;

	inline function get_clearcoatRoughness():Single return ClearcoatPbrExtension_Ffi.get_clearcoatRoughness(this);

	inline function set_clearcoatRoughness(value:Single):Single { ClearcoatPbrExtension_Ffi.set_clearcoatRoughness(this, value); return value; }
}
