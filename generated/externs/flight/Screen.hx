package flight;

#if (js && flight_esm)
extern inline function createScreenInfo():ScreenInfo {
	return flight._js._fn.Screen.createScreenInfo();
}
#else
extern inline function createScreenInfo():ScreenInfo {
#if hl
	return flight._hl._fn.Screen.createScreenInfo();
#elseif cpp
	return flight._cpp._fn.Screen.createScreenInfo();
#elseif (js && flight_esm)
	return flight._js._fn.Screen.createScreenInfo();
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScreenMode():ScreenMode {
	return flight._js._fn.Screen.createScreenMode();
}
#else
extern inline function createScreenMode():ScreenMode {
#if hl
	return flight._hl._fn.Screen.createScreenMode();
#elseif cpp
	return flight._cpp._fn.Screen.createScreenMode();
#elseif (js && flight_esm)
	return flight._js._fn.Screen.createScreenMode();
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScreenPermissionChange():ScreenPermissionChange {
	return flight._js._fn.Screen.createScreenPermissionChange();
}
#else
extern inline function createScreenPermissionChange():ScreenPermissionChange {
#if hl
	return flight._hl._fn.Screen.createScreenPermissionChange();
#elseif cpp
	return flight._cpp._fn.Screen.createScreenPermissionChange();
#elseif (js && flight_esm)
	return flight._js._fn.Screen.createScreenPermissionChange();
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScreenSignals():ScreenSignals {
	return flight._js._fn.Screen.createScreenSignals();
}
#else
extern inline function createScreenSignals():ScreenSignals {
#if hl
	return flight._hl._fn.Screen.createScreenSignals();
#elseif cpp
	return flight._cpp._fn.Screen.createScreenSignals();
#elseif (js && flight_esm)
	return flight._js._fn.Screen.createScreenSignals();
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachScreenPermissionChange(hostScreenPermissionChange:HostScreenPermissionChangeCapability, permissionChange:ScreenPermissionChange):Void {
	flight._js._fn.Screen.attachScreenPermissionChange(hostScreenPermissionChange, permissionChange);
}
#else
extern inline function attachScreenPermissionChange(hostScreenPermissionChange:HostScreenPermissionChangeCapability, permissionChange:ScreenPermissionChange):Void {
#if hl
	flight._hl._fn.Screen.attachScreenPermissionChange(hostScreenPermissionChange, permissionChange);
#elseif cpp
	flight._cpp._fn.Screen.attachScreenPermissionChange(hostScreenPermissionChange, permissionChange);
#elseif (js && flight_esm)
	flight._js._fn.Screen.attachScreenPermissionChange(hostScreenPermissionChange, permissionChange);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachScreenSignals(hostScreenChange:HostScreenChangeCapability, signals:ScreenSignals):Void {
	flight._js._fn.Screen.attachScreenSignals(hostScreenChange, signals);
}
#else
extern inline function attachScreenSignals(hostScreenChange:HostScreenChangeCapability, signals:ScreenSignals):Void {
#if hl
	flight._hl._fn.Screen.attachScreenSignals(hostScreenChange, signals);
#elseif cpp
	flight._cpp._fn.Screen.attachScreenSignals(hostScreenChange, signals);
#elseif (js && flight_esm)
	flight._js._fn.Screen.attachScreenSignals(hostScreenChange, signals);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachScreenPermissionChange(permissionChange:ScreenPermissionChange):Void {
	flight._js._fn.Screen.detachScreenPermissionChange(permissionChange);
}
#else
extern inline function detachScreenPermissionChange(permissionChange:ScreenPermissionChange):Void {
#if hl
	flight._hl._fn.Screen.detachScreenPermissionChange(permissionChange);
#elseif cpp
	flight._cpp._fn.Screen.detachScreenPermissionChange(permissionChange);
#elseif (js && flight_esm)
	flight._js._fn.Screen.detachScreenPermissionChange(permissionChange);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachScreenSignals(signals:ScreenSignals):Void {
	flight._js._fn.Screen.detachScreenSignals(signals);
}
#else
extern inline function detachScreenSignals(signals:ScreenSignals):Void {
#if hl
	flight._hl._fn.Screen.detachScreenSignals(signals);
#elseif cpp
	flight._cpp._fn.Screen.detachScreenSignals(signals);
#elseif (js && flight_esm)
	flight._js._fn.Screen.detachScreenSignals(signals);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dipToScreenPoint(out:Vector2, screen:ScreenInfo, point:Vector2):Void {
	flight._js._fn.Screen.dipToScreenPoint(out, screen, point);
}
#else
extern inline function dipToScreenPoint(out:Vector2, screen:ScreenInfo, point:Vector2):Void {
#if hl
	flight._hl._fn.Screen.dipToScreenPoint(out, screen, point);
#elseif cpp
	flight._cpp._fn.Screen.dipToScreenPoint(out, screen, point);
#elseif (js && flight_esm)
	flight._js._fn.Screen.dipToScreenPoint(out, screen, point);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dipToScreenRect(out:Rectangle, screen:ScreenInfo, rect:Rectangle):Void {
	flight._js._fn.Screen.dipToScreenRect(out, screen, rect);
}
#else
extern inline function dipToScreenRect(out:Rectangle, screen:ScreenInfo, rect:Rectangle):Void {
#if hl
	flight._hl._fn.Screen.dipToScreenRect(out, screen, rect);
#elseif cpp
	flight._cpp._fn.Screen.dipToScreenRect(out, screen, rect);
#elseif (js && flight_esm)
	flight._js._fn.Screen.dipToScreenRect(out, screen, rect);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeScreenPermissionChange(permissionChange:ScreenPermissionChange):Void {
	flight._js._fn.Screen.disposeScreenPermissionChange(permissionChange);
}
#else
extern inline function disposeScreenPermissionChange(permissionChange:ScreenPermissionChange):Void {
#if hl
	flight._hl._fn.Screen.disposeScreenPermissionChange(permissionChange);
#elseif cpp
	flight._cpp._fn.Screen.disposeScreenPermissionChange(permissionChange);
#elseif (js && flight_esm)
	flight._js._fn.Screen.disposeScreenPermissionChange(permissionChange);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeScreenSignals(signals:ScreenSignals):Void {
	flight._js._fn.Screen.disposeScreenSignals(signals);
}
#else
extern inline function disposeScreenSignals(signals:ScreenSignals):Void {
#if hl
	flight._hl._fn.Screen.disposeScreenSignals(signals);
#elseif cpp
	flight._cpp._fn.Screen.disposeScreenSignals(signals);
#elseif (js && flight_esm)
	flight._js._fn.Screen.disposeScreenSignals(signals);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPrimaryScreen(out:ScreenInfo, hostScreenQuery:HostScreenQueryCapability):Void {
	flight._js._fn.Screen.getPrimaryScreen(out, hostScreenQuery);
}
#else
extern inline function getPrimaryScreen(out:ScreenInfo, hostScreenQuery:HostScreenQueryCapability):Void {
#if hl
	flight._hl._fn.Screen.getPrimaryScreen(out, hostScreenQuery);
#elseif cpp
	flight._cpp._fn.Screen.getPrimaryScreen(out, hostScreenQuery);
#elseif (js && flight_esm)
	flight._js._fn.Screen.getPrimaryScreen(out, hostScreenQuery);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScreenBounds(out:Rectangle, screen:ScreenInfo):Void {
	flight._js._fn.Screen.getScreenBounds(out, screen);
}
#else
extern inline function getScreenBounds(out:Rectangle, screen:ScreenInfo):Void {
#if hl
	flight._hl._fn.Screen.getScreenBounds(out, screen);
#elseif cpp
	flight._cpp._fn.Screen.getScreenBounds(out, screen);
#elseif (js && flight_esm)
	flight._js._fn.Screen.getScreenBounds(out, screen);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScreenById(out:ScreenInfo, scratch:ScreenQueryScratch, hostScreenQuery:HostScreenQueryCapability, id:Float):Bool {
	return flight._js._fn.Screen.getScreenById(out, scratch, hostScreenQuery, id);
}
#else
extern inline function getScreenById(out:ScreenInfo, scratch:ScreenQueryScratch, hostScreenQuery:HostScreenQueryCapability, id:Float):Bool {
#if hl
	return flight._hl._fn.Screen.getScreenById(out, scratch, hostScreenQuery, id);
#elseif cpp
	return flight._cpp._fn.Screen.getScreenById(out, scratch, hostScreenQuery, id);
#elseif (js && flight_esm)
	return flight._js._fn.Screen.getScreenById(out, scratch, hostScreenQuery, id);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScreenContainingRect(out:ScreenInfo, scratch:ScreenQueryScratch, hostScreenQuery:HostScreenQueryCapability, rect:Rectangle):Void {
	flight._js._fn.Screen.getScreenContainingRect(out, scratch, hostScreenQuery, rect);
}
#else
extern inline function getScreenContainingRect(out:ScreenInfo, scratch:ScreenQueryScratch, hostScreenQuery:HostScreenQueryCapability, rect:Rectangle):Void {
#if hl
	flight._hl._fn.Screen.getScreenContainingRect(out, scratch, hostScreenQuery, rect);
#elseif cpp
	flight._cpp._fn.Screen.getScreenContainingRect(out, scratch, hostScreenQuery, rect);
#elseif (js && flight_esm)
	flight._js._fn.Screen.getScreenContainingRect(out, scratch, hostScreenQuery, rect);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScreenCurrentMode(out:ScreenMode, screen:ScreenInfo):Void {
	flight._js._fn.Screen.getScreenCurrentMode(out, screen);
}
#else
extern inline function getScreenCurrentMode(out:ScreenMode, screen:ScreenInfo):Void {
#if hl
	flight._hl._fn.Screen.getScreenCurrentMode(out, screen);
#elseif cpp
	flight._cpp._fn.Screen.getScreenCurrentMode(out, screen);
#elseif (js && flight_esm)
	flight._js._fn.Screen.getScreenCurrentMode(out, screen);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScreenCursorPosition(out:Vector2, hostScreenQuery:HostScreenQueryCapability):Void {
	flight._js._fn.Screen.getScreenCursorPosition(out, hostScreenQuery);
}
#else
extern inline function getScreenCursorPosition(out:Vector2, hostScreenQuery:HostScreenQueryCapability):Void {
#if hl
	flight._hl._fn.Screen.getScreenCursorPosition(out, hostScreenQuery);
#elseif cpp
	flight._cpp._fn.Screen.getScreenCursorPosition(out, hostScreenQuery);
#elseif (js && flight_esm)
	flight._js._fn.Screen.getScreenCursorPosition(out, hostScreenQuery);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScreenCursorScreen(out:ScreenInfo, scratch:ScreenQueryScratch, hostScreenQuery:HostScreenQueryCapability):Void {
	flight._js._fn.Screen.getScreenCursorScreen(out, scratch, hostScreenQuery);
}
#else
extern inline function getScreenCursorScreen(out:ScreenInfo, scratch:ScreenQueryScratch, hostScreenQuery:HostScreenQueryCapability):Void {
#if hl
	flight._hl._fn.Screen.getScreenCursorScreen(out, scratch, hostScreenQuery);
#elseif cpp
	flight._cpp._fn.Screen.getScreenCursorScreen(out, scratch, hostScreenQuery);
#elseif (js && flight_esm)
	flight._js._fn.Screen.getScreenCursorScreen(out, scratch, hostScreenQuery);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScreenNearestPoint(out:ScreenInfo, scratch:ScreenQueryScratch, hostScreenQuery:HostScreenQueryCapability, point:Vector2):Void {
	flight._js._fn.Screen.getScreenNearestPoint(out, scratch, hostScreenQuery, point);
}
#else
extern inline function getScreenNearestPoint(out:ScreenInfo, scratch:ScreenQueryScratch, hostScreenQuery:HostScreenQueryCapability, point:Vector2):Void {
#if hl
	flight._hl._fn.Screen.getScreenNearestPoint(out, scratch, hostScreenQuery, point);
#elseif cpp
	flight._cpp._fn.Screen.getScreenNearestPoint(out, scratch, hostScreenQuery, point);
#elseif (js && flight_esm)
	flight._js._fn.Screen.getScreenNearestPoint(out, scratch, hostScreenQuery, point);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScreenNearestRect(out:ScreenInfo, scratch:ScreenQueryScratch, hostScreenQuery:HostScreenQueryCapability, rect:Rectangle):Void {
	flight._js._fn.Screen.getScreenNearestRect(out, scratch, hostScreenQuery, rect);
}
#else
extern inline function getScreenNearestRect(out:ScreenInfo, scratch:ScreenQueryScratch, hostScreenQuery:HostScreenQueryCapability, rect:Rectangle):Void {
#if hl
	flight._hl._fn.Screen.getScreenNearestRect(out, scratch, hostScreenQuery, rect);
#elseif cpp
	flight._cpp._fn.Screen.getScreenNearestRect(out, scratch, hostScreenQuery, rect);
#elseif (js && flight_esm)
	flight._js._fn.Screen.getScreenNearestRect(out, scratch, hostScreenQuery, rect);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScreenWorkArea(out:Rectangle, screen:ScreenInfo):Void {
	flight._js._fn.Screen.getScreenWorkArea(out, screen);
}
#else
extern inline function getScreenWorkArea(out:Rectangle, screen:ScreenInfo):Void {
#if hl
	flight._hl._fn.Screen.getScreenWorkArea(out, screen);
#elseif cpp
	flight._cpp._fn.Screen.getScreenWorkArea(out, screen);
#elseif (js && flight_esm)
	flight._js._fn.Screen.getScreenWorkArea(out, screen);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScreens(out:Dynamic, hostScreenQuery:HostScreenQueryCapability):Void {
	flight._js._fn.Screen.getScreens(out, hostScreenQuery);
}
#else
extern inline function getScreens(out:Dynamic, hostScreenQuery:HostScreenQueryCapability):Void {
#if hl
	flight._hl._fn.Screen.getScreens(out, hostScreenQuery);
#elseif cpp
	flight._cpp._fn.Screen.getScreens(out, hostScreenQuery);
#elseif (js && flight_esm)
	flight._js._fn.Screen.getScreens(out, hostScreenQuery);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function screenToDipPoint(out:Vector2, screen:ScreenInfo, point:Vector2):Void {
	flight._js._fn.Screen.screenToDipPoint(out, screen, point);
}
#else
extern inline function screenToDipPoint(out:Vector2, screen:ScreenInfo, point:Vector2):Void {
#if hl
	flight._hl._fn.Screen.screenToDipPoint(out, screen, point);
#elseif cpp
	flight._cpp._fn.Screen.screenToDipPoint(out, screen, point);
#elseif (js && flight_esm)
	flight._js._fn.Screen.screenToDipPoint(out, screen, point);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function screenToDipRect(out:Rectangle, screen:ScreenInfo, rect:Rectangle):Void {
	flight._js._fn.Screen.screenToDipRect(out, screen, rect);
}
#else
extern inline function screenToDipRect(out:Rectangle, screen:ScreenInfo, rect:Rectangle):Void {
#if hl
	flight._hl._fn.Screen.screenToDipRect(out, screen, rect);
#elseif cpp
	flight._cpp._fn.Screen.screenToDipRect(out, screen, rect);
#elseif (js && flight_esm)
	flight._js._fn.Screen.screenToDipRect(out, screen, rect);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScreenInfo(ptr:ScreenInfo):Void {
	flight._js._fn.Screen.freeScreenInfo(ptr);
}
#else
extern inline function freeScreenInfo(ptr:ScreenInfo):Void {
#if hl
	flight._hl._fn.Screen.freeScreenInfo(ptr);
#elseif cpp
	flight._cpp._fn.Screen.freeScreenInfo(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Screen.freeScreenInfo(ptr);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScreenMode(ptr:ScreenMode):Void {
	flight._js._fn.Screen.freeScreenMode(ptr);
}
#else
extern inline function freeScreenMode(ptr:ScreenMode):Void {
#if hl
	flight._hl._fn.Screen.freeScreenMode(ptr);
#elseif cpp
	flight._cpp._fn.Screen.freeScreenMode(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Screen.freeScreenMode(ptr);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScreenPermissionChange(ptr:ScreenPermissionChange):Void {
	flight._js._fn.Screen.freeScreenPermissionChange(ptr);
}
#else
extern inline function freeScreenPermissionChange(ptr:ScreenPermissionChange):Void {
#if hl
	flight._hl._fn.Screen.freeScreenPermissionChange(ptr);
#elseif cpp
	flight._cpp._fn.Screen.freeScreenPermissionChange(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Screen.freeScreenPermissionChange(ptr);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScreenSignals(ptr:ScreenSignals):Void {
	flight._js._fn.Screen.freeScreenSignals(ptr);
}
#else
extern inline function freeScreenSignals(ptr:ScreenSignals):Void {
#if hl
	flight._hl._fn.Screen.freeScreenSignals(ptr);
#elseif cpp
	flight._cpp._fn.Screen.freeScreenSignals(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Screen.freeScreenSignals(ptr);
#else
	#error "flight.Screen: no backend for this target."
#end
}
#end
