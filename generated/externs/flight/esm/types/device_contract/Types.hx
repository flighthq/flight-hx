package flight.esm.types.device_contract;

#if (js && flight_esm)
typedef DeviceCapabilities = flight.esm.types.device.Types.DeviceCapabilities;

typedef DeviceDisplayMetrics = flight.esm.types.device.Types.DeviceDisplayMetrics;

typedef DeviceInfo = flight.esm.types.device.Types.DeviceInfo;

typedef HostDeviceCapabilities = flight.esm.types.device.Types.HostDeviceCapabilities;

typedef HostDeviceCapability = flight.esm.types.device.Types.HostDeviceCapability;

typedef SafeAreaInsets = flight.esm.types.device.Types.SafeAreaInsets;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
