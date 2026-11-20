package flight.esm.types.screen;

#if (js && flight_esm)
typedef HostScreenCapabilities = { ?change:Null<flight.esm.types.screen.Types.HostScreenChangeCapability>, ?details:Null<flight.esm.types.screen.Types.HostScreenDetailsCapability>, ?permissionChange:Null<flight.esm.types.screen.Types.HostScreenPermissionChangeCapability>, ?query:Null<flight.esm.types.screen.Types.HostScreenQueryCapability> };

typedef HostScreenChangeCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostScreenDetailsCapability = { queryPermission:(() -> js.lib.Promise<flight.esm.types.screen.Types.ScreenPermissionState>), request:(() -> js.lib.Promise<Bool>) };

typedef HostScreenPermissionChangeCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostScreenQueryCapability = { ?destroy:Null<(() -> Void)>, getScreens:((out:Array<flight.esm.types.screen.Types.ScreenInfo>) -> Void), getPrimaryScreen:((out:flight.esm.types.screen.Types.ScreenInfo) -> Void), getCursorPosition:((out:Dynamic) -> Void) };

typedef ScreenChangeEvent = { kind:flight.esm.types.screen.Types.ScreenChangeKind, screen:flight.esm.types.screen.Types.ScreenInfo, changedMetrics:Null<flight.esm.types.screen.Types.ScreenChangedMetrics> };

typedef ScreenChangeKind = String;

typedef ScreenChangedMetrics = { bounds:Bool, workArea:Bool, scaleFactor:Bool, orientation:Bool };

typedef ScreenColorSpace = String;

typedef ScreenInfo = { id:Float, x:Float, y:Float, width:Float, height:Float, workWidth:Float, workHeight:Float, scaleFactor:Float, isPrimary:Bool, rotation:Float, orientation:flight.esm.types.screen.Types.ScreenOrientation, refreshRate:Float, colorDepth:Float, pixelDepth:Float, physicalWidth:Float, physicalHeight:Float, isHdr:Bool, colorSpace:flight.esm.types.screen.Types.ScreenColorSpace, maxLuminance:Float, depthPerComponent:Float, dpi:Float, label:String, internal:Bool, touchSupport:String, monochrome:Bool };

typedef ScreenMode = { width:Float, height:Float, refreshRate:Float, colorDepth:Float, pixelFormat:String };

typedef ScreenOrientation = String;

typedef ScreenPermissionChange = { onChange:flight.esm.types.signals.Types.Signal<flight.esm.types.screen.Types.ScreenPermissionState> };

typedef ScreenPermissionState = String;

typedef ScreenSignals = { onScreenAdded:flight.esm.types.signals.Types.Signal<flight.esm.types.screen.Types.ScreenInfo>, onScreenMetricsChanged:flight.esm.types.signals.Types.Signal<flight.esm.types.screen.Types.ScreenChangeEvent>, onScreenRemoved:flight.esm.types.signals.Types.Signal<flight.esm.types.screen.Types.ScreenInfo> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
