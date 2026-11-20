package flight.esm.types.sensors;

#if (js && flight_esm)
typedef AmbientLightReading = { illuminance:Float, accuracy:flight.esm.types.sensors.Types.SensorAccuracy, interval:Float, timestamp:Float };

typedef HostSensorsCapabilities = { ?query:Null<flight.esm.types.sensors.Types.HostSensorsCapability> };

typedef HostSensorsCapability = { getPermissionState:((?sensor:Null<String>) -> js.lib.Promise<flight.esm.types.sensors.Types.SensorsPermissionState>), isAmbientLightSupported:(() -> Bool), isBarometerSupported:(() -> Bool), isGravitySupported:(() -> Bool), isGyroscopeSupported:(() -> Bool), isLinearAccelerationSupported:(() -> Bool), isMagnetometerSupported:(() -> Bool), isMotionSupported:(() -> Bool), isOrientationSupported:(() -> Bool), isProximitySupported:(() -> Bool), requestPermission:(() -> js.lib.Promise<Bool>), subscribeAbsoluteOrientation:((listener:Dynamic, ?options:Null<flight.esm.types.sensors.Types.SensorSubscribeOptions>) -> Dynamic), subscribeAmbientLight:((listener:Dynamic, ?options:Null<flight.esm.types.sensors.Types.SensorSubscribeOptions>) -> Dynamic), subscribeBarometer:((listener:Dynamic, ?options:Null<flight.esm.types.sensors.Types.SensorSubscribeOptions>) -> Dynamic), subscribeGravity:((listener:Dynamic, ?options:Null<flight.esm.types.sensors.Types.SensorSubscribeOptions>) -> Dynamic), subscribeLinearAcceleration:((listener:Dynamic, ?options:Null<flight.esm.types.sensors.Types.SensorSubscribeOptions>) -> Dynamic), subscribeMagnetometer:((listener:Dynamic, ?options:Null<flight.esm.types.sensors.Types.SensorSubscribeOptions>) -> Dynamic), subscribeMotion:((listener:Dynamic, ?options:Null<flight.esm.types.sensors.Types.SensorSubscribeOptions>) -> Dynamic), subscribeOrientation:((listener:Dynamic, ?options:Null<flight.esm.types.sensors.Types.SensorSubscribeOptions>) -> Dynamic), subscribeProximity:((listener:Dynamic, ?options:Null<flight.esm.types.sensors.Types.SensorSubscribeOptions>) -> Dynamic), subscribeQuaternion:((listener:Dynamic, ?options:Null<flight.esm.types.sensors.Types.SensorSubscribeOptions>) -> Dynamic) };

typedef MotionReading = { x:Float, y:Float, z:Float, accuracy:flight.esm.types.sensors.Types.SensorAccuracy, interval:Float, timestamp:Float };

typedef OrientationReading = { alpha:Float, beta:Float, gamma:Float, absolute:Bool, heading:Float, accuracy:flight.esm.types.sensors.Types.SensorAccuracy, interval:Float, timestamp:Float };

typedef PressureReading = { altitude:Float, pressure:Float, accuracy:flight.esm.types.sensors.Types.SensorAccuracy, interval:Float, timestamp:Float };

typedef ProximityReading = { distance:Float, max:Float, near:Bool, accuracy:flight.esm.types.sensors.Types.SensorAccuracy, interval:Float, timestamp:Float };

typedef QuaternionReading = { w:Float, x:Float, y:Float, z:Float, accuracy:flight.esm.types.sensors.Types.SensorAccuracy, interval:Float, timestamp:Float };

typedef RotationRateReading = { alpha:Float, beta:Float, gamma:Float, accuracy:flight.esm.types.sensors.Types.SensorAccuracy, interval:Float, timestamp:Float };

typedef SensorAccuracy = String;

typedef SensorReading = { accuracy:flight.esm.types.sensors.Types.SensorAccuracy, interval:Float, timestamp:Float };

typedef SensorSubscribeOptions = { ?frequency:Null<Float> };

typedef Sensors = { onAbsoluteOrientation:flight.esm.types.signals.Types.Signal<flight.esm.types.sensors.Types.OrientationReading>, onAccelerometer:flight.esm.types.signals.Types.Signal<flight.esm.types.sensors.Types.MotionReading>, onAmbientLight:flight.esm.types.signals.Types.Signal<flight.esm.types.sensors.Types.AmbientLightReading>, onBarometer:flight.esm.types.signals.Types.Signal<flight.esm.types.sensors.Types.PressureReading>, onGravity:flight.esm.types.signals.Types.Signal<flight.esm.types.sensors.Types.MotionReading>, onGyroscope:flight.esm.types.signals.Types.Signal<flight.esm.types.sensors.Types.RotationRateReading>, onLinearAcceleration:flight.esm.types.signals.Types.Signal<flight.esm.types.sensors.Types.MotionReading>, onMagnetometer:flight.esm.types.signals.Types.Signal<flight.esm.types.sensors.Types.MotionReading>, onOrientation:flight.esm.types.signals.Types.Signal<flight.esm.types.sensors.Types.OrientationReading>, onProximity:flight.esm.types.signals.Types.Signal<flight.esm.types.sensors.Types.ProximityReading>, onQuaternion:flight.esm.types.signals.Types.Signal<flight.esm.types.sensors.Types.QuaternionReading> };

typedef SensorsPermissionState = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
