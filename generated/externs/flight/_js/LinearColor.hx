package flight._js;

@:jsRequire("flight")
private extern class LinearColor_Ffi {
	@:native("flight_get_linear_color_r") static function get_r(ptr:Dynamic):Float;
	@:native("flight_set_linear_color_r") static function set_r(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_linear_color_g") static function get_g(ptr:Dynamic):Float;
	@:native("flight_set_linear_color_g") static function set_g(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_linear_color_b") static function get_b(ptr:Dynamic):Float;
	@:native("flight_set_linear_color_b") static function set_b(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_linear_color_a") static function get_a(ptr:Dynamic):Float;
	@:native("flight_set_linear_color_a") static function set_a(ptr:Dynamic, value:Float):Float;
}

abstract LinearColor(Dynamic) {
	public var r(get, set):Float;

	inline function get_r():Float return LinearColor_Ffi.get_r(this);

	inline function set_r(value:Float):Float return LinearColor_Ffi.set_r(this, value);
	public var g(get, set):Float;

	inline function get_g():Float return LinearColor_Ffi.get_g(this);

	inline function set_g(value:Float):Float return LinearColor_Ffi.set_g(this, value);
	public var b(get, set):Float;

	inline function get_b():Float return LinearColor_Ffi.get_b(this);

	inline function set_b(value:Float):Float return LinearColor_Ffi.set_b(this, value);
	public var a(get, set):Float;

	inline function get_a():Float return LinearColor_Ffi.get_a(this);

	inline function set_a(value:Float):Float return LinearColor_Ffi.set_a(this, value);
}
