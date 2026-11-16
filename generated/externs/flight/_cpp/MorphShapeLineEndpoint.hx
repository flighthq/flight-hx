package flight._cpp;

private extern class MorphShapeLineEndpoint_Ffi {
	@:native("flight_get_morph_shape_line_endpoint_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_line_endpoint_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_morph_shape_line_endpoint_thickness") static function get_thickness(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_morph_shape_line_endpoint_thickness") static function set_thickness(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract MorphShapeLineEndpoint(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return MorphShapeLineEndpoint_Ffi.get_color(this);

	inline function set_color(value:Int):Int { MorphShapeLineEndpoint_Ffi.set_color(this, value); return value; }
	public var thickness(get, set):Float;

	inline function get_thickness():Float return MorphShapeLineEndpoint_Ffi.get_thickness(this);

	inline function set_thickness(value:Float):Float { MorphShapeLineEndpoint_Ffi.set_thickness(this, value); return value; }
}
