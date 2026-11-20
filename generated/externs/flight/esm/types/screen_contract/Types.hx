package flight.esm.types.screen_contract;

#if (js && flight_esm)
typedef HostScreenCapabilities = flight.esm.types.screen.Types.HostScreenCapabilities;

typedef HostScreenChangeCapability = flight.esm.types.screen.Types.HostScreenChangeCapability;

typedef HostScreenDetailsCapability = flight.esm.types.screen.Types.HostScreenDetailsCapability;

typedef HostScreenPermissionChangeCapability = flight.esm.types.screen.Types.HostScreenPermissionChangeCapability;

typedef HostScreenQueryCapability = flight.esm.types.screen.Types.HostScreenQueryCapability;

typedef ScreenChangeEvent = flight.esm.types.screen.Types.ScreenChangeEvent;

typedef ScreenChangeKind = flight.esm.types.screen.Types.ScreenChangeKind;

typedef ScreenChangedMetrics = flight.esm.types.screen.Types.ScreenChangedMetrics;

typedef ScreenColorSpace = flight.esm.types.screen.Types.ScreenColorSpace;

typedef ScreenInfo = flight.esm.types.screen.Types.ScreenInfo;

typedef ScreenMode = flight.esm.types.screen.Types.ScreenMode;

typedef ScreenOrientation = flight.esm.types.screen.Types.ScreenOrientation;

typedef ScreenPermissionChange = flight.esm.types.screen.Types.ScreenPermissionChange;

typedef ScreenPermissionState = flight.esm.types.screen.Types.ScreenPermissionState;

typedef ScreenSignals = flight.esm.types.screen.Types.ScreenSignals;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
