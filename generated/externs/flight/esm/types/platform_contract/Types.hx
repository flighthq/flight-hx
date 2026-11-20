package flight.esm.types.platform_contract;

#if (js && flight_esm)
typedef HostPlatformCapabilities = flight.esm.types.platform.Types.HostPlatformCapabilities;

typedef HostPlatformCapability = flight.esm.types.platform.Types.HostPlatformCapability;

typedef PlatformEndianness = flight.esm.types.platform.Types.PlatformEndianness;

typedef PlatformEngine = flight.esm.types.platform.Types.PlatformEngine;

typedef PlatformInfo = flight.esm.types.platform.Types.PlatformInfo;

typedef PlatformKind = flight.esm.types.platform.Types.PlatformKind;

typedef PlatformName = flight.esm.types.platform.Types.PlatformName;

typedef PlatformRuntime = flight.esm.types.platform.Types.PlatformRuntime;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
