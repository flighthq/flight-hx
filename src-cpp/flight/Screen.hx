// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function createScreenInfo():flight.ScreenInfo {
  return flight._cpp._fn.Screen.createScreenInfo();
}

extern inline function createScreenMode():flight.ScreenMode {
  return flight._cpp._fn.Screen.createScreenMode();
}

extern inline function createScreenPermissionChange():flight.ScreenPermissionChange {
  return flight._cpp._fn.Screen.createScreenPermissionChange();
}

extern inline function createScreenSignals():flight.ScreenSignals {
  return flight._cpp._fn.Screen.createScreenSignals();
}

extern inline function detachScreenPermissionChange(permissionChange:flight.ScreenPermissionChange):Void {
  flight._cpp._fn.Screen.detachScreenPermissionChange(permissionChange);
}

extern inline function detachScreenSignals(signals:flight.ScreenSignals):Void {
  flight._cpp._fn.Screen.detachScreenSignals(signals);
}

extern inline function disposeScreenPermissionChange(permissionChange:flight.ScreenPermissionChange):Void {
  flight._cpp._fn.Screen.disposeScreenPermissionChange(permissionChange);
}

extern inline function disposeScreenSignals(signals:flight.ScreenSignals):Void {
  flight._cpp._fn.Screen.disposeScreenSignals(signals);
}

extern inline function attachScreenPermissionChange(hostScreenPermissionChange:flight.HostScreenPermissionChangeCapability, permissionChange:flight.ScreenPermissionChange):Void {
  flight._cpp._attempt.Attempt_Screen_attachScreenPermissionChange.attachScreenPermissionChange(hostScreenPermissionChange, permissionChange);
}

extern inline function attachScreenSignals(hostScreenChange:flight.HostScreenChangeCapability, signals:flight.ScreenSignals):Void {
  flight._cpp._attempt.Attempt_Screen_attachScreenSignals.attachScreenSignals(hostScreenChange, signals);
}

extern inline function dipToScreenPoint(screen:flight.ScreenInfo, point:flight.Vector2Like, out:{ x:Float, y:Float }):{ x:Float, y:Float } {
  return flight._cpp._attempt.Attempt_Screen_dipToScreenPoint.dipToScreenPoint(screen, point, out);
}

extern inline function dipToScreenRect(screen:flight.ScreenInfo, rect:flight.RectangleLike, out:{ x:Float, y:Float, width:Float, height:Float }):{ x:Float, y:Float, width:Float, height:Float } {
  return flight._cpp._attempt.Attempt_Screen_dipToScreenRect.dipToScreenRect(screen, rect, out);
}

extern inline function getPrimaryScreen(hostScreenQuery:flight.HostScreenQueryCapability, out:flight.ScreenInfo):flight.ScreenInfo {
  return flight._cpp._attempt.Attempt_Screen_getPrimaryScreen.getPrimaryScreen(hostScreenQuery, out);
}

extern inline function getScreenBounds(screen:flight.ScreenInfo, out:{ x:Float, y:Float, width:Float, height:Float }):{ x:Float, y:Float, width:Float, height:Float } {
  return flight._cpp._attempt.Attempt_Screen_getScreenBounds.getScreenBounds(screen, out);
}

extern inline function getScreenById(hostScreenQuery:flight.HostScreenQueryCapability, id:Float, out:flight.ScreenInfo):Null<flight.ScreenInfo> {
  return flight._cpp._attempt.Attempt_Screen_getScreenById.getScreenById(hostScreenQuery, id, out);
}

extern inline function getScreenContainingRect(hostScreenQuery:flight.HostScreenQueryCapability, rect:flight.RectangleLike, out:flight.ScreenInfo):flight.ScreenInfo {
  return flight._cpp._attempt.Attempt_Screen_getScreenContainingRect.getScreenContainingRect(hostScreenQuery, rect, out);
}

extern inline function getScreenCurrentMode(screen:flight.ScreenInfo, out:flight.ScreenMode):flight.ScreenMode {
  return flight._cpp._attempt.Attempt_Screen_getScreenCurrentMode.getScreenCurrentMode(screen, out);
}

