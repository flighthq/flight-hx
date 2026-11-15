package flight._js;

@:jsRequire("flight")
private extern class MorphShapeColorEndpoint_Ffi {
	@:native("flight_get_morph_shape_color_endpoint_color") static function get_color(ptr:Dynamic):Int;
	@:native("flight_set_morph_shape_color_endpoint_color") static function set_color(ptr:Dynamic, value:Int):Int;
}

abstract MorphShapeColorEndpoint(Dynamic) {
	public var color(get, set):Int;

	inline function get_color():Int return MorphShapeColorEndpoint_Ffi.get_color(this);

	inline function set_color(value:Int):Int return MorphShapeColorEndpoint_Ffi.set_color(this, value);
}
