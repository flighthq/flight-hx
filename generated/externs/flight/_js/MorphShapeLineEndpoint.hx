package flight._js;

@:jsRequire("flight")
private extern class MorphShapeLineEndpoint_Ffi {
	@:native("flight_get_morph_shape_line_endpoint_color") static function get_color(ptr:Dynamic):Int;
	@:native("flight_set_morph_shape_line_endpoint_color") static function set_color(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_morph_shape_line_endpoint_thickness") static function get_thickness(ptr:Dynamic):Float;
	@:native("flight_set_morph_shape_line_endpoint_thickness") static function set_thickness(ptr:Dynamic, value:Float):Float;
}

abstract MorphShapeLineEndpoint(Dynamic) {
	public var color(get, set):Int;

	inline function get_color():Int return MorphShapeLineEndpoint_Ffi.get_color(this);

	inline function set_color(value:Int):Int return MorphShapeLineEndpoint_Ffi.set_color(this, value);
	public var thickness(get, set):Float;

	inline function get_thickness():Float return MorphShapeLineEndpoint_Ffi.get_thickness(this);

	inline function set_thickness(value:Float):Float return MorphShapeLineEndpoint_Ffi.set_thickness(this, value);
}
