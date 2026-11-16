package flight._cpp;

private extern class MorphShapeColorEndpoint_Ffi {
	@:native("flight_get_morph_shape_color_endpoint_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_color_endpoint_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract MorphShapeColorEndpoint(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return MorphShapeColorEndpoint_Ffi.get_color(this);

	inline function set_color(value:Int):Int { MorphShapeColorEndpoint_Ffi.set_color(this, value); return value; }
}
