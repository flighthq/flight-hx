package flight.esm.sensors;

#if (js && flight_esm)
@:jsRequire("@flighthq/sensors/contract")
extern class Contract {
  public static function attachSensors(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability, sensors:flight.esm.types.sensors.Types.Sensors):Void;
  public static function computeEulerFromQuaternion(out:flight.esm.types.sensors.Types.OrientationReading, quaternion:flight.esm.types.sensors.Types.QuaternionReading):Void;
  public static function computeGravityFromOrientation(out:flight.esm.types.sensors.Types.MotionReading, orientation:flight.esm.types.sensors.Types.OrientationReading):Void;
  public static function computeQuaternionFromOrientationReading(out:flight.esm.types.sensors.Types.QuaternionReading, orientation:flight.esm.types.sensors.Types.OrientationReading):Void;
  public static function computeRotationMatrixFromQuaternion(out:Array<Float>, quaternion:flight.esm.types.sensors.Types.QuaternionReading):Void;
  public static function computeScreenRelativeOrientation(out:flight.esm.types.sensors.Types.OrientationReading, orientation:flight.esm.types.sensors.Types.OrientationReading, screenAngle:Float):Void;
  public static function computeWorldAccelerationFromDeviceAcceleration(out:flight.esm.types.sensors.Types.MotionReading, acceleration:flight.esm.types.sensors.Types.MotionReading, quaternion:flight.esm.types.sensors.Types.QuaternionReading):Void;
  public static function createAmbientLightReading():flight.esm.types.sensors.Types.AmbientLightReading;
  public static function createMotionReading():flight.esm.types.sensors.Types.MotionReading;
  public static function createOrientationReading():flight.esm.types.sensors.Types.OrientationReading;
  public static function createPressureReading():flight.esm.types.sensors.Types.PressureReading;
  public static function createProximityReading():flight.esm.types.sensors.Types.ProximityReading;
  public static function createQuaternionReading():flight.esm.types.sensors.Types.QuaternionReading;
  public static function createRotationRateReading():flight.esm.types.sensors.Types.RotationRateReading;
  public static function createSensors():flight.esm.types.sensors.Types.Sensors;
  public static function detachSensors(sensors:flight.esm.types.sensors.Types.Sensors):Void;
  public static function disposeSensors(sensors:flight.esm.types.sensors.Types.Sensors):Void;
  public static function getSensorsPermissionState(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability, ?sensor:Null<String>):js.lib.Promise<flight.esm.types.sensors.Types.SensorsPermissionState>;
  public static function hasAccelerometer(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability):Bool;
  public static function hasAmbientLightSensor(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability):Bool;
  public static function hasBarometer(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability):Bool;
  public static function hasGravitySensor(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability):Bool;
  public static function hasGyroscope(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability):Bool;
  public static function hasLinearAccelerationSensor(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability):Bool;
  public static function hasMagnetometer(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability):Bool;
  public static function hasOrientationSensor(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability):Bool;
  public static function hasProximitySensor(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability):Bool;
  public static function initializeAmbientLightReading(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.sensors.Types.AmbientLightReading>):Void;
  public static function initializeMotionReading(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.sensors.Types.MotionReading>):Void;
  public static function initializeOrientationReading(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.sensors.Types.OrientationReading>):Void;
  public static function initializePressureReading(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.sensors.Types.PressureReading>):Void;
  public static function initializeProximityReading(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.sensors.Types.ProximityReading>):Void;
  public static function initializeQuaternionReading(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.sensors.Types.QuaternionReading>):Void;
  public static function initializeRotationRateReading(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.sensors.Types.RotationRateReading>):Void;
  public static function initializeSensors(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.sensors.Types.Sensors>):Void;
  public static function isSensorsSupported(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability):Bool;
  public static function requestSensorsPermission(hostSensors:flight.esm.types.sensors.Types.HostSensorsCapability):js.lib.Promise<Bool>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
