package flight.esm.types.sdk_lifecycle;

#if (js && flight_esm)
typedef AppLaunchKind = flight.esm.types.lifecycle.Types.AppLaunchKind;

typedef AppLifecycle = flight.esm.types.lifecycle.Types.AppLifecycle;

typedef AppLifecycleState = flight.esm.types.lifecycle.Types.AppLifecycleState;

typedef AppMemoryPressure = flight.esm.types.lifecycle.Types.AppMemoryPressure;

typedef HostLifecycleCapabilities = flight.esm.types.lifecycle.Types.HostLifecycleCapabilities;

typedef HostLifecycleCapability = flight.esm.types.lifecycle.Types.HostLifecycleCapability;

typedef LifecycleOperation = flight.esm.types.lifecycle.Types.LifecycleOperation;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
