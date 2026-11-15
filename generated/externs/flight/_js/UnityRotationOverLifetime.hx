package flight._js;

@:jsRequire("flight")
private extern class UnityRotationOverLifetime_Ffi {
	@:native("flight_get_unity_rotation_over_lifetime_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_unity_rotation_over_lifetime_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
}

abstract UnityRotationOverLifetime(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return UnityRotationOverLifetime_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return UnityRotationOverLifetime_Ffi.set_enabled(this, value);
}
