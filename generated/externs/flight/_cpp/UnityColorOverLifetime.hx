package flight._cpp;

private extern class UnityColorOverLifetime_Ffi {
	@:native("flight_get_unity_color_over_lifetime_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_unity_color_over_lifetime_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract UnityColorOverLifetime(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return UnityColorOverLifetime_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { UnityColorOverLifetime_Ffi.set_enabled(this, value); return value; }
}
