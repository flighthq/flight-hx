package flight._cpp;

private extern class MotionPath_Ffi {
	@:native("flight_get_motion_path_distance") static function get_distance(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_get_motion_path_length") static function get_length(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_motion_path_length") static function set_length(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_motion_path_speed") static function get_speed(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_motion_path_speed") static function set_speed(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract MotionPath(cpp.Star<cpp.Void>) {
	public var distance(get, never):Float;

	inline function get_distance():Float return MotionPath_Ffi.get_distance(this);
	public var length(get, set):Float;

	inline function get_length():Float return MotionPath_Ffi.get_length(this);

	inline function set_length(value:Float):Float { MotionPath_Ffi.set_length(this, value); return value; }
	public var speed(get, set):Float;

	inline function get_speed():Float return MotionPath_Ffi.get_speed(this);

	inline function set_speed(value:Float):Float { MotionPath_Ffi.set_speed(this, value); return value; }
}
