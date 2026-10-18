// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Sensors = flight._cpp.Sensors;

extern inline function attachSensors(hostSensors:flight.HostSensorsCapability, sensors:flight.Sensors):Void {
  flight._cpp._attempt.Attempt_Sensors_attachSensors.attachSensors(hostSensors, sensors);
}

extern inline function computeEulerFromQuaternion(out:flight.OrientationReading, quaternion:flight.QuaternionReading):Void {
  flight._cpp._attempt.Attempt_Sensors_computeEulerFromQuaternion.computeEulerFromQuaternion(out, quaternion);
}

extern inline function computeGravityFromOrientation(out:flight.MotionReading, orientation:flight.OrientationReading):Void {
  flight._cpp._attempt.Attempt_Sensors_computeGravityFromOrientation.computeGravityFromOrientation(out, orientation);
}

extern inline function computeQuaternionFromOrientationReading(out:flight.QuaternionReading, orientation:flight.OrientationReading):Void {
  flight._cpp._attempt.Attempt_Sensors_computeQuaternionFromOrientationReading.computeQuaternionFromOrientationReading(out, orientation);
}

extern inline function computeRotationMatrixFromQuaternion(out:Array<Float>, quaternion:flight.QuaternionReading):Void {
  flight._cpp._attempt.Attempt_Sensors_computeRotationMatrixFromQuaternion.computeRotationMatrixFromQuaternion(out, quaternion);
}

extern inline function computeScreenRelativeOrientation(out:flight.OrientationReading, orientation:flight.OrientationReading, screenAngle:Float):Void {
  flight._cpp._attempt.Attempt_Sensors_computeScreenRelativeOrientation.computeScreenRelativeOrientation(out, orientation, screenAngle);
}

extern inline function computeWorldAccelerationFromDeviceAcceleration(out:flight.MotionReading, acceleration:flight.MotionReading, quaternion:flight.QuaternionReading):Void {
  flight._cpp._attempt.Attempt_Sensors_computeWorldAccelerationFromDeviceAcceleration.computeWorldAccelerationFromDeviceAcceleration(out, acceleration, quaternion);
}

extern inline function createAmbientLightReading():flight.AmbientLightReading {
  return flight._cpp._attempt.Attempt_Sensors_createAmbientLightReading.createAmbientLightReading();
}

extern inline function createMotionReading():flight.MotionReading {
  return flight._cpp._attempt.Attempt_Sensors_createMotionReading.createMotionReading();
}

extern inline function createOrientationReading():flight.OrientationReading {
  return flight._cpp._attempt.Attempt_Sensors_createOrientationReading.createOrientationReading();
}

extern inline function createPressureReading():flight.PressureReading {
  return flight._cpp._attempt.Attempt_Sensors_createPressureReading.createPressureReading();
}

extern inline function createProximityReading():flight.ProximityReading {
  return flight._cpp._attempt.Attempt_Sensors_createProximityReading.createProximityReading();
}

extern inline function createQuaternionReading():flight.QuaternionReading {
  return flight._cpp._attempt.Attempt_Sensors_createQuaternionReading.createQuaternionReading();
}

extern inline function createRotationRateReading():flight.RotationRateReading {
  return flight._cpp._attempt.Attempt_Sensors_createRotationRateReading.createRotationRateReading();
}

extern inline function createSensors():flight.Sensors {
  return flight._cpp._attempt.Attempt_Sensors_createSensors.createSensors();
}

extern inline function detachSensors(sensors:flight.Sensors):Void {
  flight._cpp._attempt.Attempt_Sensors_detachSensors.detachSensors(sensors);
}

extern inline function disposeSensors(sensors:flight.Sensors):Void {
  flight._cpp._attempt.Attempt_Sensors_disposeSensors.disposeSensors(sensors);
}

extern inline function getSensorsPermissionState(hostSensors:flight.HostSensorsCapability, ?sensor:Dynamic):flight._internal._Promise<flight.SensorsPermissionState> {
  return flight._cpp._attempt.Attempt_Sensors_getSensorsPermissionState.getSensorsPermissionState(hostSensors, sensor);
}

