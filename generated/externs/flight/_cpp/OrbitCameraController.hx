package flight._cpp;

private extern class OrbitCameraController_Ffi {
	@:native("flight_get_orbit_camera_controller_azimuth") static function get_azimuth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orbit_camera_controller_azimuth") static function set_azimuth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_orbit_camera_controller_distance") static function get_distance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orbit_camera_controller_distance") static function set_distance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_orbit_camera_controller_goal_azimuth") static function get_goalAzimuth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orbit_camera_controller_goal_azimuth") static function set_goalAzimuth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_orbit_camera_controller_goal_distance") static function get_goalDistance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orbit_camera_controller_goal_distance") static function set_goalDistance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_orbit_camera_controller_goal_polar") static function get_goalPolar(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orbit_camera_controller_goal_polar") static function set_goalPolar(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_orbit_camera_controller_max_distance") static function get_maxDistance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orbit_camera_controller_max_distance") static function set_maxDistance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_orbit_camera_controller_max_polar") static function get_maxPolar(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orbit_camera_controller_max_polar") static function set_maxPolar(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_orbit_camera_controller_min_distance") static function get_minDistance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orbit_camera_controller_min_distance") static function set_minDistance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_orbit_camera_controller_min_polar") static function get_minPolar(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orbit_camera_controller_min_polar") static function set_minPolar(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_orbit_camera_controller_polar") static function get_polar(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orbit_camera_controller_polar") static function set_polar(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_orbit_camera_controller_smooth_time") static function get_smoothTime(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orbit_camera_controller_smooth_time") static function set_smoothTime(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract OrbitCameraController(cpp.Star<cpp.Void>) {
	public var azimuth(get, set):Single;

	inline function get_azimuth():Single return OrbitCameraController_Ffi.get_azimuth(this);

	inline function set_azimuth(value:Single):Single return OrbitCameraController_Ffi.set_azimuth(this, value);
	public var distance(get, set):Single;

	inline function get_distance():Single return OrbitCameraController_Ffi.get_distance(this);

	inline function set_distance(value:Single):Single return OrbitCameraController_Ffi.set_distance(this, value);
	public var goalAzimuth(get, set):Single;

	inline function get_goalAzimuth():Single return OrbitCameraController_Ffi.get_goalAzimuth(this);

	inline function set_goalAzimuth(value:Single):Single return OrbitCameraController_Ffi.set_goalAzimuth(this, value);
	public var goalDistance(get, set):Single;

	inline function get_goalDistance():Single return OrbitCameraController_Ffi.get_goalDistance(this);

	inline function set_goalDistance(value:Single):Single return OrbitCameraController_Ffi.set_goalDistance(this, value);
	public var goalPolar(get, set):Single;

	inline function get_goalPolar():Single return OrbitCameraController_Ffi.get_goalPolar(this);

	inline function set_goalPolar(value:Single):Single return OrbitCameraController_Ffi.set_goalPolar(this, value);
	public var maxDistance(get, set):Single;

	inline function get_maxDistance():Single return OrbitCameraController_Ffi.get_maxDistance(this);

	inline function set_maxDistance(value:Single):Single return OrbitCameraController_Ffi.set_maxDistance(this, value);
	public var maxPolar(get, set):Single;

	inline function get_maxPolar():Single return OrbitCameraController_Ffi.get_maxPolar(this);

	inline function set_maxPolar(value:Single):Single return OrbitCameraController_Ffi.set_maxPolar(this, value);
	public var minDistance(get, set):Single;

	inline function get_minDistance():Single return OrbitCameraController_Ffi.get_minDistance(this);

	inline function set_minDistance(value:Single):Single return OrbitCameraController_Ffi.set_minDistance(this, value);
	public var minPolar(get, set):Single;

	inline function get_minPolar():Single return OrbitCameraController_Ffi.get_minPolar(this);

	inline function set_minPolar(value:Single):Single return OrbitCameraController_Ffi.set_minPolar(this, value);
	public var polar(get, set):Single;

	inline function get_polar():Single return OrbitCameraController_Ffi.get_polar(this);

	inline function set_polar(value:Single):Single return OrbitCameraController_Ffi.set_polar(this, value);
	public var smoothTime(get, set):Single;

	inline function get_smoothTime():Single return OrbitCameraController_Ffi.get_smoothTime(this);

	inline function set_smoothTime(value:Single):Single return OrbitCameraController_Ffi.set_smoothTime(this, value);
}
