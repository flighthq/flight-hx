package flight.esm.types.app;

#if (js && flight_esm)
typedef AppActivationPolicy = String;

typedef AppEvents = { onActivate:flight.esm.types.signals.Types.Signal<Void>, onAllWindowsClosed:flight.esm.types.signals.Types.Signal<Void>, onOpenFile:flight.esm.types.signals.Types.Signal<String>, onQuitRequest:flight.esm.types.signals.Types.Signal<Void>, onReady:flight.esm.types.signals.Types.Signal<Void>, onSecondInstance:flight.esm.types.signals.Types.Signal<Array<String>> };

typedef AppLoginItem = { openAtLogin:Bool, openAsHidden:Bool, path:String, args:Array<String> };

typedef AppLoginItemLike = { ?openAtLogin:Null<Bool>, ?openAsHidden:Null<Bool>, ?path:Null<String>, ?args:Null<Array<String>> };

typedef AppLoop = { deltaTime:Float, elapsedTime:Float, frameCount:Float, interpolationAlpha:Float, isRunning:Bool, onActivate:Null<flight.esm.types.signals.Types.Signal<Void>>, onDeactivate:Null<flight.esm.types.signals.Types.Signal<Void>>, onError:Null<flight.esm.types.signals.Types.Signal<Dynamic>>, onExit:flight.esm.types.signals.Types.Signal<Void>, onFixedUpdate:Null<flight.esm.types.signals.Types.Signal<Float>>, onRender:flight.esm.types.signals.Types.Signal<Void>, onUpdate:flight.esm.types.signals.Types.Signal<Float>, windows:Array<flight.esm.types.app.Types.AppWindow> };

typedef AppLoopOptions = { ?maxDeltaTime:Null<Float>, ?targetFrameRate:Null<Float>, ?backgroundFrameRate:Null<Float>, ?fixedTimeStep:Null<Float>, ?maxUpdatesPerFrame:Null<Float> };

typedef AppPathKind = String;

typedef AppStepOptions = { ?fixedTimeStep:Null<Float>, ?maxDeltaTime:Null<Float>, ?maxUpdatesPerFrame:Null<Float> };

typedef AppWindow = { title:String, x:Float, y:Float, width:Float, height:Float, devicePixelRatio:Float, minimized:Bool, maximized:Bool, fullscreen:Bool, focused:Bool, visible:Bool, resizable:Bool, alwaysOnTop:Bool, skipTaskbar:Bool, opacity:Float, icon:String, minWidth:Float, minHeight:Float, maxWidth:Float, maxHeight:Float, onActivate:flight.esm.types.signals.Types.Signal<Void>, onClose:flight.esm.types.signals.Types.Signal<Void>, onCloseRequest:flight.esm.types.signals.Types.Signal<Void>, onDeactivate:flight.esm.types.signals.Types.Signal<Void>, onDropFile:flight.esm.types.signals.Types.Signal<String>, onFocusIn:flight.esm.types.signals.Types.Signal<Void>, onFocusOut:flight.esm.types.signals.Types.Signal<Void>, onFullscreenChanged:flight.esm.types.signals.Types.Signal<Void>, onMaximize:flight.esm.types.signals.Types.Signal<Void>, onMinimize:flight.esm.types.signals.Types.Signal<Void>, onMove:flight.esm.types.signals.Types.Signal<Void>, onOrientationChanged:flight.esm.types.signals.Types.Signal<Void>, onRenderContextLost:flight.esm.types.signals.Types.Signal<Void>, onRenderContextRestored:flight.esm.types.signals.Types.Signal<Void>, onResize:flight.esm.types.signals.Types.Signal<Void>, onRestore:flight.esm.types.signals.Types.Signal<Void> };

typedef FullscreenTargetHandle = { __brand:String };

typedef HostAppActivateCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostAppActivationPolicyCapability = { setActivationPolicy:((policy:flight.esm.types.app.Types.AppActivationPolicy) -> Void) };

typedef HostAppAllWindowsClosedCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostAppBadgeCapability = { setBadgeCount:((count:Float) -> js.lib.Promise<Bool>) };

typedef HostAppCapabilities = { ?activate:Null<flight.esm.types.app.Types.HostAppActivateCapability>, ?activationPolicy:Null<flight.esm.types.app.Types.HostAppActivationPolicyCapability>, ?allWindowsClosed:Null<flight.esm.types.app.Types.HostAppAllWindowsClosedCapability>, ?badge:Null<flight.esm.types.app.Types.HostAppBadgeCapability>, ?dock:Null<flight.esm.types.app.Types.HostAppDockCapability>, ?exit:Null<flight.esm.types.app.Types.HostAppExitCapability>, ?focus:Null<flight.esm.types.app.Types.HostAppFocusCapability>, ?hide:Null<flight.esm.types.app.Types.HostAppHideCapability>, ?locale:Null<flight.esm.types.app.Types.HostAppLocaleCapability>, ?loginItem:Null<flight.esm.types.app.Types.HostAppLoginItemCapability>, ?loop:Null<flight.esm.types.app.Types.HostAppLoopCapability>, ?name:Null<flight.esm.types.app.Types.HostAppNameCapability>, ?nameWrite:Null<flight.esm.types.app.Types.HostAppNameWriteCapability>, ?openFile:Null<flight.esm.types.app.Types.HostAppOpenFileCapability>, ?path:Null<flight.esm.types.app.Types.HostAppPathCapability>, ?quit:Null<flight.esm.types.app.Types.HostAppQuitCapability>, ?quitRequest:Null<flight.esm.types.app.Types.HostAppQuitRequestCapability>, ?ready:Null<flight.esm.types.app.Types.HostAppReadyCapability>, ?recentDocuments:Null<flight.esm.types.app.Types.HostAppRecentDocumentsCapability>, ?relaunch:Null<flight.esm.types.app.Types.HostAppRelaunchCapability>, ?secondInstance:Null<flight.esm.types.app.Types.HostAppSecondInstanceCapability>, ?show:Null<flight.esm.types.app.Types.HostAppShowCapability>, ?singleInstance:Null<flight.esm.types.app.Types.HostAppSingleInstanceCapability>, ?userModelId:Null<flight.esm.types.app.Types.HostAppUserModelIdCapability>, ?version:Null<flight.esm.types.app.Types.HostAppVersionCapability> };

typedef HostAppDockCapability = { bounceDock:(() -> Float), cancelAttention:((id:Float) -> Void), cancelDockBounce:((id:Float) -> Void), requestAttention:((critical:Bool) -> Float), setDockBadge:((text:String) -> Void), setDockMenu:((items:Array<flight.esm.types.menu.Types.MenuItemTemplate>) -> Void) };

typedef HostAppExitCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostAppFocusCapability = { focus:(() -> Void) };

typedef HostAppHideCapability = { hideApp:(() -> Void) };

typedef HostAppLocaleCapability = { getLocale:(() -> String), getPreferredSystemLanguages:(() -> Array<String>), getSystemLocale:(() -> String) };

typedef HostAppLoginItemCapability = { getLoginItem:(() -> flight.esm.types.app.Types.AppLoginItem), setLoginItem:((settings:flight.esm.types.app.Types.AppLoginItemLike) -> Void) };

typedef HostAppLoopCapability = { requestFrame:((callback_:Dynamic) -> Dynamic), cancelFrame:((handle:Dynamic) -> Void), now:(() -> Float) };

typedef HostAppNameCapability = { getName:(() -> String) };

typedef HostAppNameWriteCapability = { setName:((name:String) -> Void) };

typedef HostAppOpenFileCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostAppPathCapability = { getAppDirectoryPath:((kind:flight.esm.types.app.Types.AppPathKind) -> String), getAppPath:(() -> String), getExecutablePath:(() -> String) };

typedef HostAppQuitCapability = { quit:(() -> Void) };

