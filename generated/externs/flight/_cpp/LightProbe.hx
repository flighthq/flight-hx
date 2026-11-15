package flight._cpp;

private extern class LightProbe_Ffi {
	@:native("flight_get_light_probe_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_light_probe_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract LightProbe(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return LightProbe_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return LightProbe_Ffi.set_enabled(this, value);
}