extern inline function getScreenCursorPosition(hostScreenQuery:flight.HostScreenQueryCapability, out:{ x:Float, y:Float }):{ x:Float, y:Float } {
  return flight._cpp._attempt.Attempt_Screen_getScreenCursorPosition.getScreenCursorPosition(hostScreenQuery, out);
}

extern inline function getScreenCursorScreen(hostScreenQuery:flight.HostScreenQueryCapability, out:flight.ScreenInfo):flight.ScreenInfo {
  return flight._cpp._attempt.Attempt_Screen_getScreenCursorScreen.getScreenCursorScreen(hostScreenQuery, out);
}

extern inline function getScreenDetailPermission(hostScreenDetails:flight.HostScreenDetailsCapability):flight._internal._Promise<flight.ScreenPermissionState> {
  return flight._cpp._attempt.Attempt_Screen_getScreenDetailPermission.getScreenDetailPermission(hostScreenDetails);
}

extern inline function getScreenNearestPoint(hostScreenQuery:flight.HostScreenQueryCapability, point:flight.Vector2Like, out:flight.ScreenInfo):flight.ScreenInfo {
  return flight._cpp._attempt.Attempt_Screen_getScreenNearestPoint.getScreenNearestPoint(hostScreenQuery, point, out);
}

extern inline function getScreenNearestRect(hostScreenQuery:flight.HostScreenQueryCapability, rect:flight.RectangleLike, out:flight.ScreenInfo):flight.ScreenInfo {
  return flight._cpp._attempt.Attempt_Screen_getScreenNearestRect.getScreenNearestRect(hostScreenQuery, rect, out);
}

extern inline function getScreenWorkArea(screen:flight.ScreenInfo, out:{ x:Float, y:Float, width:Float, height:Float }):{ x:Float, y:Float, width:Float, height:Float } {
  return flight._cpp._attempt.Attempt_Screen_getScreenWorkArea.getScreenWorkArea(screen, out);
}

extern inline function getScreens(hostScreenQuery:flight.HostScreenQueryCapability, out:Array<flight.ScreenInfo>):Array<flight.ScreenInfo> {
  return flight._cpp._attempt.Attempt_Screen_getScreens.getScreens(hostScreenQuery, out);
}

extern inline function initializeScreenInfo(out:flight.EntityConstruction<flight.ScreenInfo>):Void {
  flight._cpp._attempt.Attempt_Screen_initializeScreenInfo.initializeScreenInfo(out);
}

extern inline function initializeScreenMode(out:flight.EntityConstruction<flight.ScreenMode>):Void {
  flight._cpp._attempt.Attempt_Screen_initializeScreenMode.initializeScreenMode(out);
}

extern inline function initializeScreenPermissionChange(out:flight.EntityConstruction<flight.ScreenPermissionChange>):Void {
  flight._cpp._attempt.Attempt_Screen_initializeScreenPermissionChange.initializeScreenPermissionChange(out);
}

extern inline function initializeScreenSignals(out:flight.EntityConstruction<flight.ScreenSignals>):Void {
  flight._cpp._attempt.Attempt_Screen_initializeScreenSignals.initializeScreenSignals(out);
}

extern inline function requestScreenDetails(hostScreenDetails:flight.HostScreenDetailsCapability):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Screen_requestScreenDetails.requestScreenDetails(hostScreenDetails);
}

extern inline function screenToDipPoint(screen:flight.ScreenInfo, point:flight.Vector2Like, out:{ x:Float, y:Float }):{ x:Float, y:Float } {
  return flight._cpp._attempt.Attempt_Screen_screenToDipPoint.screenToDipPoint(screen, point, out);
}

extern inline function screenToDipRect(screen:flight.ScreenInfo, rect:flight.RectangleLike, out:{ x:Float, y:Float, width:Float, height:Float }):{ x:Float, y:Float, width:Float, height:Float } {
  return flight._cpp._attempt.Attempt_Screen_screenToDipRect.screenToDipRect(screen, rect, out);
}
