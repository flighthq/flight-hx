package flight._cpp;

private extern class SpecularPbrExtension_Ffi {
	@:native("flight_get_specular_pbr_extension_specular") static function get_specular(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_specular_pbr_extension_specular") static function set_specular(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_specular_pbr_extension_specular_color") static function get_specularColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_specular_pbr_extension_specular_color") static function set_specularColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract SpecularPbrExtension(cpp.Star<cpp.Void>) {
	public var specular(get, set):Single;

	inline function get_specular():Single return SpecularPbrExtension_Ffi.get_specular(this);

	inline function set_specular(value:Single):Single { SpecularPbrExtension_Ffi.set_specular(this, value); return value; }
	public var specularColor(get, set):Int;

	inline function get_specularColor():Int return SpecularPbrExtension_Ffi.get_specularColor(this);

	inline function set_specularColor(value:Int):Int { SpecularPbrExtension_Ffi.set_specularColor(this, value); return value; }
}
