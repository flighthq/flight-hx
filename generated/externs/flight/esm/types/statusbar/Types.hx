package flight.esm.types.statusbar;

#if (js && flight_esm)
typedef HostStatusBarCapabilities = { ?change:Null<flight.esm.types.statusbar.Types.HostStatusBarChangeCapability>, ?color:Null<flight.esm.types.statusbar.Types.HostStatusBarColorCapability>, ?info:Null<flight.esm.types.statusbar.Types.HostStatusBarInfoCapability>, ?overlays:Null<flight.esm.types.statusbar.Types.HostStatusBarOverlaysCapability>, ?style:Null<flight.esm.types.statusbar.Types.HostStatusBarStyleCapability>, ?visibility:Null<flight.esm.types.statusbar.Types.HostStatusBarVisibilityCapability> };

typedef HostStatusBarChangeCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostStatusBarColorCapability = { setBackgroundColor:((color:Float, ?animated:Null<Bool>) -> Void) };

typedef HostStatusBarInfoCapability = { getInfo:((out:flight.esm.types.statusbar.Types.StatusBarInfo) -> Void) };

typedef HostStatusBarOverlaysCapability = { setOverlaysContent:((overlay:Bool) -> Void) };

typedef HostStatusBarStyleCapability = { setStyle:((style:flight.esm.types.statusbar.Types.StatusBarStyle) -> Void) };

typedef HostStatusBarVisibilityCapability = { setVisible:((visible:Bool, ?animation:Null<String>) -> Void) };

typedef StatusBar = { onChange:flight.esm.types.signals.Types.Signal<flight.esm.types.statusbar.Types.StatusBarInfo> };

typedef StatusBarAnimation = String;

typedef StatusBarInfo = { color:Float, height:Float, overlaysContent:Bool, style:flight.esm.types.statusbar.Types.StatusBarStyle, visible:Bool };

typedef StatusBarStyle = String;

typedef StatusBarStyleEntry = { ?animation:Null<String>, ?color:Null<Float>, ?overlaysContent:Null<Bool>, ?style:Null<String>, ?visible:Null<Bool> };

typedef StatusBarStyleEntryHandle = Float;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
