package flight._cpp;

private extern class Physics3DQueryResult_Ffi {
	@:native("flight_get_physics3_dquery_result_hit_count") static function get_hitCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dquery_result_hit_count") static function set_hitCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics3DQueryResult(cpp.Star<cpp.Void>) {
	public var hitCount(get, set):Int;

	inline function get_hitCount():Int return Physics3DQueryResult_Ffi.get_hitCount(this);

	inline function set_hitCount(value:Int):Int { Physics3DQueryResult_Ffi.set_hitCount(this, value); return value; }
}
