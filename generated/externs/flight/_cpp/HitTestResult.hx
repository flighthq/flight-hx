package flight._cpp;

private extern class HitTestResult_Ffi {
	@:native("flight_get_hit_test_result_local_x") static function get_localX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_hit_test_result_local_x") static function set_localX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_hit_test_result_local_y") static function get_localY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_hit_test_result_local_y") static function set_localY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_hit_test_result_sub_index") static function get_subIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_hit_test_result_sub_index") static function set_subIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract HitTestResult(cpp.Star<cpp.Void>) {
	public var localX(get, set):Float;

	inline function get_localX():Float return HitTestResult_Ffi.get_localX(this);

	inline function set_localX(value:Float):Float { HitTestResult_Ffi.set_localX(this, value); return value; }
	public var localY(get, set):Float;

	inline function get_localY():Float return HitTestResult_Ffi.get_localY(this);

	inline function set_localY(value:Float):Float { HitTestResult_Ffi.set_localY(this, value); return value; }
	public var subIndex(get, set):Int;

	inline function get_subIndex():Int return HitTestResult_Ffi.get_subIndex(this);

	inline function set_subIndex(value:Int):Int { HitTestResult_Ffi.set_subIndex(this, value); return value; }
}
