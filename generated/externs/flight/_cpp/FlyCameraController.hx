package flight._cpp;

private extern class FlyCameraController_Ffi {
	@:native("flight_get_fly_camera_controller_goal_pitch") static function get_goalPitch(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_fly_camera_controller_goal_pitch") static function set_goalPitch(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_fly_camera_controller_goal_yaw") static function get_goalYaw(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_fly_camera_controller_goal_yaw") static function set_goalYaw(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_fly_camera_controller_max_pitch") static function get_maxPitch(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_fly_camera_controller_max_pitch") static function set_maxPitch(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_fly_camera_controller_min_pitch") static function get_minPitch(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_fly_camera_controller_min_pitch") static function set_minPitch(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_fly_camera_controller_pitch") static function get_pitch(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_fly_camera_controller_pitch") static function set_pitch(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_fly_camera_controller_smooth_time") static function get_smoothTime(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_fly_camera_controller_smooth_time") static function set_smoothTime(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_fly_camera_controller_yaw") static function get_yaw(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_fly_camera_controller_yaw") static function set_yaw(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract FlyCameraController(cpp.Star<cpp.Void>) {
	public var goalPitch(get, set):Float;

	inline function get_goalPitch():Float return FlyCameraController_Ffi.get_goalPitch(this);

	inline function set_goalPitch(value:Float):Float { FlyCameraController_Ffi.set_goalPitch(this, value); return value; }
	public var goalYaw(get, set):Float;

	inline function get_goalYaw():Float return FlyCameraController_Ffi.get_goalYaw(this);

	inline function set_goalYaw(value:Float):Float { FlyCameraController_Ffi.set_goalYaw(this, value); return value; }
	public var maxPitch(get, set):Float;

	inline function get_maxPitch():Float return FlyCameraController_Ffi.get_maxPitch(this);

	inline function set_maxPitch(value:Float):Float { FlyCameraController_Ffi.set_maxPitch(this, value); return value; }
	public var minPitch(get, set):Float;

	inline function get_minPitch():Float return FlyCameraController_Ffi.get_minPitch(this);

	inline function set_minPitch(value:Float):Float { FlyCameraController_Ffi.set_minPitch(this, value); return value; }
	public var pitch(get, set):Float;

	inline function get_pitch():Float return FlyCameraController_Ffi.get_pitch(this);

	inline function set_pitch(value:Float):Float { FlyCameraController_Ffi.set_pitch(this, value); return value; }
	public var smoothTime(get, set):Float;

	inline function get_smoothTime():Float return FlyCameraController_Ffi.get_smoothTime(this);

	inline function set_smoothTime(value:Float):Float { FlyCameraController_Ffi.set_smoothTime(this, value); return value; }
	public var yaw(get, set):Float;

	inline function get_yaw():Float return FlyCameraController_Ffi.get_yaw(this);

	inline function set_yaw(value:Float):Float { FlyCameraController_Ffi.set_yaw(this, value); return value; }
}
