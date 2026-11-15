package flight._cpp;

private extern class Physics2DRayResult_Ffi {
	@:native("flight_get_physics2_dray_result_hit_count") static function get_hitCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dray_result_hit_count") static function set_hitCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics2DRayResult(cpp.Star<cpp.Void>) {
	public var hitCount(get, set):Int;

	inline function get_hitCount():Int return Physics2DRayResult_Ffi.get_hitCount(this);

	inline function set_hitCount(value:Int):Int return Physics2DRayResult_Ffi.set_hitCount(this, value);
}
