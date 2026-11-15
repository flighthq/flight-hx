package flight._js;

@:jsRequire("flight")
private extern class ShapeFillRegion_Ffi {
	@:native("flight_get_shape_fill_region_alpha") static function get_alpha(ptr:Dynamic):Float;
	@:native("flight_set_shape_fill_region_alpha") static function set_alpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_shape_fill_region_color") static function get_color(ptr:Dynamic):Int;
	@:native("flight_set_shape_fill_region_color") static function set_color(ptr:Dynamic, value:Int):Int;
}

abstract ShapeFillRegion(Dynamic) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return ShapeFillRegion_Ffi.get_alpha(this);

	inline function set_alpha(value:Float):Float return ShapeFillRegion_Ffi.set_alpha(this, value);
	public var color(get, set):Int;

	inline function get_color():Int return ShapeFillRegion_Ffi.get_color(this);

	inline function set_color(value:Int):Int return ShapeFillRegion_Ffi.set_color(this, value);
}
