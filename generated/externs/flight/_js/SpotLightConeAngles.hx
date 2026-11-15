package flight._js;

@:jsRequire("flight")
private extern class SpotLightConeAngles_Ffi {
	@:native("flight_get_spot_light_cone_angles_inner_degrees") static function get_innerDegrees(ptr:Dynamic):Float;
	@:native("flight_set_spot_light_cone_angles_inner_degrees") static function set_innerDegrees(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_spot_light_cone_angles_outer_degrees") static function get_outerDegrees(ptr:Dynamic):Float;
	@:native("flight_set_spot_light_cone_angles_outer_degrees") static function set_outerDegrees(ptr:Dynamic, value:Float):Float;
}

abstract SpotLightConeAngles(Dynamic) {
	public var innerDegrees(get, set):Float;

	inline function get_innerDegrees():Float return SpotLightConeAngles_Ffi.get_innerDegrees(this);

	inline function set_innerDegrees(value:Float):Float return SpotLightConeAngles_Ffi.set_innerDegrees(this, value);
	public var outerDegrees(get, set):Float;

	inline function get_outerDegrees():Float return SpotLightConeAngles_Ffi.get_outerDegrees(this);

	inline function set_outerDegrees(value:Float):Float return SpotLightConeAngles_Ffi.set_outerDegrees(this, value);
}
