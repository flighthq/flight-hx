package flight._js;

@:jsRequire("flight")
private extern class StarlingPexColor_Ffi {
	@:native("flight_get_starling_pex_color_red") static function get_red(ptr:Dynamic):Float;
	@:native("flight_set_starling_pex_color_red") static function set_red(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_starling_pex_color_green") static function get_green(ptr:Dynamic):Float;
	@:native("flight_set_starling_pex_color_green") static function set_green(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_starling_pex_color_blue") static function get_blue(ptr:Dynamic):Float;
	@:native("flight_set_starling_pex_color_blue") static function set_blue(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_starling_pex_color_alpha") static function get_alpha(ptr:Dynamic):Float;
	@:native("flight_set_starling_pex_color_alpha") static function set_alpha(ptr:Dynamic, value:Float):Float;
}

abstract StarlingPexColor(Dynamic) {
	public var red(get, set):Float;

	inline function get_red():Float return StarlingPexColor_Ffi.get_red(this);

	inline function set_red(value:Float):Float return StarlingPexColor_Ffi.set_red(this, value);
	public var green(get, set):Float;

	inline function get_green():Float return StarlingPexColor_Ffi.get_green(this);

	inline function set_green(value:Float):Float return StarlingPexColor_Ffi.set_green(this, value);
	public var blue(get, set):Float;

	inline function get_blue():Float return StarlingPexColor_Ffi.get_blue(this);

	inline function set_blue(value:Float):Float return StarlingPexColor_Ffi.set_blue(this, value);
	public var alpha(get, set):Float;

	inline function get_alpha():Float return StarlingPexColor_Ffi.get_alpha(this);

	inline function set_alpha(value:Float):Float return StarlingPexColor_Ffi.set_alpha(this, value);
}
