package flight.esm.types.sdk_haptics;

#if (js && flight_esm)
typedef HapticImpactStyle = flight.esm.types.haptics.Types.HapticImpactStyle;

typedef HapticNotificationType = flight.esm.types.haptics.Types.HapticNotificationType;

typedef HapticsCapabilities = flight.esm.types.haptics.Types.HapticsCapabilities;

typedef HapticsOperation = flight.esm.types.haptics.Types.HapticsOperation;

typedef HostHapticsCapabilities = flight.esm.types.haptics.Types.HostHapticsCapabilities;

typedef HostHapticsCapability = flight.esm.types.haptics.Types.HostHapticsCapability;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
