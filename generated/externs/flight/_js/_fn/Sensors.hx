package flight._js._fn;

@:jsRequire("@flighthq/sensors")
extern class Sensors {
	@:native("createSensors")
	public static function createSensors():flight._js.Sensors;
	@:native("attachSensors")
	public static function attachSensors(hostSensors:flight._js.HostSensorsCapability, sensors:flight._js.Sensors):Void;
	@:native("computeEulerFromQuaternion")
	public static function computeEulerFromQuaternion(out:flight._js.OrientationReading, quaternion:flight._js.QuaternionReading):Void;
	@:native("computeGravityFromOrientation")
	public static function computeGravityFromOrientation(out:flight._js.MotionReading, orientation:flight._js.OrientationReading):Void;
	@:native("computeQuaternionFromOrientationReading")
	public static function computeQuaternionFromOrientationReading(out:flight._js.QuaternionReading, orientation:flight._js.OrientationReading):Void;
	@:native("computeRotationMatrixFromQuaternion")
	public static function computeRotationMatrixFromQuaternion(out:Dynamic, quaternion:flight._js.QuaternionReading):Void;
	@:native("computeScreenRelativeOrientation")
	public static function computeScreenRelativeOrientation(out:flight._js.OrientationReading, orientation:flight._js.OrientationReading, screenAngle:Float):Void;
	@:native("computeWorldAccelerationFromDeviceAcceleration")
	public static function computeWorldAccelerationFromDeviceAcceleration(out:flight._js.MotionReading, acceleration:flight._js.MotionReading, quaternion:flight._js.QuaternionReading):Void;
	@:native("detachSensors")
	public static function detachSensors(sensors:flight._js.Sensors):Void;
	@:native("disposeSensors")
	public static function disposeSensors(sensors:flight._js.Sensors):Void;
	@:native("hasAccelerometer")
	public static function hasAccelerometer(hostSensors:flight._js.HostSensorsCapability):Bool;
	@:native("hasAmbientLightSensor")
	public static function hasAmbientLightSensor(hostSensors:flight._js.HostSensorsCapability):Bool;
	@:native("hasBarometer")
	public static function hasBarometer(hostSensors:flight._js.HostSensorsCapability):Bool;
	@:native("hasGravitySensor")
	public static function hasGravitySensor(hostSensors:flight._js.HostSensorsCapability):Bool;
	@:native("hasGyroscope")
	public static function hasGyroscope(hostSensors:flight._js.HostSensorsCapability):Bool;
	@:native("hasLinearAccelerationSensor")
	public static function hasLinearAccelerationSensor(hostSensors:flight._js.HostSensorsCapability):Bool;
	@:native("hasMagnetometer")
	public static function hasMagnetometer(hostSensors:flight._js.HostSensorsCapability):Bool;
	@:native("hasOrientationSensor")
	public static function hasOrientationSensor(hostSensors:flight._js.HostSensorsCapability):Bool;
	@:native("hasProximitySensor")
	public static function hasProximitySensor(hostSensors:flight._js.HostSensorsCapability):Bool;
	@:native("isSensorsSupported")
	public static function isSensorsSupported(hostSensors:flight._js.HostSensorsCapability):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSensors(ptr:flight._js.Sensors):Void {}
}