extern inline function hasAccelerometer(hostSensors:flight.HostSensorsCapability):Bool {
  return flight._cpp._attempt.Attempt_Sensors_hasAccelerometer.hasAccelerometer(hostSensors);
}

extern inline function hasAmbientLightSensor(hostSensors:flight.HostSensorsCapability):Bool {
  return flight._cpp._attempt.Attempt_Sensors_hasAmbientLightSensor.hasAmbientLightSensor(hostSensors);
}

extern inline function hasBarometer(hostSensors:flight.HostSensorsCapability):Bool {
  return flight._cpp._attempt.Attempt_Sensors_hasBarometer.hasBarometer(hostSensors);
}

extern inline function hasGravitySensor(hostSensors:flight.HostSensorsCapability):Bool {
  return flight._cpp._attempt.Attempt_Sensors_hasGravitySensor.hasGravitySensor(hostSensors);
}

extern inline function hasGyroscope(hostSensors:flight.HostSensorsCapability):Bool {
  return flight._cpp._attempt.Attempt_Sensors_hasGyroscope.hasGyroscope(hostSensors);
}

extern inline function hasLinearAccelerationSensor(hostSensors:flight.HostSensorsCapability):Bool {
  return flight._cpp._attempt.Attempt_Sensors_hasLinearAccelerationSensor.hasLinearAccelerationSensor(hostSensors);
}

extern inline function hasMagnetometer(hostSensors:flight.HostSensorsCapability):Bool {
  return flight._cpp._attempt.Attempt_Sensors_hasMagnetometer.hasMagnetometer(hostSensors);
}

extern inline function hasOrientationSensor(hostSensors:flight.HostSensorsCapability):Bool {
  return flight._cpp._attempt.Attempt_Sensors_hasOrientationSensor.hasOrientationSensor(hostSensors);
}

extern inline function hasProximitySensor(hostSensors:flight.HostSensorsCapability):Bool {
  return flight._cpp._attempt.Attempt_Sensors_hasProximitySensor.hasProximitySensor(hostSensors);
}

extern inline function initializeAmbientLightReading(out:flight.EntityConstruction<flight.AmbientLightReading>):Void {
  flight._cpp._attempt.Attempt_Sensors_initializeAmbientLightReading.initializeAmbientLightReading(out);
}

extern inline function initializeMotionReading(out:flight.EntityConstruction<flight.MotionReading>):Void {
  flight._cpp._attempt.Attempt_Sensors_initializeMotionReading.initializeMotionReading(out);
}

extern inline function initializeOrientationReading(out:flight.EntityConstruction<flight.OrientationReading>):Void {
  flight._cpp._attempt.Attempt_Sensors_initializeOrientationReading.initializeOrientationReading(out);
}

extern inline function initializePressureReading(out:flight.EntityConstruction<flight.PressureReading>):Void {
  flight._cpp._attempt.Attempt_Sensors_initializePressureReading.initializePressureReading(out);
}

extern inline function initializeProximityReading(out:flight.EntityConstruction<flight.ProximityReading>):Void {
  flight._cpp._attempt.Attempt_Sensors_initializeProximityReading.initializeProximityReading(out);
}

extern inline function initializeQuaternionReading(out:flight.EntityConstruction<flight.QuaternionReading>):Void {
  flight._cpp._attempt.Attempt_Sensors_initializeQuaternionReading.initializeQuaternionReading(out);
}

extern inline function initializeRotationRateReading(out:flight.EntityConstruction<flight.RotationRateReading>):Void {
  flight._cpp._attempt.Attempt_Sensors_initializeRotationRateReading.initializeRotationRateReading(out);
}

extern inline function initializeSensors(out:flight.EntityConstruction<flight.Sensors>):Void {
  flight._cpp._attempt.Attempt_Sensors_initializeSensors.initializeSensors(out);
}

extern inline function isSensorsSupported(hostSensors:flight.HostSensorsCapability):Bool {
  return flight._cpp._attempt.Attempt_Sensors_isSensorsSupported.isSensorsSupported(hostSensors);
}

extern inline function requestSensorsPermission(hostSensors:flight.HostSensorsCapability):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Sensors_requestSensorsPermission.requestSensorsPermission(hostSensors);
}
