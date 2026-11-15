package flight._js;

@:jsRequire("flight")
private extern class HsvColor_Ffi {
	@:native("flight_get_hsv_color_h") static function get_h(ptr:Dynamic):Float;
	@:native("flight_set_hsv_color_h") static function set_h(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_hsv_color_s") static function get_s(ptr:Dynamic):Float;
	@:native("flight_set_hsv_color_s") static function set_s(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_hsv_color_v") static function get_v(ptr:Dynamic):Float;
	@:native("flight_set_hsv_color_v") static function set_v(ptr:Dynamic, value:Float):Float;
}

abstract HsvColor(Dynamic) {
	public var h(get, set):Float;

	inline function get_h():Float return HsvColor_Ffi.get_h(this);

	inline function set_h(value:Float):Float return HsvColor_Ffi.set_h(this, value);
	public var s(get, set):Float;

	inline function get_s():Float return HsvColor_Ffi.get_s(this);

	inline function set_s(value:Float):Float return HsvColor_Ffi.set_s(this, value);
	public var v(get, set):Float;

	inline function get_v():Float return HsvColor_Ffi.get_v(this);

	inline function set_v(value:Float):Float return HsvColor_Ffi.set_v(this, value);
}
