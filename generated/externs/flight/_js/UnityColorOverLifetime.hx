package flight._js;

@:jsRequire("flight")
private extern class UnityColorOverLifetime_Ffi {
	@:native("flight_get_unity_color_over_lifetime_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_unity_color_over_lifetime_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
}

abstract UnityColorOverLifetime(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return UnityColorOverLifetime_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return UnityColorOverLifetime_Ffi.set_enabled(this, value);
}
