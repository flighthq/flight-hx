package flight._js;

@:jsRequire("flight")
private extern class HasTransform2DRuntime_Ffi {
	@:native("flight_get_has_transform2_druntime_rotation_angle") static function get_rotationAngle(ptr:Dynamic):Float;
	@:native("flight_set_has_transform2_druntime_rotation_angle") static function set_rotationAngle(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_has_transform2_druntime_rotation_cosine") static function get_rotationCosine(ptr:Dynamic):Float;
	@:native("flight_set_has_transform2_druntime_rotation_cosine") static function set_rotationCosine(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_has_transform2_druntime_rotation_sine") static function get_rotationSine(ptr:Dynamic):Float;
	@:native("flight_set_has_transform2_druntime_rotation_sine") static function set_rotationSine(ptr:Dynamic, value:Float):Float;
}

abstract HasTransform2DRuntime(Dynamic) {
	public var rotationAngle(get, set):Float;

	inline function get_rotationAngle():Float return HasTransform2DRuntime_Ffi.get_rotationAngle(this);

	inline function set_rotationAngle(value:Float):Float return HasTransform2DRuntime_Ffi.set_rotationAngle(this, value);
	public var rotationCosine(get, set):Float;

	inline function get_rotationCosine():Float return HasTransform2DRuntime_Ffi.get_rotationCosine(this);

	inline function set_rotationCosine(value:Float):Float return HasTransform2DRuntime_Ffi.set_rotationCosine(this, value);
	public var rotationSine(get, set):Float;

	inline function get_rotationSine():Float return HasTransform2DRuntime_Ffi.get_rotationSine(this);

	inline function set_rotationSine(value:Float):Float return HasTransform2DRuntime_Ffi.set_rotationSine(this, value);
}
