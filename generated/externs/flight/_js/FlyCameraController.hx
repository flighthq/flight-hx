package flight._js;

@:jsRequire("flight")
private extern class FlyCameraController_Ffi {
	@:native("flight_get_fly_camera_controller_goal_pitch") static function get_goalPitch(ptr:Dynamic):Float;
	@:native("flight_set_fly_camera_controller_goal_pitch") static function set_goalPitch(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_fly_camera_controller_goal_yaw") static function get_goalYaw(ptr:Dynamic):Float;
	@:native("flight_set_fly_camera_controller_goal_yaw") static function set_goalYaw(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_fly_camera_controller_max_pitch") static function get_maxPitch(ptr:Dynamic):Float;
	@:native("flight_set_fly_camera_controller_max_pitch") static function set_maxPitch(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_fly_camera_controller_min_pitch") static function get_minPitch(ptr:Dynamic):Float;
	@:native("flight_set_fly_camera_controller_min_pitch") static function set_minPitch(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_fly_camera_controller_pitch") static function get_pitch(ptr:Dynamic):Float;
	@:native("flight_set_fly_camera_controller_pitch") static function set_pitch(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_fly_camera_controller_smooth_time") static function get_smoothTime(ptr:Dynamic):Float;
	@:native("flight_set_fly_camera_controller_smooth_time") static function set_smoothTime(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_fly_camera_controller_yaw") static function get_yaw(ptr:Dynamic):Float;
	@:native("flight_set_fly_camera_controller_yaw") static function set_yaw(ptr:Dynamic, value:Float):Float;
}

abstract FlyCameraController(Dynamic) {
	public var goalPitch(get, set):Float;

	inline function get_goalPitch():Float return FlyCameraController_Ffi.get_goalPitch(this);

	inline function set_goalPitch(value:Float):Float return FlyCameraController_Ffi.set_goalPitch(this, value);
	public var goalYaw(get, set):Float;

	inline function get_goalYaw():Float return FlyCameraController_Ffi.get_goalYaw(this);

	inline function set_goalYaw(value:Float):Float return FlyCameraController_Ffi.set_goalYaw(this, value);
	public var maxPitch(get, set):Float;

	inline function get_maxPitch():Float return FlyCameraController_Ffi.get_maxPitch(this);

	inline function set_maxPitch(value:Float):Float return FlyCameraController_Ffi.set_maxPitch(this, value);
	public var minPitch(get, set):Float;

	inline function get_minPitch():Float return FlyCameraController_Ffi.get_minPitch(this);

	inline function set_minPitch(value:Float):Float return FlyCameraController_Ffi.set_minPitch(this, value);
	public var pitch(get, set):Float;

	inline function get_pitch():Float return FlyCameraController_Ffi.get_pitch(this);

	inline function set_pitch(value:Float):Float return FlyCameraController_Ffi.set_pitch(this, value);
	public var smoothTime(get, set):Float;

	inline function get_smoothTime():Float return FlyCameraController_Ffi.get_smoothTime(this);

	inline function set_smoothTime(value:Float):Float return FlyCameraController_Ffi.set_smoothTime(this, value);
	public var yaw(get, set):Float;

	inline function get_yaw():Float return FlyCameraController_Ffi.get_yaw(this);

	inline function set_yaw(value:Float):Float return FlyCameraController_Ffi.set_yaw(this, value);
}
