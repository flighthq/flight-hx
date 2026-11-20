package flight._cpp._fn;

extern class Sensors {
	@:native("flight_create_sensors")
	public static function createSensors():flight._cpp.Sensors;
	@:native("flight_attach_sensors")
	public static function attachSensors(hostSensors:flight._cpp.HostSensorsCapability, sensors:flight._cpp.Sensors):Void;
	@:native("flight_compute_euler_from_quaternion")
	public static function computeEulerFromQuaternion(out:flight._cpp.OrientationReading, quaternion:flight._cpp.QuaternionReading):Void;
	@:native("flight_compute_gravity_from_orientation")
	public static function computeGravityFromOrientation(out:flight._cpp.MotionReading, orientation:flight._cpp.OrientationReading):Void;
	@:native("flight_compute_quaternion_from_orientation_reading")
	public static function computeQuaternionFromOrientationReading(out:flight._cpp.QuaternionReading, orientation:flight._cpp.OrientationReading):Void;
	@:native("flight_compute_rotation_matrix_from_quaternion")
	public static function computeRotationMatrixFromQuaternion(out:cpp.Star<cpp.Void>, quaternion:flight._cpp.QuaternionReading):Void;
	@:native("flight_compute_screen_relative_orientation")
	public static function computeScreenRelativeOrientation(out:flight._cpp.OrientationReading, orientation:flight._cpp.OrientationReading, screenAngle:Float):Void;
	@:native("flight_compute_world_acceleration_from_device_acceleration")
	public static function computeWorldAccelerationFromDeviceAcceleration(out:flight._cpp.MotionReading, acceleration:flight._cpp.MotionReading, quaternion:flight._cpp.QuaternionReading):Void;
	@:native("flight_detach_sensors")
	public static function detachSensors(sensors:flight._cpp.Sensors):Void;
	@:native("flight_dispose_sensors")
	public static function disposeSensors(sensors:flight._cpp.Sensors):Void;
	@:native("flight_has_accelerometer")
	public static function hasAccelerometer(hostSensors:flight._cpp.HostSensorsCapability):Bool;
	@:native("flight_has_ambient_light_sensor")
	public static function hasAmbientLightSensor(hostSensors:flight._cpp.HostSensorsCapability):Bool;
	@:native("flight_has_barometer")
	public static function hasBarometer(hostSensors:flight._cpp.HostSensorsCapability):Bool;
	@:native("flight_has_gravity_sensor")
	public static function hasGravitySensor(hostSensors:flight._cpp.HostSensorsCapability):Bool;
	@:native("flight_has_gyroscope")
	public static function hasGyroscope(hostSensors:flight._cpp.HostSensorsCapability):Bool;
	@:native("flight_has_linear_acceleration_sensor")
	public static function hasLinearAccelerationSensor(hostSensors:flight._cpp.HostSensorsCapability):Bool;
	@:native("flight_has_magnetometer")
	public static function hasMagnetometer(hostSensors:flight._cpp.HostSensorsCapability):Bool;
	@:native("flight_has_orientation_sensor")
	public static function hasOrientationSensor(hostSensors:flight._cpp.HostSensorsCapability):Bool;
	@:native("flight_has_proximity_sensor")
	public static function hasProximitySensor(hostSensors:flight._cpp.HostSensorsCapability):Bool;
	@:native("flight_is_sensors_supported")
	public static function isSensorsSupported(hostSensors:flight._cpp.HostSensorsCapability):Bool;
	@:native("flight_free_sensors")
	public static function freeSensors(ptr:flight._cpp.Sensors):Void;
}