typedef HostAppQuitRequestCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostAppReadyCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostAppRecentDocumentsCapability = { addRecentDocument:((path:String) -> Void), clearRecentDocuments:(() -> Void) };

typedef HostAppRelaunchCapability = { relaunch:(() -> Void) };

typedef HostAppSecondInstanceCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostAppShowCapability = { showApp:(() -> Void) };

typedef HostAppSingleInstanceCapability = { hasSingleInstanceLock:(() -> Bool), releaseSingleInstanceLock:(() -> Void), requestSingleInstanceLock:(() -> Bool) };

typedef HostAppUserModelIdCapability = { setUserModelId:((id:String) -> Void) };

typedef HostAppVersionCapability = { getVersion:(() -> String) };

typedef HostElementFullscreenCapability = { exit:(() -> js.lib.Promise<Bool>), request:((target:flight.esm.types.app.Types.FullscreenTargetHandle) -> js.lib.Promise<Bool>), ?subscribe:Null<((callback_:Dynamic) -> Dynamic)> };

typedef HostFullscreenCapabilities = { ?element:Null<flight.esm.types.app.Types.HostElementFullscreenCapability> };

typedef HostWindowAppearanceCapability = { ?setIcon:Null<((win:flight.esm.types.app.Types.AppWindow, icon:String) -> Void)>, ?setOpacity:Null<((win:flight.esm.types.app.Types.AppWindow, opacity:Float) -> Void)>, setTitle:((win:flight.esm.types.app.Types.AppWindow, title:String) -> Void) };

typedef HostWindowAttachCapability = { attach:((win:flight.esm.types.app.Types.AppWindow, handle:Dynamic, ownership:flight.esm.types.app.Types.WindowAttachmentOwnership) -> Bool) };

typedef HostWindowAttentionCapability = { ?flashWindowFrame:Null<((win:flight.esm.types.app.Types.AppWindow) -> Void)>, requestAttention:((win:flight.esm.types.app.Types.AppWindow, attention:Bool) -> Void) };

typedef HostWindowCapabilities = { ?appearance:Null<flight.esm.types.app.Types.HostWindowAppearanceCapability>, ?attach:Null<flight.esm.types.app.Types.HostWindowAttachCapability>, ?attention:Null<flight.esm.types.app.Types.HostWindowAttentionCapability>, ?contentProtection:Null<flight.esm.types.app.Types.HostWindowContentProtectionCapability>, ?focus:Null<flight.esm.types.app.Types.HostWindowFocusCapability>, ?fullscreen:Null<flight.esm.types.app.Types.HostWindowFullscreenCapability>, ?geometry:Null<flight.esm.types.app.Types.HostWindowGeometryCapability>, ?hierarchy:Null<flight.esm.types.app.Types.HostWindowHierarchyCapability>, ?lifecycle:Null<flight.esm.types.app.Types.HostWindowLifecycleCapability>, ?progress:Null<flight.esm.types.app.Types.HostWindowProgressCapability>, ?shadow:Null<flight.esm.types.app.Types.HostWindowShadowCapability>, ?shell:Null<flight.esm.types.app.Types.HostWindowShellCapability>, ?sizeConstraints:Null<flight.esm.types.app.Types.HostWindowSizeConstraintsCapability>, ?state:Null<flight.esm.types.app.Types.HostWindowStateCapability>, ?visibility:Null<flight.esm.types.app.Types.HostWindowVisibilityCapability>, ?zOrder:Null<flight.esm.types.app.Types.HostWindowZOrderCapability> };

typedef HostWindowContentProtectionCapability = { setContentProtection:((win:flight.esm.types.app.Types.AppWindow, enabled:Bool) -> Void) };

typedef HostWindowFocusCapability = { focus:((win:flight.esm.types.app.Types.AppWindow) -> Void) };

typedef HostWindowFullscreenCapability = { setFullscreen:((win:flight.esm.types.app.Types.AppWindow, fullscreen:Bool) -> Void) };

