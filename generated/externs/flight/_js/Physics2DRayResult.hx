package flight._js;

@:jsRequire("flight")
private extern class Physics2DRayResult_Ffi {
	@:native("flight_get_physics2_dray_result_hit_count") static function get_hitCount(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dray_result_hit_count") static function set_hitCount(ptr:Dynamic, value:Int):Int;
}

abstract Physics2DRayResult(Dynamic) {
	public var hitCount(get, set):Int;

	inline function get_hitCount():Int return Physics2DRayResult_Ffi.get_hitCount(this);

	inline function set_hitCount(value:Int):Int return Physics2DRayResult_Ffi.set_hitCount(this, value);
}
