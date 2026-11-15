package flight._cpp;

private extern class FlyCameraController_Ffi {
	@:native("flight_get_fly_camera_controller_goal_pitch") static function get_goalPitch(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_fly_camera_controller_goal_pitch") static function set_goalPitch(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_fly_camera_controller_goal_yaw") static function get_goalYaw(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_fly_camera_controller_goal_yaw") static function set_goalYaw(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_fly_camera_controller_max_pitch") static function get_maxPitch(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_fly_camera_controller_max_pitch") static function set_maxPitch(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_fly_camera_controller_min_pitch") static function get_minPitch(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_fly_camera_controller_min_pitch") static function set_minPitch(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_fly_camera_controller_pitch") static function get_pitch(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_fly_camera_controller_pitch") static function set_pitch(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_fly_camera_controller_smooth_time") static function get_smoothTime(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_fly_camera_controller_smooth_time") static function set_smoothTime(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_fly_camera_controller_yaw") static function get_yaw(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_fly_camera_controller_yaw") static function set_yaw(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract FlyCameraController(cpp.Star<cpp.Void>) {
	public var goalPitch(get, set):Single;

	inline function get_goalPitch():Single return FlyCameraController_Ffi.get_goalPitch(this);

	inline function set_goalPitch(value:Single):Single return FlyCameraController_Ffi.set_goalPitch(this, value);
	public var goalYaw(get, set):Single;

	inline function get_goalYaw():Single return FlyCameraController_Ffi.get_goalYaw(this);

	inline function set_goalYaw(value:Single):Single return FlyCameraController_Ffi.set_goalYaw(this, value);
	public var maxPitch(get, set):Single;

	inline function get_maxPitch():Single return FlyCameraController_Ffi.get_maxPitch(this);

	inline function set_maxPitch(value:Single):Single return FlyCameraController_Ffi.set_maxPitch(this, value);
	public var minPitch(get, set):Single;

	inline function get_minPitch():Single return FlyCameraController_Ffi.get_minPitch(this);

	inline function set_minPitch(value:Single):Single return FlyCameraController_Ffi.set_minPitch(this, value);
	public var pitch(get, set):Single;

	inline function get_pitch():Single return FlyCameraController_Ffi.get_pitch(this);

	inline function set_pitch(value:Single):Single return FlyCameraController_Ffi.set_pitch(this, value);
	public var smoothTime(get, set):Single;

	inline function get_smoothTime():Single return FlyCameraController_Ffi.get_smoothTime(this);

	inline function set_smoothTime(value:Single):Single return FlyCameraController_Ffi.set_smoothTime(this, value);
	public var yaw(get, set):Single;

	inline function get_yaw():Single return FlyCameraController_Ffi.get_yaw(this);

	inline function set_yaw(value:Single):Single return FlyCameraController_Ffi.set_yaw(this, value);
}
