package flight;

extern inline function createMotionPath(path:Dynamic, speed:Float, loopMode:Int, tolerance:Float):MotionPath {
#if hl
	return flight._hl._fn.Motionpath.createMotionPath(path, speed, loopMode, tolerance);
#elseif cpp
	return flight._cpp._fn.Motionpath.createMotionPath(path, speed, loopMode, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Motionpath.createMotionPath(path, speed, loopMode, tolerance);
#else
	#error "flight.Motionpath: no backend for this target."
#end
}
extern inline function getMotionPathHeading(mp:MotionPath):Float {
#if hl
	return flight._hl._fn.Motionpath.getMotionPathHeading(mp);
#elseif cpp
	return flight._cpp._fn.Motionpath.getMotionPathHeading(mp);
#elseif (js && flight_esm)
	return flight._js._fn.Motionpath.getMotionPathHeading(mp);
#else
	#error "flight.Motionpath: no backend for this target."
#end
}
extern inline function getMotionPathPosition(mp:MotionPath, pointOut:Vector2, tangentOut:Vector2):Bool {
#if hl
	return flight._hl._fn.Motionpath.getMotionPathPosition(mp, pointOut, tangentOut);
#elseif cpp
	return flight._cpp._fn.Motionpath.getMotionPathPosition(mp, pointOut, tangentOut);
#elseif (js && flight_esm)
	return flight._js._fn.Motionpath.getMotionPathPosition(mp, pointOut, tangentOut);
#else
	#error "flight.Motionpath: no backend for this target."
#end
}
extern inline function getMotionPathProgress(mp:MotionPath):Float {
#if hl
	return flight._hl._fn.Motionpath.getMotionPathProgress(mp);
#elseif cpp
	return flight._cpp._fn.Motionpath.getMotionPathProgress(mp);
#elseif (js && flight_esm)
	return flight._js._fn.Motionpath.getMotionPathProgress(mp);
#else
	#error "flight.Motionpath: no backend for this target."
#end
}
extern inline function isMotionPathAtEnd(mp:MotionPath):Bool {
#if hl
	return flight._hl._fn.Motionpath.isMotionPathAtEnd(mp);
#elseif cpp
	return flight._cpp._fn.Motionpath.isMotionPathAtEnd(mp);
#elseif (js && flight_esm)
	return flight._js._fn.Motionpath.isMotionPathAtEnd(mp);
#else
	#error "flight.Motionpath: no backend for this target."
#end
}
extern inline function setMotionPathDirection(mp:MotionPath, direction:MotionPathDirection):Void {
#if hl
	flight._hl._fn.Motionpath.setMotionPathDirection(mp, direction);
#elseif cpp
	flight._cpp._fn.Motionpath.setMotionPathDirection(mp, direction);
#elseif (js && flight_esm)
	flight._js._fn.Motionpath.setMotionPathDirection(mp, direction);
#else
	#error "flight.Motionpath: no backend for this target."
#end
}
extern inline function setMotionPathDistance(mp:MotionPath, distance:Float):Void {
#if hl
	flight._hl._fn.Motionpath.setMotionPathDistance(mp, distance);
#elseif cpp
	flight._cpp._fn.Motionpath.setMotionPathDistance(mp, distance);
#elseif (js && flight_esm)
	flight._js._fn.Motionpath.setMotionPathDistance(mp, distance);
#else
	#error "flight.Motionpath: no backend for this target."
#end
}
extern inline function setMotionPathProgress(mp:MotionPath, t:Float):Void {
#if hl
	flight._hl._fn.Motionpath.setMotionPathProgress(mp, t);
#elseif cpp
	flight._cpp._fn.Motionpath.setMotionPathProgress(mp, t);
#elseif (js && flight_esm)
	flight._js._fn.Motionpath.setMotionPathProgress(mp, t);
#else
	#error "flight.Motionpath: no backend for this target."
#end
}
extern inline function updateMotionPath(mp:MotionPath, deltaTime:Float):Void {
#if hl
	flight._hl._fn.Motionpath.updateMotionPath(mp, deltaTime);
#elseif cpp
	flight._cpp._fn.Motionpath.updateMotionPath(mp, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.Motionpath.updateMotionPath(mp, deltaTime);
#else
	#error "flight.Motionpath: no backend for this target."
#end
}
extern inline function freeMotionPath(ptr:MotionPath):Void {
#if hl
	flight._hl._fn.Motionpath.freeMotionPath(ptr);
#elseif cpp
	flight._cpp._fn.Motionpath.freeMotionPath(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Motionpath.freeMotionPath(ptr);
#else
	#error "flight.Motionpath: no backend for this target."
#end
}
