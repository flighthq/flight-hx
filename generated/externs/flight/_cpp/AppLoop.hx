package flight._cpp;

private extern class AppLoop_Ffi {
	@:native("flight_get_app_loop_delta_time") static function get_deltaTime(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_app_loop_delta_time") static function set_deltaTime(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_app_loop_elapsed_time") static function get_elapsedTime(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_app_loop_elapsed_time") static function set_elapsedTime(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_app_loop_frame_count") static function get_frameCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_app_loop_frame_count") static function set_frameCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_app_loop_interpolation_alpha") static function get_interpolationAlpha(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_app_loop_interpolation_alpha") static function set_interpolationAlpha(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_app_loop_is_running") static function get_isRunning(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_app_loop_is_running") static function set_isRunning(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract AppLoop(cpp.Star<cpp.Void>) {
	public var deltaTime(get, set):Float;

	inline function get_deltaTime():Float return AppLoop_Ffi.get_deltaTime(this);

	inline function set_deltaTime(value:Float):Float { AppLoop_Ffi.set_deltaTime(this, value); return value; }
	public var elapsedTime(get, set):Float;

	inline function get_elapsedTime():Float return AppLoop_Ffi.get_elapsedTime(this);

	inline function set_elapsedTime(value:Float):Float { AppLoop_Ffi.set_elapsedTime(this, value); return value; }
	public var frameCount(get, set):Int;

	inline function get_frameCount():Int return AppLoop_Ffi.get_frameCount(this);

	inline function set_frameCount(value:Int):Int { AppLoop_Ffi.set_frameCount(this, value); return value; }
	public var interpolationAlpha(get, set):Float;

	inline function get_interpolationAlpha():Float return AppLoop_Ffi.get_interpolationAlpha(this);

	inline function set_interpolationAlpha(value:Float):Float { AppLoop_Ffi.set_interpolationAlpha(this, value); return value; }
	public var isRunning(get, set):Bool;

	inline function get_isRunning():Bool return AppLoop_Ffi.get_isRunning(this);

	inline function set_isRunning(value:Bool):Bool { AppLoop_Ffi.set_isRunning(this, value); return value; }
}
