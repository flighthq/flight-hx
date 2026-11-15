package flight._js;

@:jsRequire("flight")
private extern class UnityGradientColorKey_Ffi {
	@:native("flight_get_unity_gradient_color_key_b") static function get_b(ptr:Dynamic):Float;
	@:native("flight_set_unity_gradient_color_key_b") static function set_b(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_unity_gradient_color_key_g") static function get_g(ptr:Dynamic):Float;
	@:native("flight_set_unity_gradient_color_key_g") static function set_g(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_unity_gradient_color_key_r") static function get_r(ptr:Dynamic):Float;
	@:native("flight_set_unity_gradient_color_key_r") static function set_r(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_unity_gradient_color_key_time") static function get_time(ptr:Dynamic):Float;
	@:native("flight_set_unity_gradient_color_key_time") static function set_time(ptr:Dynamic, value:Float):Float;
}

abstract UnityGradientColorKey(Dynamic) {
	public var b(get, set):Float;

	inline function get_b():Float return UnityGradientColorKey_Ffi.get_b(this);

	inline function set_b(value:Float):Float return UnityGradientColorKey_Ffi.set_b(this, value);
	public var g(get, set):Float;

	inline function get_g():Float return UnityGradientColorKey_Ffi.get_g(this);

	inline function set_g(value:Float):Float return UnityGradientColorKey_Ffi.set_g(this, value);
	public var r(get, set):Float;

	inline function get_r():Float return UnityGradientColorKey_Ffi.get_r(this);

	inline function set_r(value:Float):Float return UnityGradientColorKey_Ffi.set_r(this, value);
	public var time(get, set):Float;

	inline function get_time():Float return UnityGradientColorKey_Ffi.get_time(this);

	inline function set_time(value:Float):Float return UnityGradientColorKey_Ffi.set_time(this, value);
}
