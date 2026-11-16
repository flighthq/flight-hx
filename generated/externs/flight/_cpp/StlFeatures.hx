package flight._cpp;

private extern class StlFeatures_Ffi {
	@:native("flight_get_stl_features_triangle_count") static function get_triangleCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_stl_features_triangle_count") static function set_triangleCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract StlFeatures(cpp.Star<cpp.Void>) {
	public var triangleCount(get, set):Int;

	inline function get_triangleCount():Int return StlFeatures_Ffi.get_triangleCount(this);

	inline function set_triangleCount(value:Int):Int { StlFeatures_Ffi.set_triangleCount(this, value); return value; }
}
