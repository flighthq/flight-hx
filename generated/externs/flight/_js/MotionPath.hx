package flight._js;

@:jsRequire("flight")
private extern class MotionPath_Ffi {
	@:native("flight_get_motion_path_distance") static function get_distance(ptr:Dynamic):Float;
	@:native("flight_set_motion_path_distance") static function set_distance(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_motion_path_length") static function get_length(ptr:Dynamic):Float;
	@:native("flight_set_motion_path_length") static function set_length(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_motion_path_speed") static function get_speed(ptr:Dynamic):Float;
	@:native("flight_set_motion_path_speed") static function set_speed(ptr:Dynamic, value:Float):Float;
}

abstract MotionPath(Dynamic) {
	public var distance(get, set):Float;

	inline function get_distance():Float return MotionPath_Ffi.get_distance(this);

	inline function set_distance(value:Float):Float return MotionPath_Ffi.set_distance(this, value);
	public var length(get, set):Float;

	inline function get_length():Float return MotionPath_Ffi.get_length(this);

	inline function set_length(value:Float):Float return MotionPath_Ffi.set_length(this, value);
	public var speed(get, set):Float;

	inline function get_speed():Float return MotionPath_Ffi.get_speed(this);

	inline function set_speed(value:Float):Float return MotionPath_Ffi.set_speed(this, value);
}
