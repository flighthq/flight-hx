package flight.esm.types.lifecycle;

#if (js && flight_esm)
typedef AppLaunchKind = String;

typedef AppLifecycle = { onStateChange:flight.esm.types.signals.Types.Signal<flight.esm.types.lifecycle.Types.AppLifecycleState>, onResume:flight.esm.types.signals.Types.Signal<Void>, onPause:flight.esm.types.signals.Types.Signal<Void>, onBackButton:flight.esm.types.signals.Types.Signal<Void>, onMemoryWarning:flight.esm.types.signals.Types.Signal<flight.esm.types.lifecycle.Types.AppMemoryPressure>, onSaveState:flight.esm.types.signals.Types.Signal<Dynamic>, onRestoreState:flight.esm.types.signals.Types.Signal<Dynamic> };

typedef AppLifecycleState = String;

typedef AppMemoryPressure = String;

typedef HostLifecycleCapabilities = { ?state:Null<flight.esm.types.lifecycle.Types.HostLifecycleCapability> };

typedef HostLifecycleCapability = { getState:(() -> flight.esm.types.lifecycle.Types.AppLifecycleState), subscribe:((listener:Dynamic) -> Dynamic), ?getLaunchKind:Null<(() -> flight.esm.types.lifecycle.Types.AppLaunchKind)>, ?subscribeMemoryWarning:Null<((listener:Dynamic) -> Dynamic)> };

typedef LifecycleOperation = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
