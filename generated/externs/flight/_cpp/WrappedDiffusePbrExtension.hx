package flight._cpp;

private extern class WrappedDiffusePbrExtension_Ffi {
	@:native("flight_get_wrapped_diffuse_pbr_extension_thickness") static function get_thickness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_wrapped_diffuse_pbr_extension_thickness") static function set_thickness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_wrapped_diffuse_pbr_extension_wrapped_diffuse_color") static function get_wrappedDiffuseColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_wrapped_diffuse_pbr_extension_wrapped_diffuse_color") static function set_wrappedDiffuseColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_wrapped_diffuse_pbr_extension_wrapped_diffuse_strength") static function get_wrappedDiffuseStrength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_wrapped_diffuse_pbr_extension_wrapped_diffuse_strength") static function set_wrappedDiffuseStrength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract WrappedDiffusePbrExtension(cpp.Star<cpp.Void>) {
	public var thickness(get, set):Single;

	inline function get_thickness():Single return WrappedDiffusePbrExtension_Ffi.get_thickness(this);

	inline function set_thickness(value:Single):Single { WrappedDiffusePbrExtension_Ffi.set_thickness(this, value); return value; }
	public var wrappedDiffuseColor(get, set):Int;

	inline function get_wrappedDiffuseColor():Int return WrappedDiffusePbrExtension_Ffi.get_wrappedDiffuseColor(this);

	inline function set_wrappedDiffuseColor(value:Int):Int { WrappedDiffusePbrExtension_Ffi.set_wrappedDiffuseColor(this, value); return value; }
	public var wrappedDiffuseStrength(get, set):Single;

	inline function get_wrappedDiffuseStrength():Single return WrappedDiffusePbrExtension_Ffi.get_wrappedDiffuseStrength(this);

	inline function set_wrappedDiffuseStrength(value:Single):Single { WrappedDiffusePbrExtension_Ffi.set_wrappedDiffuseStrength(this, value); return value; }
}
