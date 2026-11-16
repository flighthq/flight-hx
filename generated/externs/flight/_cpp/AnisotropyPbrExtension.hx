package flight._cpp;

private extern class AnisotropyPbrExtension_Ffi {
	@:native("flight_get_anisotropy_pbr_extension_anisotropy_rotation") static function get_anisotropyRotation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_anisotropy_pbr_extension_anisotropy_rotation") static function set_anisotropyRotation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_anisotropy_pbr_extension_anisotropy_strength") static function get_anisotropyStrength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_anisotropy_pbr_extension_anisotropy_strength") static function set_anisotropyStrength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AnisotropyPbrExtension(cpp.Star<cpp.Void>) {
	public var anisotropyRotation(get, set):Single;

	inline function get_anisotropyRotation():Single return AnisotropyPbrExtension_Ffi.get_anisotropyRotation(this);

	inline function set_anisotropyRotation(value:Single):Single { AnisotropyPbrExtension_Ffi.set_anisotropyRotation(this, value); return value; }
	public var anisotropyStrength(get, set):Single;

	inline function get_anisotropyStrength():Single return AnisotropyPbrExtension_Ffi.get_anisotropyStrength(this);

	inline function set_anisotropyStrength(value:Single):Single { AnisotropyPbrExtension_Ffi.set_anisotropyStrength(this, value); return value; }
}
