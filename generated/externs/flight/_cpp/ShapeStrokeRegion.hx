package flight._cpp;

private extern class ShapeStrokeRegion_Ffi {
	@:native("flight_get_shape_stroke_region_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_shape_stroke_region_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_shape_stroke_region_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_shape_stroke_region_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ShapeStrokeRegion(cpp.Star<cpp.Void>) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return ShapeStrokeRegion_Ffi.get_alpha(this);

	inline function set_alpha(value:Single):Single return ShapeStrokeRegion_Ffi.set_alpha(this, value);
	public var color(get, set):Int;

	inline function get_color():Int return ShapeStrokeRegion_Ffi.get_color(this);

	inline function set_color(value:Int):Int return ShapeStrokeRegion_Ffi.set_color(this, value);
}
