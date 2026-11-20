package flight._cpp;

private extern class CaptureCheckResult_Ffi {
	@:native("flight_get_capture_check_result_pass") static function get_pass(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_capture_check_result_pass") static function set_pass(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_capture_check_result_difference") static function get_difference(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_capture_check_result_difference") static function set_difference(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_capture_check_result_tolerance") static function get_tolerance(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_capture_check_result_tolerance") static function set_tolerance(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract CaptureCheckResult(cpp.Star<cpp.Void>) {
	public var pass(get, set):Bool;

	inline function get_pass():Bool return CaptureCheckResult_Ffi.get_pass(this);

	inline function set_pass(value:Bool):Bool { CaptureCheckResult_Ffi.set_pass(this, value); return value; }
	public var difference(get, set):Float;

	inline function get_difference():Float return CaptureCheckResult_Ffi.get_difference(this);

	inline function set_difference(value:Float):Float { CaptureCheckResult_Ffi.set_difference(this, value); return value; }
	public var tolerance(get, set):Float;

	inline function get_tolerance():Float return CaptureCheckResult_Ffi.get_tolerance(this);

	inline function set_tolerance(value:Float):Float { CaptureCheckResult_Ffi.set_tolerance(this, value); return value; }
}
