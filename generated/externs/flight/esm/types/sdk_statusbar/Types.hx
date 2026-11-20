package flight.esm.types.sdk_statusbar;

#if (js && flight_esm)
typedef HostStatusBarCapabilities = flight.esm.types.statusbar.Types.HostStatusBarCapabilities;

typedef HostStatusBarChangeCapability = flight.esm.types.statusbar.Types.HostStatusBarChangeCapability;

typedef HostStatusBarColorCapability = flight.esm.types.statusbar.Types.HostStatusBarColorCapability;

typedef HostStatusBarInfoCapability = flight.esm.types.statusbar.Types.HostStatusBarInfoCapability;

typedef HostStatusBarOverlaysCapability = flight.esm.types.statusbar.Types.HostStatusBarOverlaysCapability;

typedef HostStatusBarStyleCapability = flight.esm.types.statusbar.Types.HostStatusBarStyleCapability;

typedef HostStatusBarVisibilityCapability = flight.esm.types.statusbar.Types.HostStatusBarVisibilityCapability;

typedef StatusBar = flight.esm.types.statusbar.Types.StatusBar;

typedef StatusBarAnimation = flight.esm.types.statusbar.Types.StatusBarAnimation;

typedef StatusBarInfo = flight.esm.types.statusbar.Types.StatusBarInfo;

typedef StatusBarStyle = flight.esm.types.statusbar.Types.StatusBarStyle;

typedef StatusBarStyleEntry = flight.esm.types.statusbar.Types.StatusBarStyleEntry;

typedef StatusBarStyleEntryHandle = flight.esm.types.statusbar.Types.StatusBarStyleEntryHandle;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
