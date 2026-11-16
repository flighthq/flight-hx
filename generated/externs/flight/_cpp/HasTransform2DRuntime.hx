package flight._cpp;

private extern class HasTransform2DRuntime_Ffi {
	@:native("flight_get_has_transform2_druntime_rotation_angle") static function get_rotationAngle(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_druntime_rotation_angle") static function set_rotationAngle(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_has_transform2_druntime_rotation_cosine") static function get_rotationCosine(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_druntime_rotation_cosine") static function set_rotationCosine(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_has_transform2_druntime_rotation_sine") static function get_rotationSine(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_has_transform2_druntime_rotation_sine") static function set_rotationSine(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract HasTransform2DRuntime(cpp.Star<cpp.Void>) {
	public var rotationAngle(get, set):Single;

	inline function get_rotationAngle():Single return HasTransform2DRuntime_Ffi.get_rotationAngle(this);

	inline function set_rotationAngle(value:Single):Single { HasTransform2DRuntime_Ffi.set_rotationAngle(this, value); return value; }
	public var rotationCosine(get, set):Single;

	inline function get_rotationCosine():Single return HasTransform2DRuntime_Ffi.get_rotationCosine(this);

	inline function set_rotationCosine(value:Single):Single { HasTransform2DRuntime_Ffi.set_rotationCosine(this, value); return value; }
	public var rotationSine(get, set):Single;

	inline function get_rotationSine():Single return HasTransform2DRuntime_Ffi.get_rotationSine(this);

	inline function set_rotationSine(value:Single):Single { HasTransform2DRuntime_Ffi.set_rotationSine(this, value); return value; }
}
