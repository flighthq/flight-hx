package flight._js;

@:jsRequire("flight")
private extern class LightProbeGrid_Ffi {
	@:native("flight_get_light_probe_grid_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_light_probe_grid_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
}

abstract LightProbeGrid(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return LightProbeGrid_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return LightProbeGrid_Ffi.set_enabled(this, value);
}
