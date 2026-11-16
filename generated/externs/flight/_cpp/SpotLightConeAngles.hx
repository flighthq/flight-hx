package flight._cpp;

private extern class SpotLightConeAngles_Ffi {
	@:native("flight_get_spot_light_cone_angles_inner_degrees") static function get_innerDegrees(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spot_light_cone_angles_inner_degrees") static function set_innerDegrees(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_spot_light_cone_angles_outer_degrees") static function get_outerDegrees(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spot_light_cone_angles_outer_degrees") static function set_outerDegrees(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpotLightConeAngles(cpp.Star<cpp.Void>) {
	public var innerDegrees(get, set):Single;

	inline function get_innerDegrees():Single return SpotLightConeAngles_Ffi.get_innerDegrees(this);

	inline function set_innerDegrees(value:Single):Single { SpotLightConeAngles_Ffi.set_innerDegrees(this, value); return value; }
	public var outerDegrees(get, set):Single;

	inline function get_outerDegrees():Single return SpotLightConeAngles_Ffi.get_outerDegrees(this);

	inline function set_outerDegrees(value:Single):Single { SpotLightConeAngles_Ffi.set_outerDegrees(this, value); return value; }
}
