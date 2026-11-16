package flight._cpp;

private extern class LightProbeGrid_Ffi {
	@:native("flight_get_light_probe_grid_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_light_probe_grid_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract LightProbeGrid(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return LightProbeGrid_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { LightProbeGrid_Ffi.set_enabled(this, value); return value; }
}
