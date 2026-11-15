package flight._js;

@:jsRequire("flight")
private extern class UnityGradientAlphaKey_Ffi {
	@:native("flight_get_unity_gradient_alpha_key_alpha") static function get_alpha(ptr:Dynamic):Float;
	@:native("flight_set_unity_gradient_alpha_key_alpha") static function set_alpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_unity_gradient_alpha_key_time") static function get_time(ptr:Dynamic):Float;
	@:native("flight_set_unity_gradient_alpha_key_time") static function set_time(ptr:Dynamic, value:Float):Float;
}

abstract UnityGradientAlphaKey(Dynamic) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return UnityGradientAlphaKey_Ffi.get_alpha(this);

	inline function set_alpha(value:Float):Float return UnityGradientAlphaKey_Ffi.set_alpha(this, value);
	public var time(get, set):Float;

	inline function get_time():Float return UnityGradientAlphaKey_Ffi.get_time(this);

	inline function set_time(value:Float):Float return UnityGradientAlphaKey_Ffi.set_time(this, value);
}
