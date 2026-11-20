package flight._hl._fn;

extern class Sensors {
	@:hlNative("flight", "flight_create_sensors")
	public static function createSensors():flight._hl.Sensors;
	@:hlNative("flight", "flight_attach_sensors")
	public static function attachSensors(hostSensors:flight._hl.HostSensorsCapability, sensors:flight._hl.Sensors):Void;
	@:hlNative("flight", "flight_compute_euler_from_quaternion")
	public static function computeEulerFromQuaternion(out:flight._hl.OrientationReading, quaternion:flight._hl.QuaternionReading):Void;
	@:hlNative("flight", "flight_compute_gravity_from_orientation")
	public static function computeGravityFromOrientation(out:flight._hl.MotionReading, orientation:flight._hl.OrientationReading):Void;
	@:hlNative("flight", "flight_compute_quaternion_from_orientation_reading")
	public static function computeQuaternionFromOrientationReading(out:flight._hl.QuaternionReading, orientation:flight._hl.OrientationReading):Void;
	@:hlNative("flight", "flight_compute_rotation_matrix_from_quaternion")
	public static function computeRotationMatrixFromQuaternion(out:hl.Bytes, quaternion:flight._hl.QuaternionReading):Void;
	@:hlNative("flight", "flight_compute_screen_relative_orientation")
	public static function computeScreenRelativeOrientation(out:flight._hl.OrientationReading, orientation:flight._hl.OrientationReading, screenAngle:Float):Void;
	@:hlNative("flight", "flight_compute_world_acceleration_from_device_acceleration")
	public static function computeWorldAccelerationFromDeviceAcceleration(out:flight._hl.MotionReading, acceleration:flight._hl.MotionReading, quaternion:flight._hl.QuaternionReading):Void;
	@:hlNative("flight", "flight_detach_sensors")
	public static function detachSensors(sensors:flight._hl.Sensors):Void;
	@:hlNative("flight", "flight_dispose_sensors")
	public static function disposeSensors(sensors:flight._hl.Sensors):Void;
	@:hlNative("flight", "flight_has_accelerometer")
	public static function hasAccelerometer(hostSensors:flight._hl.HostSensorsCapability):Bool;
	@:hlNative("flight", "flight_has_ambient_light_sensor")
	public static function hasAmbientLightSensor(hostSensors:flight._hl.HostSensorsCapability):Bool;
	@:hlNative("flight", "flight_has_barometer")
	public static function hasBarometer(hostSensors:flight._hl.HostSensorsCapability):Bool;
	@:hlNative("flight", "flight_has_gravity_sensor")
	public static function hasGravitySensor(hostSensors:flight._hl.HostSensorsCapability):Bool;
	@:hlNative("flight", "flight_has_gyroscope")
	public static function hasGyroscope(hostSensors:flight._hl.HostSensorsCapability):Bool;
	@:hlNative("flight", "flight_has_linear_acceleration_sensor")
	public static function hasLinearAccelerationSensor(hostSensors:flight._hl.HostSensorsCapability):Bool;
	@:hlNative("flight", "flight_has_magnetometer")
	public static function hasMagnetometer(hostSensors:flight._hl.HostSensorsCapability):Bool;
	@:hlNative("flight", "flight_has_orientation_sensor")
	public static function hasOrientationSensor(hostSensors:flight._hl.HostSensorsCapability):Bool;
	@:hlNative("flight", "flight_has_proximity_sensor")
	public static function hasProximitySensor(hostSensors:flight._hl.HostSensorsCapability):Bool;
	@:hlNative("flight", "flight_is_sensors_supported")
	public static function isSensorsSupported(hostSensors:flight._hl.HostSensorsCapability):Bool;
	@:hlNative("flight", "flight_free_sensors")
	public static function freeSensors(ptr:flight._hl.Sensors):Void;
}
