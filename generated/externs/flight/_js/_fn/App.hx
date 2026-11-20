package flight._js._fn;

@:jsRequire("@flighthq/app")
extern class App {
	@:native("createAppEvents")
	public static function createAppEvents():flight._js.AppEvents;
	@:native("addAppRecentDocument")
	public static function addAppRecentDocument(hostAppRecentDocuments:flight._js.HostAppRecentDocumentsCapability, path:String):Void;
	@:native("attachAppActivate")
	public static function attachAppActivate(hostAppActivate:flight._js.HostAppActivateCapability, app:flight._js.AppEvents):Void;
	@:native("attachAppAllWindowsClosed")
	public static function attachAppAllWindowsClosed(hostAppAllWindowsClosed:flight._js.HostAppAllWindowsClosedCapability, app:flight._js.AppEvents):Void;
	@:native("attachAppEvents")
	public static function attachAppEvents(hostAppActivate:flight._js.HostAppActivateCapability, hostAppAllWindowsClosed:flight._js.HostAppAllWindowsClosedCapability, hostAppOpenFile:flight._js.HostAppOpenFileCapability, hostAppQuitRequest:flight._js.HostAppQuitRequestCapability, hostAppReady:flight._js.HostAppReadyCapability, hostAppSecondInstance:flight._js.HostAppSecondInstanceCapability, app:flight._js.AppEvents):Void;
	@:native("attachAppOpenFile")
	public static function attachAppOpenFile(hostAppOpenFile:flight._js.HostAppOpenFileCapability, app:flight._js.AppEvents):Void;
	@:native("attachAppQuitRequest")
	public static function attachAppQuitRequest(hostAppQuitRequest:flight._js.HostAppQuitRequestCapability, app:flight._js.AppEvents):Void;
	@:native("attachAppReady")
	public static function attachAppReady(hostAppReady:flight._js.HostAppReadyCapability, app:flight._js.AppEvents):Void;
	@:native("attachAppSecondInstance")
	public static function attachAppSecondInstance(hostAppSecondInstance:flight._js.HostAppSecondInstanceCapability, app:flight._js.AppEvents):Void;
	@:native("bounceAppDock")
	public static function bounceAppDock(hostAppDock:flight._js.HostAppDockCapability):Int;
	@:native("cancelAppAttention")
	public static function cancelAppAttention(hostAppDock:flight._js.HostAppDockCapability, id:Int):Void;
	@:native("cancelAppDockBounce")
	public static function cancelAppDockBounce(hostAppDock:flight._js.HostAppDockCapability, id:Int):Void;
	@:native("clearAppRecentDocuments")
	public static function clearAppRecentDocuments(hostAppRecentDocuments:flight._js.HostAppRecentDocumentsCapability):Void;
	@:native("detachAppEvents")
	public static function detachAppEvents(app:flight._js.AppEvents):Void;
	@:native("disposeAppEvents")
	public static function disposeAppEvents(app:flight._js.AppEvents):Void;
	@:native("focusApp")
	public static function focusApp(hostAppFocus:flight._js.HostAppFocusCapability):Void;
	@:native("getAppDirectoryPath")
	public static function getAppDirectoryPath(hostAppPath:flight._js.HostAppPathCapability, kind:Dynamic):String;
	@:native("getAppExecutablePath")
	public static function getAppExecutablePath(hostAppPath:flight._js.HostAppPathCapability):String;
	@:native("getAppLocale")
	public static function getAppLocale(hostAppLocale:flight._js.HostAppLocaleCapability):String;
	@:native("getAppLoginItem")
	public static function getAppLoginItem(hostAppLoginItem:flight._js.HostAppLoginItemCapability):flight._js.AppLoginItem;
	@:native("getAppName")
	public static function getAppName(hostAppName:flight._js.HostAppNameCapability):String;
	@:native("getAppPath")
	public static function getAppPath(hostAppPath:flight._js.HostAppPathCapability):String;
	@:native("getAppPreferredSystemLanguages")
	public static function getAppPreferredSystemLanguages(out:Dynamic, hostAppLocale:flight._js.HostAppLocaleCapability):Void;
	@:native("getAppSystemLocale")
	public static function getAppSystemLocale(hostAppLocale:flight._js.HostAppLocaleCapability):String;
	@:native("getAppVersion")
	public static function getAppVersion(hostAppVersion:flight._js.HostAppVersionCapability):String;
	@:native("hasAppSingleInstanceLock")
	public static function hasAppSingleInstanceLock(hostAppSingleInstance:flight._js.HostAppSingleInstanceCapability):Bool;
	@:native("hideApp")
	public static function hideApp(hostAppHide:flight._js.HostAppHideCapability):Void;
	@:native("isAppHidden")
	public static function isAppHidden(hostLifecycle:flight._js.HostLifecycleCapability):Bool;
	@:native("quitApp")
	public static function quitApp(hostAppQuit:flight._js.HostAppQuitCapability):Void;
	@:native("relaunchApp")
	public static function relaunchApp(hostAppRelaunch:flight._js.HostAppRelaunchCapability):Void;
	@:native("releaseAppSingleInstanceLock")
	public static function releaseAppSingleInstanceLock(hostAppSingleInstance:flight._js.HostAppSingleInstanceCapability):Void;
	@:native("requestAppAttention")
	public static function requestAppAttention(hostAppDock:flight._js.HostAppDockCapability, critical:Bool):Int;
	@:native("requestAppSingleInstanceLock")
	public static function requestAppSingleInstanceLock(hostAppSingleInstance:flight._js.HostAppSingleInstanceCapability):Bool;
	@:native("setAppActivationPolicy")
	public static function setAppActivationPolicy(hostAppActivationPolicy:flight._js.HostAppActivationPolicyCapability, policy:Dynamic):Void;
	@:native("setAppDockBadge")
	public static function setAppDockBadge(hostAppDock:flight._js.HostAppDockCapability, text:String):Void;
	@:native("setAppLoginItem")
	public static function setAppLoginItem(hostAppLoginItem:flight._js.HostAppLoginItemCapability, settings:flight._js.AppLoginItemLike):Void;
	@:native("setAppName")
	public static function setAppName(hostAppNameWrite:flight._js.HostAppNameWriteCapability, name:String):Void;
	@:native("setAppUserModelId")
	public static function setAppUserModelId(hostAppUserModelId:flight._js.HostAppUserModelIdCapability, id:String):Void;
	@:native("showApp")
	public static function showApp(hostAppShow:flight._js.HostAppShowCapability):Void;
	@:native("createAppLoop")
	public static function createAppLoop():Dynamic;
	@:native("attachAppLoopExit")
	public static function attachAppLoopExit(hostAppExit:flight._js.HostAppExitCapability, app:Dynamic):Void;
	@:native("attachAppLoopLifecycle")
	public static function attachAppLoopLifecycle(app:Dynamic, win:Dynamic):Void;
	@:native("detachAppLoopExit")
	public static function detachAppLoopExit(app:Dynamic):Void;
	@:native("disposeAppLoop")
	public static function disposeAppLoop(app:Dynamic):Void;
	@:native("enableAppLoopLifecycleSignals")
	public static function enableAppLoopLifecycleSignals(app:Dynamic):Void;
	@:native("forEachAppLoopWindow")
	public static function forEachAppLoopWindow(app:Dynamic, visitor:Dynamic):Void;
	@:native("getAppLoopFrameRate")
	public static function getAppLoopFrameRate(app:Dynamic):Float;
	@:native("getAppLoopMainWindow")
	public static function getAppLoopMainWindow(app:Dynamic):Null<Dynamic>;
	@:native("isAppLoopRunning")
	public static function isAppLoopRunning(app:Dynamic):Bool;
	@:native("pauseAppLoop")
	public static function pauseAppLoop(app:Dynamic):Void;
	@:native("registerAppLoopWindow")
	public static function registerAppLoopWindow(app:Dynamic, win:Dynamic):Void;
	@:native("resumeAppLoop")
	public static function resumeAppLoop(app:Dynamic):Void;
	@:native("setAppLoopMainWindow")
	public static function setAppLoopMainWindow(app:Dynamic, win:Dynamic):Void;
	@:native("startAppLoop")
	public static function startAppLoop(hostAppLoop:flight._js.HostAppLoopCapability, hostLifecycle:flight._js.HostLifecycleCapability, app:Dynamic, options:Null<flight._js.AppLoopOptions>):Void;
	@:native("stepAppLoop")
	public static function stepAppLoop(app:Dynamic, deltaTime:Float, options:Null<flight._js.AppStepOptions>):Void;
	@:native("stopAppLoop")
	public static function stopAppLoop(app:Dynamic):Void;
	@:native("unregisterAppLoopWindow")
	public static function unregisterAppLoopWindow(app:Dynamic, win:Dynamic):Void;
	@:native("createAppWindow")
	public static function createAppWindow():Dynamic;
	@:native("attachWindow")
	public static function attachWindow(hostWindowAttach:flight._js.HostWindowAttachCapability, hostWindowLifecycle:flight._js.HostWindowLifecycleCapability, win:Dynamic, handle:flight._js.NativeWindowHandle, ownership:Dynamic):Bool;
	@:native("attachWindowClose")
	public static function attachWindowClose(hostWindowLifecycle:flight._js.HostWindowLifecycleCapability, win:Dynamic):Void;
	@:native("attachWindowDropFile")
	public static function attachWindowDropFile(hostInputDropFile:flight._js.HostInputDropFileCapability, win:Dynamic, target:flight._js.InputTargetHandle):Void;
	@:native("attachWindowFocus")
	public static function attachWindowFocus(hostInputFocus:flight._js.HostInputFocusCapability, win:Dynamic, target:flight._js.InputTargetHandle):Void;
	@:native("attachWindowFullscreen")
	public static function attachWindowFullscreen(hostFullscreen:flight._js.HostElementFullscreenCapability, win:Dynamic):Void;
	@:native("attachWindowMove")
	public static function attachWindowMove(hostWindowGeometry:flight._js.HostWindowGeometryCapability, win:Dynamic):Void;
	@:native("attachWindowOrientation")
	public static function attachWindowOrientation(hostScreenChange:flight._js.HostScreenChangeCapability, win:Dynamic):Void;
	@:native("attachWindowResize")
	public static function attachWindowResize(hostWindowGeometry:flight._js.HostWindowGeometryCapability, win:Dynamic, target:Dynamic):Void;
	@:native("attachWindowVisibility")
	public static function attachWindowVisibility(hostWindowVisibility:flight._js.HostWindowVisibilityCapability, win:Dynamic):Void;
	@:native("centerWindow")
	public static function centerWindow(hostWindowGeometry:flight._js.HostWindowGeometryCapability, win:Dynamic):Void;
	@:native("closeWindow")
	public static function closeWindow(hostWindowLifecycle:flight._js.HostWindowLifecycleCapability, win:Dynamic):Bool;
	@:native("computeWindowDeviceTransform")
	public static function computeWindowDeviceTransform(out:flight._js.Matrix, win:Dynamic):Void;
	@:native("detachWindowClose")
	public static function detachWindowClose(win:Dynamic):Void;
	@:native("detachWindowDropFile")
	public static function detachWindowDropFile(win:Dynamic):Void;
	@:native("detachWindowFocus")
	public static function detachWindowFocus(win:Dynamic):Void;
	@:native("detachWindowFullscreen")
	public static function detachWindowFullscreen(win:Dynamic):Void;
	@:native("detachWindowMove")
	public static function detachWindowMove(win:Dynamic):Void;
	@:native("detachWindowOrientation")
	public static function detachWindowOrientation(win:Dynamic):Void;
	@:native("detachWindowResize")
	public static function detachWindowResize(win:Dynamic):Void;
	@:native("detachWindowVisibility")
	public static function detachWindowVisibility(win:Dynamic):Void;
	@:native("disposeAppWindow")
	public static function disposeAppWindow(win:Dynamic):Void;
	@:native("exitAppInputPointerLock")
	public static function exitAppInputPointerLock(state:Dynamic, hostInputPointerLock:flight._js.HostInputPointerLockCapability):flight._js.InputPointerLockExitFuture;
	@:native("flashWindowFrame")
	public static function flashWindowFrame(hostWindowAttention:flight._js.HostWindowAttentionCapability, win:Dynamic):Void;
	@:native("focusWindow")
	public static function focusWindow(hostWindowFocus:flight._js.HostWindowFocusCapability, win:Dynamic):Void;
	@:native("getWindowBounds")
	public static function getWindowBounds(out:flight._js.WindowBounds, hostWindowGeometry:flight._js.HostWindowGeometryCapability, win:Dynamic):Void;
	@:native("hideWindow")
	public static function hideWindow(hostWindowVisibility:flight._js.HostWindowVisibilityCapability, win:Dynamic):Void;
	@:native("lockAppInputPointer")
	public static function lockAppInputPointer(state:Dynamic, hostInputPointerLock:flight._js.HostInputPointerLockCapability, target:flight._js.InputTargetHandle):flight._js.InputPointerLockRequestFuture;
	@:native("maximizeWindow")
	public static function maximizeWindow(hostWindowState:flight._js.HostWindowStateCapability, win:Dynamic):Void;
	@:native("minimizeWindow")
	public static function minimizeWindow(hostWindowState:flight._js.HostWindowStateCapability, win:Dynamic):Void;
	@:native("openWindow")
	public static function openWindow(hostWindowLifecycle:flight._js.HostWindowLifecycleCapability, hostWindowGeometry:flight._js.HostWindowGeometryCapability, win:Dynamic, options:Null<flight._js.WindowOptions>):Bool;
	@:native("prepareElementForInput")
	public static function prepareElementForInput(hostInputTarget:flight._js.HostInputTargetCapability, target:flight._js.InputTargetHandle):Void;
	@:native("requestWindowAttention")
	public static function requestWindowAttention(hostWindowAttention:flight._js.HostWindowAttentionCapability, win:Dynamic, attention:Bool):Void;
	@:native("requestWindowClose")
	public static function requestWindowClose(win:Dynamic):Bool;
	@:native("restoreWindow")
	public static function restoreWindow(hostWindowState:flight._js.HostWindowStateCapability, win:Dynamic):Void;
	@:native("setWindowAlwaysOnTop")
	public static function setWindowAlwaysOnTop(hostWindowZOrder:flight._js.HostWindowZOrderCapability, win:Dynamic, alwaysOnTop:Bool):Void;
	@:native("setWindowContentProtection")
	public static function setWindowContentProtection(hostWindowContentProtection:flight._js.HostWindowContentProtectionCapability, win:Dynamic, enabled:Bool):Void;
	@:native("setWindowFullscreen")
	public static function setWindowFullscreen(hostWindowFullscreen:flight._js.HostWindowFullscreenCapability, win:Dynamic, fullscreen:Bool):Void;
	@:native("setWindowHasShadow")
	public static function setWindowHasShadow(hostWindowShadow:flight._js.HostWindowShadowCapability, win:Dynamic, hasShadow:Bool):Void;
	@:native("setWindowIcon")
	public static function setWindowIcon(hostWindowAppearance:flight._js.HostWindowAppearanceCapability, win:Dynamic, icon:String):Void;
	@:native("setWindowMaximumSize")
	public static function setWindowMaximumSize(hostWindowSizeConstraints:flight._js.HostWindowSizeConstraintsCapability, win:Dynamic, width:Float, height:Float):Void;
	@:native("setWindowMenuBarVisible")
	public static function setWindowMenuBarVisible(hostWindowShell:flight._js.HostWindowShellCapability, win:Dynamic, visible:Bool):Void;
	@:native("setWindowMinimumSize")
	public static function setWindowMinimumSize(hostWindowSizeConstraints:flight._js.HostWindowSizeConstraintsCapability, win:Dynamic, width:Float, height:Float):Void;
	@:native("setWindowOpacity")
	public static function setWindowOpacity(hostWindowAppearance:flight._js.HostWindowAppearanceCapability, win:Dynamic, opacity:Float):Void;
	@:native("setWindowParent")
	public static function setWindowParent(hostWindowHierarchy:flight._js.HostWindowHierarchyCapability, win:Dynamic, parent:Null<Dynamic>):Void;
	@:native("setWindowPosition")
	public static function setWindowPosition(hostWindowGeometry:flight._js.HostWindowGeometryCapability, win:Dynamic, x:Float, y:Float):Void;
	@:native("setWindowProgress")
	public static function setWindowProgress(hostWindowProgress:flight._js.HostWindowProgressCapability, win:Dynamic, progress:Float):Void;
	@:native("setWindowResizable")
	public static function setWindowResizable(hostWindowSizeConstraints:flight._js.HostWindowSizeConstraintsCapability, win:Dynamic, resizable:Bool):Void;
	@:native("setWindowSize")
	public static function setWindowSize(hostWindowGeometry:flight._js.HostWindowGeometryCapability, win:Dynamic, width:Float, height:Float):Void;
	@:native("setWindowSkipTaskbar")
	public static function setWindowSkipTaskbar(hostWindowShell:flight._js.HostWindowShellCapability, win:Dynamic, skip:Bool):Void;
	@:native("setWindowTitle")
	public static function setWindowTitle(hostWindowAppearance:flight._js.HostWindowAppearanceCapability, win:Dynamic, title:String):Void;
	@:native("showWindow")
	public static function showWindow(hostWindowVisibility:flight._js.HostWindowVisibilityCapability, win:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAppEvents(ptr:flight._js.AppEvents):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAppLoginItem(ptr:flight._js.AppLoginItem):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAppLoopRef(ptr:flight._js.AppLoop):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAppWindowRef(ptr:flight._js.AppWindow):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeInputPointerLockExitFuture(ptr:flight._js.InputPointerLockExitFuture):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeInputPointerLockRequestFuture(ptr:flight._js.InputPointerLockRequestFuture):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeString(ptr:Dynamic):Void {}
}
