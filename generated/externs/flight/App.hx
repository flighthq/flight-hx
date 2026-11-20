package flight;

#if (js && flight_esm)
extern inline function createAppEvents():AppEvents {
	return flight._js._fn.App.createAppEvents();
}
#else
extern inline function createAppEvents():AppEvents {
#if hl
	return flight._hl._fn.App.createAppEvents();
#elseif cpp
	return flight._cpp._fn.App.createAppEvents();
#elseif (js && flight_esm)
	return flight._js._fn.App.createAppEvents();
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addAppRecentDocument(hostAppRecentDocuments:HostAppRecentDocumentsCapability, path:String):Void {
	flight._js._fn.App.addAppRecentDocument(hostAppRecentDocuments, path);
}
#else
extern inline function addAppRecentDocument(hostAppRecentDocuments:HostAppRecentDocumentsCapability, path:String):Void {
#if hl
	flight._hl._fn.App.addAppRecentDocument(hostAppRecentDocuments, cast path);
#elseif cpp
	flight._cpp._fn.App.addAppRecentDocument(hostAppRecentDocuments, cast path);
#elseif (js && flight_esm)
	flight._js._fn.App.addAppRecentDocument(hostAppRecentDocuments, path);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachAppActivate(hostAppActivate:HostAppActivateCapability, app:AppEvents):Void {
	flight._js._fn.App.attachAppActivate(hostAppActivate, app);
}
#else
extern inline function attachAppActivate(hostAppActivate:HostAppActivateCapability, app:AppEvents):Void {
#if hl
	flight._hl._fn.App.attachAppActivate(hostAppActivate, app);
#elseif cpp
	flight._cpp._fn.App.attachAppActivate(hostAppActivate, app);
#elseif (js && flight_esm)
	flight._js._fn.App.attachAppActivate(hostAppActivate, app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachAppAllWindowsClosed(hostAppAllWindowsClosed:HostAppAllWindowsClosedCapability, app:AppEvents):Void {
	flight._js._fn.App.attachAppAllWindowsClosed(hostAppAllWindowsClosed, app);
}
#else
extern inline function attachAppAllWindowsClosed(hostAppAllWindowsClosed:HostAppAllWindowsClosedCapability, app:AppEvents):Void {
#if hl
	flight._hl._fn.App.attachAppAllWindowsClosed(hostAppAllWindowsClosed, app);
#elseif cpp
	flight._cpp._fn.App.attachAppAllWindowsClosed(hostAppAllWindowsClosed, app);
#elseif (js && flight_esm)
	flight._js._fn.App.attachAppAllWindowsClosed(hostAppAllWindowsClosed, app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachAppEvents(hostAppActivate:HostAppActivateCapability, hostAppAllWindowsClosed:HostAppAllWindowsClosedCapability, hostAppOpenFile:HostAppOpenFileCapability, hostAppQuitRequest:HostAppQuitRequestCapability, hostAppReady:HostAppReadyCapability, hostAppSecondInstance:HostAppSecondInstanceCapability, app:AppEvents):Void {
	flight._js._fn.App.attachAppEvents(hostAppActivate, hostAppAllWindowsClosed, hostAppOpenFile, hostAppQuitRequest, hostAppReady, hostAppSecondInstance, app);
}
#else
extern inline function attachAppEvents(hostAppActivate:HostAppActivateCapability, hostAppAllWindowsClosed:HostAppAllWindowsClosedCapability, hostAppOpenFile:HostAppOpenFileCapability, hostAppQuitRequest:HostAppQuitRequestCapability, hostAppReady:HostAppReadyCapability, hostAppSecondInstance:HostAppSecondInstanceCapability, app:AppEvents):Void {
#if hl
	flight._hl._fn.App.attachAppEvents(hostAppActivate, hostAppAllWindowsClosed, hostAppOpenFile, hostAppQuitRequest, hostAppReady, hostAppSecondInstance, app);
#elseif cpp
	flight._cpp._fn.App.attachAppEvents(hostAppActivate, hostAppAllWindowsClosed, hostAppOpenFile, hostAppQuitRequest, hostAppReady, hostAppSecondInstance, app);
#elseif (js && flight_esm)
	flight._js._fn.App.attachAppEvents(hostAppActivate, hostAppAllWindowsClosed, hostAppOpenFile, hostAppQuitRequest, hostAppReady, hostAppSecondInstance, app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachAppOpenFile(hostAppOpenFile:HostAppOpenFileCapability, app:AppEvents):Void {
	flight._js._fn.App.attachAppOpenFile(hostAppOpenFile, app);
}
#else
extern inline function attachAppOpenFile(hostAppOpenFile:HostAppOpenFileCapability, app:AppEvents):Void {
#if hl
	flight._hl._fn.App.attachAppOpenFile(hostAppOpenFile, app);
#elseif cpp
	flight._cpp._fn.App.attachAppOpenFile(hostAppOpenFile, app);
#elseif (js && flight_esm)
	flight._js._fn.App.attachAppOpenFile(hostAppOpenFile, app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachAppQuitRequest(hostAppQuitRequest:HostAppQuitRequestCapability, app:AppEvents):Void {
	flight._js._fn.App.attachAppQuitRequest(hostAppQuitRequest, app);
}
#else
extern inline function attachAppQuitRequest(hostAppQuitRequest:HostAppQuitRequestCapability, app:AppEvents):Void {
#if hl
	flight._hl._fn.App.attachAppQuitRequest(hostAppQuitRequest, app);
#elseif cpp
	flight._cpp._fn.App.attachAppQuitRequest(hostAppQuitRequest, app);
#elseif (js && flight_esm)
	flight._js._fn.App.attachAppQuitRequest(hostAppQuitRequest, app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachAppReady(hostAppReady:HostAppReadyCapability, app:AppEvents):Void {
	flight._js._fn.App.attachAppReady(hostAppReady, app);
}
#else
extern inline function attachAppReady(hostAppReady:HostAppReadyCapability, app:AppEvents):Void {
#if hl
	flight._hl._fn.App.attachAppReady(hostAppReady, app);
#elseif cpp
	flight._cpp._fn.App.attachAppReady(hostAppReady, app);
#elseif (js && flight_esm)
	flight._js._fn.App.attachAppReady(hostAppReady, app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachAppSecondInstance(hostAppSecondInstance:HostAppSecondInstanceCapability, app:AppEvents):Void {
	flight._js._fn.App.attachAppSecondInstance(hostAppSecondInstance, app);
}
#else
extern inline function attachAppSecondInstance(hostAppSecondInstance:HostAppSecondInstanceCapability, app:AppEvents):Void {
#if hl
	flight._hl._fn.App.attachAppSecondInstance(hostAppSecondInstance, app);
#elseif cpp
	flight._cpp._fn.App.attachAppSecondInstance(hostAppSecondInstance, app);
#elseif (js && flight_esm)
	flight._js._fn.App.attachAppSecondInstance(hostAppSecondInstance, app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function bounceAppDock(hostAppDock:HostAppDockCapability):Int {
	return flight._js._fn.App.bounceAppDock(hostAppDock);
}
#else
extern inline function bounceAppDock(hostAppDock:HostAppDockCapability):Int {
#if hl
	return flight._hl._fn.App.bounceAppDock(hostAppDock);
#elseif cpp
	return flight._cpp._fn.App.bounceAppDock(hostAppDock);
#elseif (js && flight_esm)
	return flight._js._fn.App.bounceAppDock(hostAppDock);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cancelAppAttention(hostAppDock:HostAppDockCapability, id:Int):Void {
	flight._js._fn.App.cancelAppAttention(hostAppDock, id);
}
#else
extern inline function cancelAppAttention(hostAppDock:HostAppDockCapability, id:Int):Void {
#if hl
	flight._hl._fn.App.cancelAppAttention(hostAppDock, id);
#elseif cpp
	flight._cpp._fn.App.cancelAppAttention(hostAppDock, id);
#elseif (js && flight_esm)
	flight._js._fn.App.cancelAppAttention(hostAppDock, id);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cancelAppDockBounce(hostAppDock:HostAppDockCapability, id:Int):Void {
	flight._js._fn.App.cancelAppDockBounce(hostAppDock, id);
}
#else
extern inline function cancelAppDockBounce(hostAppDock:HostAppDockCapability, id:Int):Void {
#if hl
	flight._hl._fn.App.cancelAppDockBounce(hostAppDock, id);
#elseif cpp
	flight._cpp._fn.App.cancelAppDockBounce(hostAppDock, id);
#elseif (js && flight_esm)
	flight._js._fn.App.cancelAppDockBounce(hostAppDock, id);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearAppRecentDocuments(hostAppRecentDocuments:HostAppRecentDocumentsCapability):Void {
	flight._js._fn.App.clearAppRecentDocuments(hostAppRecentDocuments);
}
#else
extern inline function clearAppRecentDocuments(hostAppRecentDocuments:HostAppRecentDocumentsCapability):Void {
#if hl
	flight._hl._fn.App.clearAppRecentDocuments(hostAppRecentDocuments);
#elseif cpp
	flight._cpp._fn.App.clearAppRecentDocuments(hostAppRecentDocuments);
#elseif (js && flight_esm)
	flight._js._fn.App.clearAppRecentDocuments(hostAppRecentDocuments);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachAppEvents(app:AppEvents):Void {
	flight._js._fn.App.detachAppEvents(app);
}
#else
extern inline function detachAppEvents(app:AppEvents):Void {
#if hl
	flight._hl._fn.App.detachAppEvents(app);
#elseif cpp
	flight._cpp._fn.App.detachAppEvents(app);
#elseif (js && flight_esm)
	flight._js._fn.App.detachAppEvents(app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeAppEvents(app:AppEvents):Void {
	flight._js._fn.App.disposeAppEvents(app);
}
#else
extern inline function disposeAppEvents(app:AppEvents):Void {
#if hl
	flight._hl._fn.App.disposeAppEvents(app);
#elseif cpp
	flight._cpp._fn.App.disposeAppEvents(app);
#elseif (js && flight_esm)
	flight._js._fn.App.disposeAppEvents(app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function focusApp(hostAppFocus:HostAppFocusCapability):Void {
	flight._js._fn.App.focusApp(hostAppFocus);
}
#else
extern inline function focusApp(hostAppFocus:HostAppFocusCapability):Void {
#if hl
	flight._hl._fn.App.focusApp(hostAppFocus);
#elseif cpp
	flight._cpp._fn.App.focusApp(hostAppFocus);
#elseif (js && flight_esm)
	flight._js._fn.App.focusApp(hostAppFocus);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppDirectoryPath(hostAppPath:HostAppPathCapability, kind:Dynamic):String {
	return flight._js._fn.App.getAppDirectoryPath(hostAppPath, kind);
}
#else
extern inline function getAppDirectoryPath(hostAppPath:HostAppPathCapability, kind:flight.AppPathKind):String {
#if hl
	return cast flight._hl._fn.App.getAppDirectoryPath(hostAppPath, kind);
#elseif cpp
	return cast flight._cpp._fn.App.getAppDirectoryPath(hostAppPath, kind);
#elseif (js && flight_esm)
	return cast flight._js._fn.App.getAppDirectoryPath(hostAppPath, kind);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppExecutablePath(hostAppPath:HostAppPathCapability):String {
	return flight._js._fn.App.getAppExecutablePath(hostAppPath);
}
#else
extern inline function getAppExecutablePath(hostAppPath:HostAppPathCapability):String {
#if hl
	return cast flight._hl._fn.App.getAppExecutablePath(hostAppPath);
#elseif cpp
	return cast flight._cpp._fn.App.getAppExecutablePath(hostAppPath);
#elseif (js && flight_esm)
	return cast flight._js._fn.App.getAppExecutablePath(hostAppPath);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppLocale(hostAppLocale:HostAppLocaleCapability):String {
	return flight._js._fn.App.getAppLocale(hostAppLocale);
}
#else
extern inline function getAppLocale(hostAppLocale:HostAppLocaleCapability):String {
#if hl
	return cast flight._hl._fn.App.getAppLocale(hostAppLocale);
#elseif cpp
	return cast flight._cpp._fn.App.getAppLocale(hostAppLocale);
#elseif (js && flight_esm)
	return cast flight._js._fn.App.getAppLocale(hostAppLocale);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppLoginItem(hostAppLoginItem:HostAppLoginItemCapability):AppLoginItem {
	return flight._js._fn.App.getAppLoginItem(hostAppLoginItem);
}
#else
extern inline function getAppLoginItem(hostAppLoginItem:HostAppLoginItemCapability):AppLoginItem {
#if hl
	return flight._hl._fn.App.getAppLoginItem(hostAppLoginItem);
#elseif cpp
	return flight._cpp._fn.App.getAppLoginItem(hostAppLoginItem);
#elseif (js && flight_esm)
	return flight._js._fn.App.getAppLoginItem(hostAppLoginItem);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppName(hostAppName:HostAppNameCapability):String {
	return flight._js._fn.App.getAppName(hostAppName);
}
#else
extern inline function getAppName(hostAppName:HostAppNameCapability):String {
#if hl
	return cast flight._hl._fn.App.getAppName(hostAppName);
#elseif cpp
	return cast flight._cpp._fn.App.getAppName(hostAppName);
#elseif (js && flight_esm)
	return cast flight._js._fn.App.getAppName(hostAppName);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppPath(hostAppPath:HostAppPathCapability):String {
	return flight._js._fn.App.getAppPath(hostAppPath);
}
#else
extern inline function getAppPath(hostAppPath:HostAppPathCapability):String {
#if hl
	return cast flight._hl._fn.App.getAppPath(hostAppPath);
#elseif cpp
	return cast flight._cpp._fn.App.getAppPath(hostAppPath);
#elseif (js && flight_esm)
	return cast flight._js._fn.App.getAppPath(hostAppPath);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppPreferredSystemLanguages(out:Dynamic, hostAppLocale:HostAppLocaleCapability):Void {
	flight._js._fn.App.getAppPreferredSystemLanguages(out, hostAppLocale);
}
#else
extern inline function getAppPreferredSystemLanguages(out:Dynamic, hostAppLocale:HostAppLocaleCapability):Void {
#if hl
	flight._hl._fn.App.getAppPreferredSystemLanguages(out, hostAppLocale);
#elseif cpp
	flight._cpp._fn.App.getAppPreferredSystemLanguages(out, hostAppLocale);
#elseif (js && flight_esm)
	flight._js._fn.App.getAppPreferredSystemLanguages(out, hostAppLocale);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppSystemLocale(hostAppLocale:HostAppLocaleCapability):String {
	return flight._js._fn.App.getAppSystemLocale(hostAppLocale);
}
#else
extern inline function getAppSystemLocale(hostAppLocale:HostAppLocaleCapability):String {
#if hl
	return cast flight._hl._fn.App.getAppSystemLocale(hostAppLocale);
#elseif cpp
	return cast flight._cpp._fn.App.getAppSystemLocale(hostAppLocale);
#elseif (js && flight_esm)
	return cast flight._js._fn.App.getAppSystemLocale(hostAppLocale);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppVersion(hostAppVersion:HostAppVersionCapability):String {
	return flight._js._fn.App.getAppVersion(hostAppVersion);
}
#else
extern inline function getAppVersion(hostAppVersion:HostAppVersionCapability):String {
#if hl
	return cast flight._hl._fn.App.getAppVersion(hostAppVersion);
#elseif cpp
	return cast flight._cpp._fn.App.getAppVersion(hostAppVersion);
#elseif (js && flight_esm)
	return cast flight._js._fn.App.getAppVersion(hostAppVersion);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasAppSingleInstanceLock(hostAppSingleInstance:HostAppSingleInstanceCapability):Bool {
	return flight._js._fn.App.hasAppSingleInstanceLock(hostAppSingleInstance);
}
#else
extern inline function hasAppSingleInstanceLock(hostAppSingleInstance:HostAppSingleInstanceCapability):Bool {
#if hl
	return flight._hl._fn.App.hasAppSingleInstanceLock(hostAppSingleInstance);
#elseif cpp
	return flight._cpp._fn.App.hasAppSingleInstanceLock(hostAppSingleInstance);
#elseif (js && flight_esm)
	return flight._js._fn.App.hasAppSingleInstanceLock(hostAppSingleInstance);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hideApp(hostAppHide:HostAppHideCapability):Void {
	flight._js._fn.App.hideApp(hostAppHide);
}
#else
extern inline function hideApp(hostAppHide:HostAppHideCapability):Void {
#if hl
	flight._hl._fn.App.hideApp(hostAppHide);
#elseif cpp
	flight._cpp._fn.App.hideApp(hostAppHide);
#elseif (js && flight_esm)
	flight._js._fn.App.hideApp(hostAppHide);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isAppHidden(hostLifecycle:HostLifecycleCapability):Bool {
	return flight._js._fn.App.isAppHidden(hostLifecycle);
}
#else
extern inline function isAppHidden(hostLifecycle:HostLifecycleCapability):Bool {
#if hl
	return flight._hl._fn.App.isAppHidden(hostLifecycle);
#elseif cpp
	return flight._cpp._fn.App.isAppHidden(hostLifecycle);
#elseif (js && flight_esm)
	return flight._js._fn.App.isAppHidden(hostLifecycle);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function quitApp(hostAppQuit:HostAppQuitCapability):Void {
	flight._js._fn.App.quitApp(hostAppQuit);
}
#else
extern inline function quitApp(hostAppQuit:HostAppQuitCapability):Void {
#if hl
	flight._hl._fn.App.quitApp(hostAppQuit);
#elseif cpp
	flight._cpp._fn.App.quitApp(hostAppQuit);
#elseif (js && flight_esm)
	flight._js._fn.App.quitApp(hostAppQuit);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function relaunchApp(hostAppRelaunch:HostAppRelaunchCapability):Void {
	flight._js._fn.App.relaunchApp(hostAppRelaunch);
}
#else
extern inline function relaunchApp(hostAppRelaunch:HostAppRelaunchCapability):Void {
#if hl
	flight._hl._fn.App.relaunchApp(hostAppRelaunch);
#elseif cpp
	flight._cpp._fn.App.relaunchApp(hostAppRelaunch);
#elseif (js && flight_esm)
	flight._js._fn.App.relaunchApp(hostAppRelaunch);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function releaseAppSingleInstanceLock(hostAppSingleInstance:HostAppSingleInstanceCapability):Void {
	flight._js._fn.App.releaseAppSingleInstanceLock(hostAppSingleInstance);
}
#else
extern inline function releaseAppSingleInstanceLock(hostAppSingleInstance:HostAppSingleInstanceCapability):Void {
#if hl
	flight._hl._fn.App.releaseAppSingleInstanceLock(hostAppSingleInstance);
#elseif cpp
	flight._cpp._fn.App.releaseAppSingleInstanceLock(hostAppSingleInstance);
#elseif (js && flight_esm)
	flight._js._fn.App.releaseAppSingleInstanceLock(hostAppSingleInstance);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function requestAppAttention(hostAppDock:HostAppDockCapability, critical:Bool):Int {
	return flight._js._fn.App.requestAppAttention(hostAppDock, critical);
}
#else
extern inline function requestAppAttention(hostAppDock:HostAppDockCapability, critical:Bool):Int {
#if hl
	return flight._hl._fn.App.requestAppAttention(hostAppDock, critical);
#elseif cpp
	return flight._cpp._fn.App.requestAppAttention(hostAppDock, critical);
#elseif (js && flight_esm)
	return flight._js._fn.App.requestAppAttention(hostAppDock, critical);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function requestAppSingleInstanceLock(hostAppSingleInstance:HostAppSingleInstanceCapability):Bool {
	return flight._js._fn.App.requestAppSingleInstanceLock(hostAppSingleInstance);
}
#else
extern inline function requestAppSingleInstanceLock(hostAppSingleInstance:HostAppSingleInstanceCapability):Bool {
#if hl
	return flight._hl._fn.App.requestAppSingleInstanceLock(hostAppSingleInstance);
#elseif cpp
	return flight._cpp._fn.App.requestAppSingleInstanceLock(hostAppSingleInstance);
#elseif (js && flight_esm)
	return flight._js._fn.App.requestAppSingleInstanceLock(hostAppSingleInstance);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAppActivationPolicy(hostAppActivationPolicy:HostAppActivationPolicyCapability, policy:Dynamic):Void {
	flight._js._fn.App.setAppActivationPolicy(hostAppActivationPolicy, policy);
}
#else
extern inline function setAppActivationPolicy(hostAppActivationPolicy:HostAppActivationPolicyCapability, policy:flight.AppActivationPolicy):Void {
#if hl
	flight._hl._fn.App.setAppActivationPolicy(hostAppActivationPolicy, policy);
#elseif cpp
	flight._cpp._fn.App.setAppActivationPolicy(hostAppActivationPolicy, policy);
#elseif (js && flight_esm)
	flight._js._fn.App.setAppActivationPolicy(hostAppActivationPolicy, policy);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAppDockBadge(hostAppDock:HostAppDockCapability, text:String):Void {
	flight._js._fn.App.setAppDockBadge(hostAppDock, text);
}
#else
extern inline function setAppDockBadge(hostAppDock:HostAppDockCapability, text:String):Void {
#if hl
	flight._hl._fn.App.setAppDockBadge(hostAppDock, cast text);
#elseif cpp
	flight._cpp._fn.App.setAppDockBadge(hostAppDock, cast text);
#elseif (js && flight_esm)
	flight._js._fn.App.setAppDockBadge(hostAppDock, text);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAppLoginItem(hostAppLoginItem:HostAppLoginItemCapability, settings:AppLoginItemLike):Void {
	flight._js._fn.App.setAppLoginItem(hostAppLoginItem, settings);
}
#else
extern inline function setAppLoginItem(hostAppLoginItem:HostAppLoginItemCapability, settings:AppLoginItemLike):Void {
#if hl
	flight._hl._fn.App.setAppLoginItem(hostAppLoginItem, settings);
#elseif cpp
	flight._cpp._fn.App.setAppLoginItem(hostAppLoginItem, settings);
#elseif (js && flight_esm)
	flight._js._fn.App.setAppLoginItem(hostAppLoginItem, settings);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAppName(hostAppNameWrite:HostAppNameWriteCapability, name:String):Void {
	flight._js._fn.App.setAppName(hostAppNameWrite, name);
}
#else
extern inline function setAppName(hostAppNameWrite:HostAppNameWriteCapability, name:String):Void {
#if hl
	flight._hl._fn.App.setAppName(hostAppNameWrite, cast name);
#elseif cpp
	flight._cpp._fn.App.setAppName(hostAppNameWrite, cast name);
#elseif (js && flight_esm)
	flight._js._fn.App.setAppName(hostAppNameWrite, name);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAppUserModelId(hostAppUserModelId:HostAppUserModelIdCapability, id:String):Void {
	flight._js._fn.App.setAppUserModelId(hostAppUserModelId, id);
}
#else
extern inline function setAppUserModelId(hostAppUserModelId:HostAppUserModelIdCapability, id:String):Void {
#if hl
	flight._hl._fn.App.setAppUserModelId(hostAppUserModelId, cast id);
#elseif cpp
	flight._cpp._fn.App.setAppUserModelId(hostAppUserModelId, cast id);
#elseif (js && flight_esm)
	flight._js._fn.App.setAppUserModelId(hostAppUserModelId, id);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function showApp(hostAppShow:HostAppShowCapability):Void {
	flight._js._fn.App.showApp(hostAppShow);
}
#else
extern inline function showApp(hostAppShow:HostAppShowCapability):Void {
#if hl
	flight._hl._fn.App.showApp(hostAppShow);
#elseif cpp
	flight._cpp._fn.App.showApp(hostAppShow);
#elseif (js && flight_esm)
	flight._js._fn.App.showApp(hostAppShow);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createAppLoop():Dynamic {
	return flight._js._fn.App.createAppLoop();
}
#else
extern inline function createAppLoop():Dynamic {
#if hl
	return flight._hl._fn.App.createAppLoop();
#elseif cpp
	return flight._cpp._fn.App.createAppLoop();
#elseif (js && flight_esm)
	return flight._js._fn.App.createAppLoop();
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachAppLoopExit(hostAppExit:HostAppExitCapability, app:Dynamic):Void {
	flight._js._fn.App.attachAppLoopExit(hostAppExit, app);
}
#else
extern inline function attachAppLoopExit(hostAppExit:HostAppExitCapability, app:Dynamic):Void {
#if hl
	flight._hl._fn.App.attachAppLoopExit(hostAppExit, app);
#elseif cpp
	flight._cpp._fn.App.attachAppLoopExit(hostAppExit, app);
#elseif (js && flight_esm)
	flight._js._fn.App.attachAppLoopExit(hostAppExit, app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachAppLoopLifecycle(app:Dynamic, win:Dynamic):Void {
	flight._js._fn.App.attachAppLoopLifecycle(app, win);
}
#else
extern inline function attachAppLoopLifecycle(app:Dynamic, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.attachAppLoopLifecycle(app, win);
#elseif cpp
	flight._cpp._fn.App.attachAppLoopLifecycle(app, win);
#elseif (js && flight_esm)
	flight._js._fn.App.attachAppLoopLifecycle(app, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachAppLoopExit(app:Dynamic):Void {
	flight._js._fn.App.detachAppLoopExit(app);
}
#else
extern inline function detachAppLoopExit(app:Dynamic):Void {
#if hl
	flight._hl._fn.App.detachAppLoopExit(app);
#elseif cpp
	flight._cpp._fn.App.detachAppLoopExit(app);
#elseif (js && flight_esm)
	flight._js._fn.App.detachAppLoopExit(app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeAppLoop(app:Dynamic):Void {
	flight._js._fn.App.disposeAppLoop(app);
}
#else
extern inline function disposeAppLoop(app:Dynamic):Void {
#if hl
	flight._hl._fn.App.disposeAppLoop(app);
#elseif cpp
	flight._cpp._fn.App.disposeAppLoop(app);
#elseif (js && flight_esm)
	flight._js._fn.App.disposeAppLoop(app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableAppLoopLifecycleSignals(app:Dynamic):Void {
	flight._js._fn.App.enableAppLoopLifecycleSignals(app);
}
#else
extern inline function enableAppLoopLifecycleSignals(app:Dynamic):Void {
#if hl
	flight._hl._fn.App.enableAppLoopLifecycleSignals(app);
#elseif cpp
	flight._cpp._fn.App.enableAppLoopLifecycleSignals(app);
#elseif (js && flight_esm)
	flight._js._fn.App.enableAppLoopLifecycleSignals(app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function forEachAppLoopWindow(app:Dynamic, visitor:Dynamic):Void {
	flight._js._fn.App.forEachAppLoopWindow(app, visitor);
}
#else
extern inline function forEachAppLoopWindow(app:Dynamic, visitorFn:Dynamic, visitorCtx:Dynamic):Void {
#if hl
	flight._hl._fn.App.forEachAppLoopWindow(app, visitorFn, visitorCtx);
#elseif cpp
	flight._cpp._fn.App.forEachAppLoopWindow(app, visitorFn, visitorCtx);
#elseif (js && flight_esm)
	flight._js._fn.App.forEachAppLoopWindow(app, visitorFn, visitorCtx);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppLoopFrameRate(app:Dynamic):Float {
	return flight._js._fn.App.getAppLoopFrameRate(app);
}
#else
extern inline function getAppLoopFrameRate(app:Dynamic):Float {
#if hl
	return flight._hl._fn.App.getAppLoopFrameRate(app);
#elseif cpp
	return flight._cpp._fn.App.getAppLoopFrameRate(app);
#elseif (js && flight_esm)
	return flight._js._fn.App.getAppLoopFrameRate(app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAppLoopMainWindow(app:Dynamic):Null<Dynamic> {
	return flight._js._fn.App.getAppLoopMainWindow(app);
}
#else
extern inline function getAppLoopMainWindow(app:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.App.getAppLoopMainWindow(app);
#elseif cpp
	return flight._cpp._fn.App.getAppLoopMainWindow(app);
#elseif (js && flight_esm)
	return flight._js._fn.App.getAppLoopMainWindow(app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isAppLoopRunning(app:Dynamic):Bool {
	return flight._js._fn.App.isAppLoopRunning(app);
}
#else
extern inline function isAppLoopRunning(app:Dynamic):Bool {
#if hl
	return flight._hl._fn.App.isAppLoopRunning(app);
#elseif cpp
	return flight._cpp._fn.App.isAppLoopRunning(app);
#elseif (js && flight_esm)
	return flight._js._fn.App.isAppLoopRunning(app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pauseAppLoop(app:Dynamic):Void {
	flight._js._fn.App.pauseAppLoop(app);
}
#else
extern inline function pauseAppLoop(app:Dynamic):Void {
#if hl
	flight._hl._fn.App.pauseAppLoop(app);
#elseif cpp
	flight._cpp._fn.App.pauseAppLoop(app);
#elseif (js && flight_esm)
	flight._js._fn.App.pauseAppLoop(app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerAppLoopWindow(app:Dynamic, win:Dynamic):Void {
	flight._js._fn.App.registerAppLoopWindow(app, win);
}
#else
extern inline function registerAppLoopWindow(app:Dynamic, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.registerAppLoopWindow(app, win);
#elseif cpp
	flight._cpp._fn.App.registerAppLoopWindow(app, win);
#elseif (js && flight_esm)
	flight._js._fn.App.registerAppLoopWindow(app, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resumeAppLoop(app:Dynamic):Void {
	flight._js._fn.App.resumeAppLoop(app);
}
#else
extern inline function resumeAppLoop(app:Dynamic):Void {
#if hl
	flight._hl._fn.App.resumeAppLoop(app);
#elseif cpp
	flight._cpp._fn.App.resumeAppLoop(app);
#elseif (js && flight_esm)
	flight._js._fn.App.resumeAppLoop(app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAppLoopMainWindow(app:Dynamic, win:Dynamic):Void {
	flight._js._fn.App.setAppLoopMainWindow(app, win);
}
#else
extern inline function setAppLoopMainWindow(app:Dynamic, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.setAppLoopMainWindow(app, win);
#elseif cpp
	flight._cpp._fn.App.setAppLoopMainWindow(app, win);
#elseif (js && flight_esm)
	flight._js._fn.App.setAppLoopMainWindow(app, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function startAppLoop(hostAppLoop:HostAppLoopCapability, hostLifecycle:HostLifecycleCapability, app:Dynamic, options:Null<AppLoopOptions>):Void {
	flight._js._fn.App.startAppLoop(hostAppLoop, hostLifecycle, app, options);
}
#else
extern inline function startAppLoop(hostAppLoop:HostAppLoopCapability, hostLifecycle:HostLifecycleCapability, app:Dynamic, options:AppLoopOptions):Void {
#if hl
	flight._hl._fn.App.startAppLoop(hostAppLoop, hostLifecycle, app, options);
#elseif cpp
	flight._cpp._fn.App.startAppLoop(hostAppLoop, hostLifecycle, app, options);
#elseif (js && flight_esm)
	flight._js._fn.App.startAppLoop(hostAppLoop, hostLifecycle, app, options);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stepAppLoop(app:Dynamic, deltaTime:Float, options:Null<AppStepOptions>):Void {
	flight._js._fn.App.stepAppLoop(app, deltaTime, options);
}
#else
extern inline function stepAppLoop(app:Dynamic, deltaTime:Float, options:AppStepOptions):Void {
#if hl
	flight._hl._fn.App.stepAppLoop(app, deltaTime, options);
#elseif cpp
	flight._cpp._fn.App.stepAppLoop(app, deltaTime, options);
#elseif (js && flight_esm)
	flight._js._fn.App.stepAppLoop(app, deltaTime, options);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stopAppLoop(app:Dynamic):Void {
	flight._js._fn.App.stopAppLoop(app);
}
#else
extern inline function stopAppLoop(app:Dynamic):Void {
#if hl
	flight._hl._fn.App.stopAppLoop(app);
#elseif cpp
	flight._cpp._fn.App.stopAppLoop(app);
#elseif (js && flight_esm)
	flight._js._fn.App.stopAppLoop(app);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterAppLoopWindow(app:Dynamic, win:Dynamic):Void {
	flight._js._fn.App.unregisterAppLoopWindow(app, win);
}
#else
extern inline function unregisterAppLoopWindow(app:Dynamic, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.unregisterAppLoopWindow(app, win);
#elseif cpp
	flight._cpp._fn.App.unregisterAppLoopWindow(app, win);
#elseif (js && flight_esm)
	flight._js._fn.App.unregisterAppLoopWindow(app, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createAppWindow():Dynamic {
	return flight._js._fn.App.createAppWindow();
}
#else
extern inline function createAppWindow():Dynamic {
#if hl
	return flight._hl._fn.App.createAppWindow();
#elseif cpp
	return flight._cpp._fn.App.createAppWindow();
#elseif (js && flight_esm)
	return flight._js._fn.App.createAppWindow();
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachWindow(hostWindowAttach:HostWindowAttachCapability, hostWindowLifecycle:HostWindowLifecycleCapability, win:Dynamic, handle:NativeWindowHandle, ownership:Dynamic):Bool {
	return flight._js._fn.App.attachWindow(hostWindowAttach, hostWindowLifecycle, win, handle, ownership);
}
#else
extern inline function attachWindow(hostWindowAttach:HostWindowAttachCapability, hostWindowLifecycle:HostWindowLifecycleCapability, win:Dynamic, handle:NativeWindowHandle, ownership:flight.WindowAttachmentOwnership):Bool {
#if hl
	return flight._hl._fn.App.attachWindow(hostWindowAttach, hostWindowLifecycle, win, handle, ownership);
#elseif cpp
	return flight._cpp._fn.App.attachWindow(hostWindowAttach, hostWindowLifecycle, win, handle, ownership);
#elseif (js && flight_esm)
	return flight._js._fn.App.attachWindow(hostWindowAttach, hostWindowLifecycle, win, handle, ownership);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachWindowClose(hostWindowLifecycle:HostWindowLifecycleCapability, win:Dynamic):Void {
	flight._js._fn.App.attachWindowClose(hostWindowLifecycle, win);
}
#else
extern inline function attachWindowClose(hostWindowLifecycle:HostWindowLifecycleCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.attachWindowClose(hostWindowLifecycle, win);
#elseif cpp
	flight._cpp._fn.App.attachWindowClose(hostWindowLifecycle, win);
#elseif (js && flight_esm)
	flight._js._fn.App.attachWindowClose(hostWindowLifecycle, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachWindowDropFile(hostInputDropFile:HostInputDropFileCapability, win:Dynamic, target:InputTargetHandle):Void {
	flight._js._fn.App.attachWindowDropFile(hostInputDropFile, win, target);
}
#else
extern inline function attachWindowDropFile(hostInputDropFile:HostInputDropFileCapability, win:Dynamic, target:InputTargetHandle):Void {
#if hl
	flight._hl._fn.App.attachWindowDropFile(hostInputDropFile, win, target);
#elseif cpp
	flight._cpp._fn.App.attachWindowDropFile(hostInputDropFile, win, target);
#elseif (js && flight_esm)
	flight._js._fn.App.attachWindowDropFile(hostInputDropFile, win, target);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachWindowFocus(hostInputFocus:HostInputFocusCapability, win:Dynamic, target:InputTargetHandle):Void {
	flight._js._fn.App.attachWindowFocus(hostInputFocus, win, target);
}
#else
extern inline function attachWindowFocus(hostInputFocus:HostInputFocusCapability, win:Dynamic, target:InputTargetHandle):Void {
#if hl
	flight._hl._fn.App.attachWindowFocus(hostInputFocus, win, target);
#elseif cpp
	flight._cpp._fn.App.attachWindowFocus(hostInputFocus, win, target);
#elseif (js && flight_esm)
	flight._js._fn.App.attachWindowFocus(hostInputFocus, win, target);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachWindowFullscreen(hostFullscreen:HostElementFullscreenCapability, win:Dynamic):Void {
	flight._js._fn.App.attachWindowFullscreen(hostFullscreen, win);
}
#else
extern inline function attachWindowFullscreen(hostFullscreen:HostElementFullscreenCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.attachWindowFullscreen(hostFullscreen, win);
#elseif cpp
	flight._cpp._fn.App.attachWindowFullscreen(hostFullscreen, win);
#elseif (js && flight_esm)
	flight._js._fn.App.attachWindowFullscreen(hostFullscreen, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachWindowMove(hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic):Void {
	flight._js._fn.App.attachWindowMove(hostWindowGeometry, win);
}
#else
extern inline function attachWindowMove(hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.attachWindowMove(hostWindowGeometry, win);
#elseif cpp
	flight._cpp._fn.App.attachWindowMove(hostWindowGeometry, win);
#elseif (js && flight_esm)
	flight._js._fn.App.attachWindowMove(hostWindowGeometry, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachWindowOrientation(hostScreenChange:HostScreenChangeCapability, win:Dynamic):Void {
	flight._js._fn.App.attachWindowOrientation(hostScreenChange, win);
}
#else
extern inline function attachWindowOrientation(hostScreenChange:HostScreenChangeCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.attachWindowOrientation(hostScreenChange, win);
#elseif cpp
	flight._cpp._fn.App.attachWindowOrientation(hostScreenChange, win);
#elseif (js && flight_esm)
	flight._js._fn.App.attachWindowOrientation(hostScreenChange, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachWindowResize(hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic, target:Dynamic):Void {
	flight._js._fn.App.attachWindowResize(hostWindowGeometry, win, target);
}
#else
extern inline function attachWindowResize(hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic, target:Dynamic):Void {
#if hl
	flight._hl._fn.App.attachWindowResize(hostWindowGeometry, win, target);
#elseif cpp
	flight._cpp._fn.App.attachWindowResize(hostWindowGeometry, win, target);
#elseif (js && flight_esm)
	flight._js._fn.App.attachWindowResize(hostWindowGeometry, win, target);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachWindowVisibility(hostWindowVisibility:HostWindowVisibilityCapability, win:Dynamic):Void {
	flight._js._fn.App.attachWindowVisibility(hostWindowVisibility, win);
}
#else
extern inline function attachWindowVisibility(hostWindowVisibility:HostWindowVisibilityCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.attachWindowVisibility(hostWindowVisibility, win);
#elseif cpp
	flight._cpp._fn.App.attachWindowVisibility(hostWindowVisibility, win);
#elseif (js && flight_esm)
	flight._js._fn.App.attachWindowVisibility(hostWindowVisibility, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function centerWindow(hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic):Void {
	flight._js._fn.App.centerWindow(hostWindowGeometry, win);
}
#else
extern inline function centerWindow(hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.centerWindow(hostWindowGeometry, win);
#elseif cpp
	flight._cpp._fn.App.centerWindow(hostWindowGeometry, win);
#elseif (js && flight_esm)
	flight._js._fn.App.centerWindow(hostWindowGeometry, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function closeWindow(hostWindowLifecycle:HostWindowLifecycleCapability, win:Dynamic):Bool {
	return flight._js._fn.App.closeWindow(hostWindowLifecycle, win);
}
#else
extern inline function closeWindow(hostWindowLifecycle:HostWindowLifecycleCapability, win:Dynamic):Bool {
#if hl
	return flight._hl._fn.App.closeWindow(hostWindowLifecycle, win);
#elseif cpp
	return flight._cpp._fn.App.closeWindow(hostWindowLifecycle, win);
#elseif (js && flight_esm)
	return flight._js._fn.App.closeWindow(hostWindowLifecycle, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeWindowDeviceTransform(out:Matrix, win:Dynamic):Void {
	flight._js._fn.App.computeWindowDeviceTransform(out, win);
}
#else
extern inline function computeWindowDeviceTransform(out:Matrix, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.computeWindowDeviceTransform(out, win);
#elseif cpp
	flight._cpp._fn.App.computeWindowDeviceTransform(out, win);
#elseif (js && flight_esm)
	flight._js._fn.App.computeWindowDeviceTransform(out, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachWindowClose(win:Dynamic):Void {
	flight._js._fn.App.detachWindowClose(win);
}
#else
extern inline function detachWindowClose(win:Dynamic):Void {
#if hl
	flight._hl._fn.App.detachWindowClose(win);
#elseif cpp
	flight._cpp._fn.App.detachWindowClose(win);
#elseif (js && flight_esm)
	flight._js._fn.App.detachWindowClose(win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachWindowDropFile(win:Dynamic):Void {
	flight._js._fn.App.detachWindowDropFile(win);
}
#else
extern inline function detachWindowDropFile(win:Dynamic):Void {
#if hl
	flight._hl._fn.App.detachWindowDropFile(win);
#elseif cpp
	flight._cpp._fn.App.detachWindowDropFile(win);
#elseif (js && flight_esm)
	flight._js._fn.App.detachWindowDropFile(win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachWindowFocus(win:Dynamic):Void {
	flight._js._fn.App.detachWindowFocus(win);
}
#else
extern inline function detachWindowFocus(win:Dynamic):Void {
#if hl
	flight._hl._fn.App.detachWindowFocus(win);
#elseif cpp
	flight._cpp._fn.App.detachWindowFocus(win);
#elseif (js && flight_esm)
	flight._js._fn.App.detachWindowFocus(win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachWindowFullscreen(win:Dynamic):Void {
	flight._js._fn.App.detachWindowFullscreen(win);
}
#else
extern inline function detachWindowFullscreen(win:Dynamic):Void {
#if hl
	flight._hl._fn.App.detachWindowFullscreen(win);
#elseif cpp
	flight._cpp._fn.App.detachWindowFullscreen(win);
#elseif (js && flight_esm)
	flight._js._fn.App.detachWindowFullscreen(win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachWindowMove(win:Dynamic):Void {
	flight._js._fn.App.detachWindowMove(win);
}
#else
extern inline function detachWindowMove(win:Dynamic):Void {
#if hl
	flight._hl._fn.App.detachWindowMove(win);
#elseif cpp
	flight._cpp._fn.App.detachWindowMove(win);
#elseif (js && flight_esm)
	flight._js._fn.App.detachWindowMove(win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachWindowOrientation(win:Dynamic):Void {
	flight._js._fn.App.detachWindowOrientation(win);
}
#else
extern inline function detachWindowOrientation(win:Dynamic):Void {
#if hl
	flight._hl._fn.App.detachWindowOrientation(win);
#elseif cpp
	flight._cpp._fn.App.detachWindowOrientation(win);
#elseif (js && flight_esm)
	flight._js._fn.App.detachWindowOrientation(win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachWindowResize(win:Dynamic):Void {
	flight._js._fn.App.detachWindowResize(win);
}
#else
extern inline function detachWindowResize(win:Dynamic):Void {
#if hl
	flight._hl._fn.App.detachWindowResize(win);
#elseif cpp
	flight._cpp._fn.App.detachWindowResize(win);
#elseif (js && flight_esm)
	flight._js._fn.App.detachWindowResize(win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachWindowVisibility(win:Dynamic):Void {
	flight._js._fn.App.detachWindowVisibility(win);
}
#else
extern inline function detachWindowVisibility(win:Dynamic):Void {
#if hl
	flight._hl._fn.App.detachWindowVisibility(win);
#elseif cpp
	flight._cpp._fn.App.detachWindowVisibility(win);
#elseif (js && flight_esm)
	flight._js._fn.App.detachWindowVisibility(win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeAppWindow(win:Dynamic):Void {
	flight._js._fn.App.disposeAppWindow(win);
}
#else
extern inline function disposeAppWindow(win:Dynamic):Void {
#if hl
	flight._hl._fn.App.disposeAppWindow(win);
#elseif cpp
	flight._cpp._fn.App.disposeAppWindow(win);
#elseif (js && flight_esm)
	flight._js._fn.App.disposeAppWindow(win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function exitAppInputPointerLock(state:Dynamic, hostInputPointerLock:HostInputPointerLockCapability):InputPointerLockExitFuture {
	return flight._js._fn.App.exitAppInputPointerLock(state, hostInputPointerLock);
}
#else
extern inline function exitAppInputPointerLock(state:Dynamic, hostInputPointerLock:HostInputPointerLockCapability):InputPointerLockExitFuture {
#if hl
	return flight._hl._fn.App.exitAppInputPointerLock(state, hostInputPointerLock);
#elseif cpp
	return flight._cpp._fn.App.exitAppInputPointerLock(state, hostInputPointerLock);
#elseif (js && flight_esm)
	return flight._js._fn.App.exitAppInputPointerLock(state, hostInputPointerLock);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function flashWindowFrame(hostWindowAttention:HostWindowAttentionCapability, win:Dynamic):Void {
	flight._js._fn.App.flashWindowFrame(hostWindowAttention, win);
}
#else
extern inline function flashWindowFrame(hostWindowAttention:HostWindowAttentionCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.flashWindowFrame(hostWindowAttention, win);
#elseif cpp
	flight._cpp._fn.App.flashWindowFrame(hostWindowAttention, win);
#elseif (js && flight_esm)
	flight._js._fn.App.flashWindowFrame(hostWindowAttention, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function focusWindow(hostWindowFocus:HostWindowFocusCapability, win:Dynamic):Void {
	flight._js._fn.App.focusWindow(hostWindowFocus, win);
}
#else
extern inline function focusWindow(hostWindowFocus:HostWindowFocusCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.focusWindow(hostWindowFocus, win);
#elseif cpp
	flight._cpp._fn.App.focusWindow(hostWindowFocus, win);
#elseif (js && flight_esm)
	flight._js._fn.App.focusWindow(hostWindowFocus, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getWindowBounds(out:WindowBounds, hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic):Void {
	flight._js._fn.App.getWindowBounds(out, hostWindowGeometry, win);
}
#else
extern inline function getWindowBounds(out:WindowBounds, hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.getWindowBounds(out, hostWindowGeometry, win);
#elseif cpp
	flight._cpp._fn.App.getWindowBounds(out, hostWindowGeometry, win);
#elseif (js && flight_esm)
	flight._js._fn.App.getWindowBounds(out, hostWindowGeometry, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hideWindow(hostWindowVisibility:HostWindowVisibilityCapability, win:Dynamic):Void {
	flight._js._fn.App.hideWindow(hostWindowVisibility, win);
}
#else
extern inline function hideWindow(hostWindowVisibility:HostWindowVisibilityCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.hideWindow(hostWindowVisibility, win);
#elseif cpp
	flight._cpp._fn.App.hideWindow(hostWindowVisibility, win);
#elseif (js && flight_esm)
	flight._js._fn.App.hideWindow(hostWindowVisibility, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function lockAppInputPointer(state:Dynamic, hostInputPointerLock:HostInputPointerLockCapability, target:InputTargetHandle):InputPointerLockRequestFuture {
	return flight._js._fn.App.lockAppInputPointer(state, hostInputPointerLock, target);
}
#else
extern inline function lockAppInputPointer(state:Dynamic, hostInputPointerLock:HostInputPointerLockCapability, target:InputTargetHandle):InputPointerLockRequestFuture {
#if hl
	return flight._hl._fn.App.lockAppInputPointer(state, hostInputPointerLock, target);
#elseif cpp
	return flight._cpp._fn.App.lockAppInputPointer(state, hostInputPointerLock, target);
#elseif (js && flight_esm)
	return flight._js._fn.App.lockAppInputPointer(state, hostInputPointerLock, target);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function maximizeWindow(hostWindowState:HostWindowStateCapability, win:Dynamic):Void {
	flight._js._fn.App.maximizeWindow(hostWindowState, win);
}
#else
extern inline function maximizeWindow(hostWindowState:HostWindowStateCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.maximizeWindow(hostWindowState, win);
#elseif cpp
	flight._cpp._fn.App.maximizeWindow(hostWindowState, win);
#elseif (js && flight_esm)
	flight._js._fn.App.maximizeWindow(hostWindowState, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function minimizeWindow(hostWindowState:HostWindowStateCapability, win:Dynamic):Void {
	flight._js._fn.App.minimizeWindow(hostWindowState, win);
}
#else
extern inline function minimizeWindow(hostWindowState:HostWindowStateCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.minimizeWindow(hostWindowState, win);
#elseif cpp
	flight._cpp._fn.App.minimizeWindow(hostWindowState, win);
#elseif (js && flight_esm)
	flight._js._fn.App.minimizeWindow(hostWindowState, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function openWindow(hostWindowLifecycle:HostWindowLifecycleCapability, hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic, options:Null<WindowOptions>):Bool {
	return flight._js._fn.App.openWindow(hostWindowLifecycle, hostWindowGeometry, win, options);
}
#else
extern inline function openWindow(hostWindowLifecycle:HostWindowLifecycleCapability, hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic, options:WindowOptions):Bool {
#if hl
	return flight._hl._fn.App.openWindow(hostWindowLifecycle, hostWindowGeometry, win, options);
#elseif cpp
	return flight._cpp._fn.App.openWindow(hostWindowLifecycle, hostWindowGeometry, win, options);
#elseif (js && flight_esm)
	return flight._js._fn.App.openWindow(hostWindowLifecycle, hostWindowGeometry, win, options);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function prepareElementForInput(hostInputTarget:HostInputTargetCapability, target:InputTargetHandle):Void {
	flight._js._fn.App.prepareElementForInput(hostInputTarget, target);
}
#else
extern inline function prepareElementForInput(hostInputTarget:HostInputTargetCapability, target:InputTargetHandle):Void {
#if hl
	flight._hl._fn.App.prepareElementForInput(hostInputTarget, target);
#elseif cpp
	flight._cpp._fn.App.prepareElementForInput(hostInputTarget, target);
#elseif (js && flight_esm)
	flight._js._fn.App.prepareElementForInput(hostInputTarget, target);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function requestWindowAttention(hostWindowAttention:HostWindowAttentionCapability, win:Dynamic, attention:Bool):Void {
	flight._js._fn.App.requestWindowAttention(hostWindowAttention, win, attention);
}
#else
extern inline function requestWindowAttention(hostWindowAttention:HostWindowAttentionCapability, win:Dynamic, attention:Bool):Void {
#if hl
	flight._hl._fn.App.requestWindowAttention(hostWindowAttention, win, attention);
#elseif cpp
	flight._cpp._fn.App.requestWindowAttention(hostWindowAttention, win, attention);
#elseif (js && flight_esm)
	flight._js._fn.App.requestWindowAttention(hostWindowAttention, win, attention);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function requestWindowClose(win:Dynamic):Bool {
	return flight._js._fn.App.requestWindowClose(win);
}
#else
extern inline function requestWindowClose(win:Dynamic):Bool {
#if hl
	return flight._hl._fn.App.requestWindowClose(win);
#elseif cpp
	return flight._cpp._fn.App.requestWindowClose(win);
#elseif (js && flight_esm)
	return flight._js._fn.App.requestWindowClose(win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function restoreWindow(hostWindowState:HostWindowStateCapability, win:Dynamic):Void {
	flight._js._fn.App.restoreWindow(hostWindowState, win);
}
#else
extern inline function restoreWindow(hostWindowState:HostWindowStateCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.restoreWindow(hostWindowState, win);
#elseif cpp
	flight._cpp._fn.App.restoreWindow(hostWindowState, win);
#elseif (js && flight_esm)
	flight._js._fn.App.restoreWindow(hostWindowState, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowAlwaysOnTop(hostWindowZOrder:HostWindowZOrderCapability, win:Dynamic, alwaysOnTop:Bool):Void {
	flight._js._fn.App.setWindowAlwaysOnTop(hostWindowZOrder, win, alwaysOnTop);
}
#else
extern inline function setWindowAlwaysOnTop(hostWindowZOrder:HostWindowZOrderCapability, win:Dynamic, alwaysOnTop:Bool):Void {
#if hl
	flight._hl._fn.App.setWindowAlwaysOnTop(hostWindowZOrder, win, alwaysOnTop);
#elseif cpp
	flight._cpp._fn.App.setWindowAlwaysOnTop(hostWindowZOrder, win, alwaysOnTop);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowAlwaysOnTop(hostWindowZOrder, win, alwaysOnTop);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowContentProtection(hostWindowContentProtection:HostWindowContentProtectionCapability, win:Dynamic, enabled:Bool):Void {
	flight._js._fn.App.setWindowContentProtection(hostWindowContentProtection, win, enabled);
}
#else
extern inline function setWindowContentProtection(hostWindowContentProtection:HostWindowContentProtectionCapability, win:Dynamic, enabled:Bool):Void {
#if hl
	flight._hl._fn.App.setWindowContentProtection(hostWindowContentProtection, win, enabled);
#elseif cpp
	flight._cpp._fn.App.setWindowContentProtection(hostWindowContentProtection, win, enabled);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowContentProtection(hostWindowContentProtection, win, enabled);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowFullscreen(hostWindowFullscreen:HostWindowFullscreenCapability, win:Dynamic, fullscreen:Bool):Void {
	flight._js._fn.App.setWindowFullscreen(hostWindowFullscreen, win, fullscreen);
}
#else
extern inline function setWindowFullscreen(hostWindowFullscreen:HostWindowFullscreenCapability, win:Dynamic, fullscreen:Bool):Void {
#if hl
	flight._hl._fn.App.setWindowFullscreen(hostWindowFullscreen, win, fullscreen);
#elseif cpp
	flight._cpp._fn.App.setWindowFullscreen(hostWindowFullscreen, win, fullscreen);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowFullscreen(hostWindowFullscreen, win, fullscreen);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowHasShadow(hostWindowShadow:HostWindowShadowCapability, win:Dynamic, hasShadow:Bool):Void {
	flight._js._fn.App.setWindowHasShadow(hostWindowShadow, win, hasShadow);
}
#else
extern inline function setWindowHasShadow(hostWindowShadow:HostWindowShadowCapability, win:Dynamic, hasShadow:Bool):Void {
#if hl
	flight._hl._fn.App.setWindowHasShadow(hostWindowShadow, win, hasShadow);
#elseif cpp
	flight._cpp._fn.App.setWindowHasShadow(hostWindowShadow, win, hasShadow);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowHasShadow(hostWindowShadow, win, hasShadow);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowIcon(hostWindowAppearance:HostWindowAppearanceCapability, win:Dynamic, icon:String):Void {
	flight._js._fn.App.setWindowIcon(hostWindowAppearance, win, icon);
}
#else
extern inline function setWindowIcon(hostWindowAppearance:HostWindowAppearanceCapability, win:Dynamic, icon:String):Void {
#if hl
	flight._hl._fn.App.setWindowIcon(hostWindowAppearance, win, cast icon);
#elseif cpp
	flight._cpp._fn.App.setWindowIcon(hostWindowAppearance, win, cast icon);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowIcon(hostWindowAppearance, win, icon);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowMaximumSize(hostWindowSizeConstraints:HostWindowSizeConstraintsCapability, win:Dynamic, width:Float, height:Float):Void {
	flight._js._fn.App.setWindowMaximumSize(hostWindowSizeConstraints, win, width, height);
}
#else
extern inline function setWindowMaximumSize(hostWindowSizeConstraints:HostWindowSizeConstraintsCapability, win:Dynamic, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.App.setWindowMaximumSize(hostWindowSizeConstraints, win, width, height);
#elseif cpp
	flight._cpp._fn.App.setWindowMaximumSize(hostWindowSizeConstraints, win, width, height);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowMaximumSize(hostWindowSizeConstraints, win, width, height);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowMenuBarVisible(hostWindowShell:HostWindowShellCapability, win:Dynamic, visible:Bool):Void {
	flight._js._fn.App.setWindowMenuBarVisible(hostWindowShell, win, visible);
}
#else
extern inline function setWindowMenuBarVisible(hostWindowShell:HostWindowShellCapability, win:Dynamic, visible:Bool):Void {
#if hl
	flight._hl._fn.App.setWindowMenuBarVisible(hostWindowShell, win, visible);
#elseif cpp
	flight._cpp._fn.App.setWindowMenuBarVisible(hostWindowShell, win, visible);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowMenuBarVisible(hostWindowShell, win, visible);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowMinimumSize(hostWindowSizeConstraints:HostWindowSizeConstraintsCapability, win:Dynamic, width:Float, height:Float):Void {
	flight._js._fn.App.setWindowMinimumSize(hostWindowSizeConstraints, win, width, height);
}
#else
extern inline function setWindowMinimumSize(hostWindowSizeConstraints:HostWindowSizeConstraintsCapability, win:Dynamic, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.App.setWindowMinimumSize(hostWindowSizeConstraints, win, width, height);
#elseif cpp
	flight._cpp._fn.App.setWindowMinimumSize(hostWindowSizeConstraints, win, width, height);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowMinimumSize(hostWindowSizeConstraints, win, width, height);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowOpacity(hostWindowAppearance:HostWindowAppearanceCapability, win:Dynamic, opacity:Float):Void {
	flight._js._fn.App.setWindowOpacity(hostWindowAppearance, win, opacity);
}
#else
extern inline function setWindowOpacity(hostWindowAppearance:HostWindowAppearanceCapability, win:Dynamic, opacity:Float):Void {
#if hl
	flight._hl._fn.App.setWindowOpacity(hostWindowAppearance, win, opacity);
#elseif cpp
	flight._cpp._fn.App.setWindowOpacity(hostWindowAppearance, win, opacity);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowOpacity(hostWindowAppearance, win, opacity);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowParent(hostWindowHierarchy:HostWindowHierarchyCapability, win:Dynamic, parent:Null<Dynamic>):Void {
	flight._js._fn.App.setWindowParent(hostWindowHierarchy, win, parent);
}
#else
extern inline function setWindowParent(hostWindowHierarchy:HostWindowHierarchyCapability, win:Dynamic, parent:Dynamic):Void {
#if hl
	flight._hl._fn.App.setWindowParent(hostWindowHierarchy, win, parent);
#elseif cpp
	flight._cpp._fn.App.setWindowParent(hostWindowHierarchy, win, parent);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowParent(hostWindowHierarchy, win, parent);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowPosition(hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic, x:Float, y:Float):Void {
	flight._js._fn.App.setWindowPosition(hostWindowGeometry, win, x, y);
}
#else
extern inline function setWindowPosition(hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.App.setWindowPosition(hostWindowGeometry, win, x, y);
#elseif cpp
	flight._cpp._fn.App.setWindowPosition(hostWindowGeometry, win, x, y);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowPosition(hostWindowGeometry, win, x, y);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowProgress(hostWindowProgress:HostWindowProgressCapability, win:Dynamic, progress:Float):Void {
	flight._js._fn.App.setWindowProgress(hostWindowProgress, win, progress);
}
#else
extern inline function setWindowProgress(hostWindowProgress:HostWindowProgressCapability, win:Dynamic, progress:Float):Void {
#if hl
	flight._hl._fn.App.setWindowProgress(hostWindowProgress, win, progress);
#elseif cpp
	flight._cpp._fn.App.setWindowProgress(hostWindowProgress, win, progress);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowProgress(hostWindowProgress, win, progress);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowResizable(hostWindowSizeConstraints:HostWindowSizeConstraintsCapability, win:Dynamic, resizable:Bool):Void {
	flight._js._fn.App.setWindowResizable(hostWindowSizeConstraints, win, resizable);
}
#else
extern inline function setWindowResizable(hostWindowSizeConstraints:HostWindowSizeConstraintsCapability, win:Dynamic, resizable:Bool):Void {
#if hl
	flight._hl._fn.App.setWindowResizable(hostWindowSizeConstraints, win, resizable);
#elseif cpp
	flight._cpp._fn.App.setWindowResizable(hostWindowSizeConstraints, win, resizable);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowResizable(hostWindowSizeConstraints, win, resizable);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowSize(hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic, width:Float, height:Float):Void {
	flight._js._fn.App.setWindowSize(hostWindowGeometry, win, width, height);
}
#else
extern inline function setWindowSize(hostWindowGeometry:HostWindowGeometryCapability, win:Dynamic, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.App.setWindowSize(hostWindowGeometry, win, width, height);
#elseif cpp
	flight._cpp._fn.App.setWindowSize(hostWindowGeometry, win, width, height);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowSize(hostWindowGeometry, win, width, height);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowSkipTaskbar(hostWindowShell:HostWindowShellCapability, win:Dynamic, skip:Bool):Void {
	flight._js._fn.App.setWindowSkipTaskbar(hostWindowShell, win, skip);
}
#else
extern inline function setWindowSkipTaskbar(hostWindowShell:HostWindowShellCapability, win:Dynamic, skip:Bool):Void {
#if hl
	flight._hl._fn.App.setWindowSkipTaskbar(hostWindowShell, win, skip);
#elseif cpp
	flight._cpp._fn.App.setWindowSkipTaskbar(hostWindowShell, win, skip);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowSkipTaskbar(hostWindowShell, win, skip);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setWindowTitle(hostWindowAppearance:HostWindowAppearanceCapability, win:Dynamic, title:String):Void {
	flight._js._fn.App.setWindowTitle(hostWindowAppearance, win, title);
}
#else
extern inline function setWindowTitle(hostWindowAppearance:HostWindowAppearanceCapability, win:Dynamic, title:String):Void {
#if hl
	flight._hl._fn.App.setWindowTitle(hostWindowAppearance, win, cast title);
#elseif cpp
	flight._cpp._fn.App.setWindowTitle(hostWindowAppearance, win, cast title);
#elseif (js && flight_esm)
	flight._js._fn.App.setWindowTitle(hostWindowAppearance, win, title);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function showWindow(hostWindowVisibility:HostWindowVisibilityCapability, win:Dynamic):Void {
	flight._js._fn.App.showWindow(hostWindowVisibility, win);
}
#else
extern inline function showWindow(hostWindowVisibility:HostWindowVisibilityCapability, win:Dynamic):Void {
#if hl
	flight._hl._fn.App.showWindow(hostWindowVisibility, win);
#elseif cpp
	flight._cpp._fn.App.showWindow(hostWindowVisibility, win);
#elseif (js && flight_esm)
	flight._js._fn.App.showWindow(hostWindowVisibility, win);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAppEvents(ptr:AppEvents):Void {
	flight._js._fn.App.freeAppEvents(ptr);
}
#else
extern inline function freeAppEvents(ptr:AppEvents):Void {
#if hl
	flight._hl._fn.App.freeAppEvents(ptr);
#elseif cpp
	flight._cpp._fn.App.freeAppEvents(ptr);
#elseif (js && flight_esm)
	flight._js._fn.App.freeAppEvents(ptr);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAppLoginItem(ptr:AppLoginItem):Void {
	flight._js._fn.App.freeAppLoginItem(ptr);
}
#else
extern inline function freeAppLoginItem(ptr:AppLoginItem):Void {
#if hl
	flight._hl._fn.App.freeAppLoginItem(ptr);
#elseif cpp
	flight._cpp._fn.App.freeAppLoginItem(ptr);
#elseif (js && flight_esm)
	flight._js._fn.App.freeAppLoginItem(ptr);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAppLoopRef(ptr:AppLoop):Void {
	flight._js._fn.App.freeAppLoopRef(ptr);
}
#else
extern inline function freeAppLoopRef(ptr:AppLoop):Void {
#if hl
	flight._hl._fn.App.freeAppLoopRef(ptr);
#elseif cpp
	flight._cpp._fn.App.freeAppLoopRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.App.freeAppLoopRef(ptr);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAppWindowRef(ptr:AppWindow):Void {
	flight._js._fn.App.freeAppWindowRef(ptr);
}
#else
extern inline function freeAppWindowRef(ptr:AppWindow):Void {
#if hl
	flight._hl._fn.App.freeAppWindowRef(ptr);
#elseif cpp
	flight._cpp._fn.App.freeAppWindowRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.App.freeAppWindowRef(ptr);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeInputPointerLockExitFuture(ptr:InputPointerLockExitFuture):Void {
	flight._js._fn.App.freeInputPointerLockExitFuture(ptr);
}
#else
extern inline function freeInputPointerLockExitFuture(ptr:InputPointerLockExitFuture):Void {
#if hl
	flight._hl._fn.App.freeInputPointerLockExitFuture(ptr);
#elseif cpp
	flight._cpp._fn.App.freeInputPointerLockExitFuture(ptr);
#elseif (js && flight_esm)
	flight._js._fn.App.freeInputPointerLockExitFuture(ptr);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeInputPointerLockRequestFuture(ptr:InputPointerLockRequestFuture):Void {
	flight._js._fn.App.freeInputPointerLockRequestFuture(ptr);
}
#else
extern inline function freeInputPointerLockRequestFuture(ptr:InputPointerLockRequestFuture):Void {
#if hl
	flight._hl._fn.App.freeInputPointerLockRequestFuture(ptr);
#elseif cpp
	flight._cpp._fn.App.freeInputPointerLockRequestFuture(ptr);
#elseif (js && flight_esm)
	flight._js._fn.App.freeInputPointerLockRequestFuture(ptr);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeString(ptr:Dynamic):Void {
	flight._js._fn.App.freeString(ptr);
}
#else
extern inline function freeString(ptr:Dynamic):Void {
#if hl
	flight._hl._fn.App.freeString(ptr);
#elseif cpp
	flight._cpp._fn.App.freeString(ptr);
#elseif (js && flight_esm)
	flight._js._fn.App.freeString(ptr);
#else
	#error "flight.App: no backend for this target."
#end
}
#end
