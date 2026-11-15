package flight._cpp;

private extern class UnityRotationOverLifetime_Ffi {
	@:native("flight_get_unity_rotation_over_lifetime_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_unity_rotation_over_lifetime_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract UnityRotationOverLifetime(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return UnityRotationOverLifetime_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return UnityRotationOverLifetime_Ffi.set_enabled(this, value);
}
