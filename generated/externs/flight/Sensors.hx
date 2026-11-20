package flight;

#if hl

typedef Sensors = flight._hl.Sensors;

#elseif cpp

typedef Sensors = flight._cpp.Sensors;

#elseif (js && flight_esm)

typedef Sensors = flight._js.Sensors;

#elseif js

#error "flight.Sensors on js requires flight_esm."

#else

#error "flight.Sensors: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createSensors():Sensors {
	return flight._js._fn.Sensors.createSensors();
}
#else
extern inline function createSensors():Sensors {
#if hl
	return flight._hl._fn.Sensors.createSensors();
#elseif cpp
	return flight._cpp._fn.Sensors.createSensors();
#elseif (js && flight_esm)
	return flight._js._fn.Sensors.createSensors();
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachSensors(hostSensors:HostSensorsCapability, sensors:Sensors):Void {
	flight._js._fn.Sensors.attachSensors(hostSensors, sensors);
}
#else
extern inline function attachSensors(hostSensors:HostSensorsCapability, sensors:Sensors):Void {
#if hl
	flight._hl._fn.Sensors.attachSensors(hostSensors, sensors);
#elseif cpp
	flight._cpp._fn.Sensors.attachSensors(hostSensors, sensors);
#elseif (js && flight_esm)
	flight._js._fn.Sensors.attachSensors(hostSensors, sensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeEulerFromQuaternion(out:OrientationReading, quaternion:QuaternionReading):Void {
	flight._js._fn.Sensors.computeEulerFromQuaternion(out, quaternion);
}
#else
extern inline function computeEulerFromQuaternion(out:OrientationReading, quaternion:QuaternionReading):Void {
#if hl
	flight._hl._fn.Sensors.computeEulerFromQuaternion(out, quaternion);
#elseif cpp
	flight._cpp._fn.Sensors.computeEulerFromQuaternion(out, quaternion);
#elseif (js && flight_esm)
	flight._js._fn.Sensors.computeEulerFromQuaternion(out, quaternion);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeGravityFromOrientation(out:MotionReading, orientation:OrientationReading):Void {
	flight._js._fn.Sensors.computeGravityFromOrientation(out, orientation);
}
#else
extern inline function computeGravityFromOrientation(out:MotionReading, orientation:OrientationReading):Void {
#if hl
	flight._hl._fn.Sensors.computeGravityFromOrientation(out, orientation);
#elseif cpp
	flight._cpp._fn.Sensors.computeGravityFromOrientation(out, orientation);
#elseif (js && flight_esm)
	flight._js._fn.Sensors.computeGravityFromOrientation(out, orientation);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeQuaternionFromOrientationReading(out:QuaternionReading, orientation:OrientationReading):Void {
	flight._js._fn.Sensors.computeQuaternionFromOrientationReading(out, orientation);
}
#else
extern inline function computeQuaternionFromOrientationReading(out:QuaternionReading, orientation:OrientationReading):Void {
#if hl
	flight._hl._fn.Sensors.computeQuaternionFromOrientationReading(out, orientation);
#elseif cpp
	flight._cpp._fn.Sensors.computeQuaternionFromOrientationReading(out, orientation);
#elseif (js && flight_esm)
	flight._js._fn.Sensors.computeQuaternionFromOrientationReading(out, orientation);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeRotationMatrixFromQuaternion(out:Dynamic, quaternion:QuaternionReading):Void {
	flight._js._fn.Sensors.computeRotationMatrixFromQuaternion(out, quaternion);
}
#else
extern inline function computeRotationMatrixFromQuaternion(out:Dynamic, quaternion:QuaternionReading):Void {
#if hl
	flight._hl._fn.Sensors.computeRotationMatrixFromQuaternion(out, quaternion);
#elseif cpp
	flight._cpp._fn.Sensors.computeRotationMatrixFromQuaternion(out, quaternion);
#elseif (js && flight_esm)
	flight._js._fn.Sensors.computeRotationMatrixFromQuaternion(out, quaternion);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeScreenRelativeOrientation(out:OrientationReading, orientation:OrientationReading, screenAngle:Float):Void {
	flight._js._fn.Sensors.computeScreenRelativeOrientation(out, orientation, screenAngle);
}
#else
extern inline function computeScreenRelativeOrientation(out:OrientationReading, orientation:OrientationReading, screenAngle:Float):Void {
#if hl
	flight._hl._fn.Sensors.computeScreenRelativeOrientation(out, orientation, screenAngle);
#elseif cpp
	flight._cpp._fn.Sensors.computeScreenRelativeOrientation(out, orientation, screenAngle);
#elseif (js && flight_esm)
	flight._js._fn.Sensors.computeScreenRelativeOrientation(out, orientation, screenAngle);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeWorldAccelerationFromDeviceAcceleration(out:MotionReading, acceleration:MotionReading, quaternion:QuaternionReading):Void {
	flight._js._fn.Sensors.computeWorldAccelerationFromDeviceAcceleration(out, acceleration, quaternion);
}
#else
extern inline function computeWorldAccelerationFromDeviceAcceleration(out:MotionReading, acceleration:MotionReading, quaternion:QuaternionReading):Void {
#if hl
	flight._hl._fn.Sensors.computeWorldAccelerationFromDeviceAcceleration(out, acceleration, quaternion);
#elseif cpp
	flight._cpp._fn.Sensors.computeWorldAccelerationFromDeviceAcceleration(out, acceleration, quaternion);
#elseif (js && flight_esm)
	flight._js._fn.Sensors.computeWorldAccelerationFromDeviceAcceleration(out, acceleration, quaternion);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachSensors(sensors:Sensors):Void {
	flight._js._fn.Sensors.detachSensors(sensors);
}
#else
extern inline function detachSensors(sensors:Sensors):Void {
#if hl
	flight._hl._fn.Sensors.detachSensors(sensors);
#elseif cpp
	flight._cpp._fn.Sensors.detachSensors(sensors);
#elseif (js && flight_esm)
	flight._js._fn.Sensors.detachSensors(sensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeSensors(sensors:Sensors):Void {
	flight._js._fn.Sensors.disposeSensors(sensors);
}
#else
extern inline function disposeSensors(sensors:Sensors):Void {
#if hl
	flight._hl._fn.Sensors.disposeSensors(sensors);
#elseif cpp
	flight._cpp._fn.Sensors.disposeSensors(sensors);
#elseif (js && flight_esm)
	flight._js._fn.Sensors.disposeSensors(sensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasAccelerometer(hostSensors:HostSensorsCapability):Bool {
	return flight._js._fn.Sensors.hasAccelerometer(hostSensors);
}
#else
extern inline function hasAccelerometer(hostSensors:HostSensorsCapability):Bool {
#if hl
	return flight._hl._fn.Sensors.hasAccelerometer(hostSensors);
#elseif cpp
	return flight._cpp._fn.Sensors.hasAccelerometer(hostSensors);
#elseif (js && flight_esm)
	return flight._js._fn.Sensors.hasAccelerometer(hostSensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasAmbientLightSensor(hostSensors:HostSensorsCapability):Bool {
	return flight._js._fn.Sensors.hasAmbientLightSensor(hostSensors);
}
#else
extern inline function hasAmbientLightSensor(hostSensors:HostSensorsCapability):Bool {
#if hl
	return flight._hl._fn.Sensors.hasAmbientLightSensor(hostSensors);
#elseif cpp
	return flight._cpp._fn.Sensors.hasAmbientLightSensor(hostSensors);
#elseif (js && flight_esm)
	return flight._js._fn.Sensors.hasAmbientLightSensor(hostSensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasBarometer(hostSensors:HostSensorsCapability):Bool {
	return flight._js._fn.Sensors.hasBarometer(hostSensors);
}
#else
extern inline function hasBarometer(hostSensors:HostSensorsCapability):Bool {
#if hl
	return flight._hl._fn.Sensors.hasBarometer(hostSensors);
#elseif cpp
	return flight._cpp._fn.Sensors.hasBarometer(hostSensors);
#elseif (js && flight_esm)
	return flight._js._fn.Sensors.hasBarometer(hostSensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasGravitySensor(hostSensors:HostSensorsCapability):Bool {
	return flight._js._fn.Sensors.hasGravitySensor(hostSensors);
}
#else
extern inline function hasGravitySensor(hostSensors:HostSensorsCapability):Bool {
#if hl
	return flight._hl._fn.Sensors.hasGravitySensor(hostSensors);
#elseif cpp
	return flight._cpp._fn.Sensors.hasGravitySensor(hostSensors);
#elseif (js && flight_esm)
	return flight._js._fn.Sensors.hasGravitySensor(hostSensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasGyroscope(hostSensors:HostSensorsCapability):Bool {
	return flight._js._fn.Sensors.hasGyroscope(hostSensors);
}
#else
extern inline function hasGyroscope(hostSensors:HostSensorsCapability):Bool {
#if hl
	return flight._hl._fn.Sensors.hasGyroscope(hostSensors);
#elseif cpp
	return flight._cpp._fn.Sensors.hasGyroscope(hostSensors);
#elseif (js && flight_esm)
	return flight._js._fn.Sensors.hasGyroscope(hostSensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasLinearAccelerationSensor(hostSensors:HostSensorsCapability):Bool {
	return flight._js._fn.Sensors.hasLinearAccelerationSensor(hostSensors);
}
#else
extern inline function hasLinearAccelerationSensor(hostSensors:HostSensorsCapability):Bool {
#if hl
	return flight._hl._fn.Sensors.hasLinearAccelerationSensor(hostSensors);
#elseif cpp
	return flight._cpp._fn.Sensors.hasLinearAccelerationSensor(hostSensors);
#elseif (js && flight_esm)
	return flight._js._fn.Sensors.hasLinearAccelerationSensor(hostSensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasMagnetometer(hostSensors:HostSensorsCapability):Bool {
	return flight._js._fn.Sensors.hasMagnetometer(hostSensors);
}
#else
extern inline function hasMagnetometer(hostSensors:HostSensorsCapability):Bool {
#if hl
	return flight._hl._fn.Sensors.hasMagnetometer(hostSensors);
#elseif cpp
	return flight._cpp._fn.Sensors.hasMagnetometer(hostSensors);
#elseif (js && flight_esm)
	return flight._js._fn.Sensors.hasMagnetometer(hostSensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasOrientationSensor(hostSensors:HostSensorsCapability):Bool {
	return flight._js._fn.Sensors.hasOrientationSensor(hostSensors);
}
#else
extern inline function hasOrientationSensor(hostSensors:HostSensorsCapability):Bool {
#if hl
	return flight._hl._fn.Sensors.hasOrientationSensor(hostSensors);
#elseif cpp
	return flight._cpp._fn.Sensors.hasOrientationSensor(hostSensors);
#elseif (js && flight_esm)
	return flight._js._fn.Sensors.hasOrientationSensor(hostSensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasProximitySensor(hostSensors:HostSensorsCapability):Bool {
	return flight._js._fn.Sensors.hasProximitySensor(hostSensors);
}
#else
extern inline function hasProximitySensor(hostSensors:HostSensorsCapability):Bool {
#if hl
	return flight._hl._fn.Sensors.hasProximitySensor(hostSensors);
#elseif cpp
	return flight._cpp._fn.Sensors.hasProximitySensor(hostSensors);
#elseif (js && flight_esm)
	return flight._js._fn.Sensors.hasProximitySensor(hostSensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isSensorsSupported(hostSensors:HostSensorsCapability):Bool {
	return flight._js._fn.Sensors.isSensorsSupported(hostSensors);
}
#else
extern inline function isSensorsSupported(hostSensors:HostSensorsCapability):Bool {
#if hl
	return flight._hl._fn.Sensors.isSensorsSupported(hostSensors);
#elseif cpp
	return flight._cpp._fn.Sensors.isSensorsSupported(hostSensors);
#elseif (js && flight_esm)
	return flight._js._fn.Sensors.isSensorsSupported(hostSensors);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSensors(ptr:Sensors):Void {
	flight._js._fn.Sensors.freeSensors(ptr);
}
#else
extern inline function freeSensors(ptr:Sensors):Void {
#if hl
	flight._hl._fn.Sensors.freeSensors(ptr);
#elseif cpp
	flight._cpp._fn.Sensors.freeSensors(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Sensors.freeSensors(ptr);
#else
	#error "flight.Sensors: no backend for this target."
#end
}
#end
