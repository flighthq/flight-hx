package flight.esm.types.sdk_sensors;

#if (js && flight_esm)
typedef AmbientLightReading = flight.esm.types.sensors.Types.AmbientLightReading;

typedef HostSensorsCapabilities = flight.esm.types.sensors.Types.HostSensorsCapabilities;

typedef HostSensorsCapability = flight.esm.types.sensors.Types.HostSensorsCapability;

typedef MotionReading = flight.esm.types.sensors.Types.MotionReading;

typedef OrientationReading = flight.esm.types.sensors.Types.OrientationReading;

typedef PressureReading = flight.esm.types.sensors.Types.PressureReading;

typedef ProximityReading = flight.esm.types.sensors.Types.ProximityReading;

typedef QuaternionReading = flight.esm.types.sensors.Types.QuaternionReading;

typedef RotationRateReading = flight.esm.types.sensors.Types.RotationRateReading;

typedef SensorAccuracy = flight.esm.types.sensors.Types.SensorAccuracy;

typedef SensorReading = flight.esm.types.sensors.Types.SensorReading;

typedef SensorSubscribeOptions = flight.esm.types.sensors.Types.SensorSubscribeOptions;

typedef Sensors = flight.esm.types.sensors.Types.Sensors;

typedef SensorsPermissionState = flight.esm.types.sensors.Types.SensorsPermissionState;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