typedef HostWindowGeometryCapability = { ?center:Null<((win:flight.esm.types.app.Types.AppWindow) -> Void)>, getBounds:((win:flight.esm.types.app.Types.AppWindow, out:flight.esm.types.app.Types.WindowBounds) -> Void), setPosition:((win:flight.esm.types.app.Types.AppWindow, x:Float, y:Float) -> Void), setSize:((win:flight.esm.types.app.Types.AppWindow, width:Float, height:Float) -> Void), ?subscribeMove:Null<((listener:Dynamic) -> Dynamic)>, ?subscribeResize:Null<((target:flight.esm.types.app.Types.WindowResizeTargetHandle, listener:Dynamic) -> Dynamic)> };

typedef HostWindowHierarchyCapability = { setParent:((win:flight.esm.types.app.Types.AppWindow, parent:Null<flight.esm.types.app.Types.AppWindow>) -> Void) };

typedef HostWindowLifecycleCapability = { close:((win:flight.esm.types.app.Types.AppWindow) -> Void), open:((win:flight.esm.types.app.Types.AppWindow, options:flight.esm.types.app.Types.WindowOptions) -> Bool), ?subscribeClose:Null<((onCloseRequest:Dynamic, onClose:Dynamic) -> Dynamic)> };

typedef HostWindowProgressCapability = { setProgress:((win:flight.esm.types.app.Types.AppWindow, progress:Float) -> Void) };

typedef HostWindowShadowCapability = { setHasShadow:((win:flight.esm.types.app.Types.AppWindow, hasShadow:Bool) -> Void) };

typedef HostWindowShellCapability = { ?setMenuBarVisible:Null<((win:flight.esm.types.app.Types.AppWindow, visible:Bool) -> Void)>, ?setSkipTaskbar:Null<((win:flight.esm.types.app.Types.AppWindow, skip:Bool) -> Void)> };

typedef HostWindowSizeConstraintsCapability = { setMaximumSize:((win:flight.esm.types.app.Types.AppWindow, width:Float, height:Float) -> Void), setMinimumSize:((win:flight.esm.types.app.Types.AppWindow, width:Float, height:Float) -> Void), ?setResizable:Null<((win:flight.esm.types.app.Types.AppWindow, resizable:Bool) -> Void)> };

typedef HostWindowStateCapability = { maximize:((win:flight.esm.types.app.Types.AppWindow) -> Void), minimize:((win:flight.esm.types.app.Types.AppWindow) -> Void), restore:((win:flight.esm.types.app.Types.AppWindow) -> Void) };

typedef HostWindowVisibilityCapability = { hide:((win:flight.esm.types.app.Types.AppWindow) -> Void), show:((win:flight.esm.types.app.Types.AppWindow) -> Void), ?subscribeVisibility:Null<((listener:Dynamic) -> Dynamic)> };

typedef HostWindowZOrderCapability = { setAlwaysOnTop:((win:flight.esm.types.app.Types.AppWindow, alwaysOnTop:Bool) -> Void) };

typedef MobileOsProfile = String;

typedef NativeWindowHandle = Dynamic;

typedef WindowAttachmentOwnership = String;

typedef WindowBounds = { x:Float, y:Float, width:Float, height:Float };

typedef WindowOptions = { ?title:Null<String>, ?x:Null<Float>, ?y:Null<Float>, ?width:Null<Float>, ?height:Null<Float>, ?resizable:Null<Bool>, ?alwaysOnTop:Null<Bool>, ?fullscreen:Null<Bool>, ?minimized:Null<Bool>, ?maximized:Null<Bool>, ?visible:Null<Bool>, ?minWidth:Null<Float>, ?minHeight:Null<Float>, ?maxWidth:Null<Float>, ?maxHeight:Null<Float>, ?center:Null<Bool>, ?frame:Null<Bool>, ?transparent:Null<Bool> };

typedef WindowResizeTargetHandle = { __brand:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
