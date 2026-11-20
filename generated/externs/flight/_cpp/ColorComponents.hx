package flight._cpp;

private extern class ColorComponents_Ffi {
	@:native("flight_get_color_components_r") static function get_r(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_color_components_r") static function set_r(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_color_components_g") static function get_g(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_color_components_g") static function set_g(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_color_components_b") static function get_b(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_color_components_b") static function set_b(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract ColorComponents(cpp.Star<cpp.Void>) {
	public var r(get, set):Float;

	inline function get_r():Float return ColorComponents_Ffi.get_r(this);

	inline function set_r(value:Float):Float { ColorComponents_Ffi.set_r(this, value); return value; }
	public var g(get, set):Float;

	inline function get_g():Float return ColorComponents_Ffi.get_g(this);

	inline function set_g(value:Float):Float { ColorComponents_Ffi.set_g(this, value); return value; }
	public var b(get, set):Float;

	inline function get_b():Float return ColorComponents_Ffi.get_b(this);

	inline function set_b(value:Float):Float { ColorComponents_Ffi.set_b(this, value); return value; }
}
