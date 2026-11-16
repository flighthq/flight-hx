package flight;

#if hl

typedef MotionPath = flight._hl.MotionPath;

#elseif cpp

typedef MotionPath = flight._cpp.MotionPath;

#elseif (js && flight_esm)

typedef MotionPath = flight._js.MotionPath;

#elseif js

#error "flight.MotionPath on js requires flight_esm."

#else

#error "flight.MotionPath: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createMotionPath(path:Dynamic, speed:Null<Float>, loopMode:Null<Dynamic>, tolerance:Null<Float>):MotionPath {
	return flight._js._fn.MotionPath.createMotionPath(path, speed, loopMode, tolerance);
}
#else
extern inline function createMotionPath(path:Dynamic, speed:Float, loopMode:Int, tolerance:Float):MotionPath {
#if hl
	return flight._hl._fn.MotionPath.createMotionPath(path, speed, loopMode, tolerance);
#elseif cpp
	return flight._cpp._fn.MotionPath.createMotionPath(path, speed, loopMode, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.MotionPath.createMotionPath(path, speed, loopMode, tolerance);
#else
	#error "flight.MotionPath: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMotionPathHeading(mp:MotionPath):Float {
	return flight._js._fn.MotionPath.getMotionPathHeading(mp);
}
#else
extern inline function getMotionPathHeading(mp:MotionPath):Float {
#if hl
	return flight._hl._fn.MotionPath.getMotionPathHeading(mp);
#elseif cpp
	return flight._cpp._fn.MotionPath.getMotionPathHeading(mp);
#elseif (js && flight_esm)
	return flight._js._fn.MotionPath.getMotionPathHeading(mp);
#else
	#error "flight.MotionPath: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMotionPathPosition(mp:MotionPath, pointOut:Vector2, tangentOut:Vector2):Bool {
	return flight._js._fn.MotionPath.getMotionPathPosition(mp, pointOut, tangentOut);
}
#else
extern inline function getMotionPathPosition(mp:MotionPath, pointOut:Vector2, tangentOut:Vector2):Bool {
#if hl
	return flight._hl._fn.MotionPath.getMotionPathPosition(mp, pointOut, tangentOut);
#elseif cpp
	return flight._cpp._fn.MotionPath.getMotionPathPosition(mp, pointOut, tangentOut);
#elseif (js && flight_esm)
	return flight._js._fn.MotionPath.getMotionPathPosition(mp, pointOut, tangentOut);
#else
	#error "flight.MotionPath: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMotionPathProgress(mp:MotionPath):Float {
	return flight._js._fn.MotionPath.getMotionPathProgress(mp);
}
#else
extern inline function getMotionPathProgress(mp:MotionPath):Float {
#if hl
	return flight._hl._fn.MotionPath.getMotionPathProgress(mp);
#elseif cpp
	return flight._cpp._fn.MotionPath.getMotionPathProgress(mp);
#elseif (js && flight_esm)
	return flight._js._fn.MotionPath.getMotionPathProgress(mp);
#else
	#error "flight.MotionPath: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isMotionPathAtEnd(mp:MotionPath):Bool {
	return flight._js._fn.MotionPath.isMotionPathAtEnd(mp);
}
#else
extern inline function isMotionPathAtEnd(mp:MotionPath):Bool {
#if hl
	return flight._hl._fn.MotionPath.isMotionPathAtEnd(mp);
#elseif cpp
	return flight._cpp._fn.MotionPath.isMotionPathAtEnd(mp);
#elseif (js && flight_esm)
	return flight._js._fn.MotionPath.isMotionPathAtEnd(mp);
#else
	#error "flight.MotionPath: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setMotionPathDirection(mp:MotionPath, direction:MotionPathDirection):Void {
	flight._js._fn.MotionPath.setMotionPathDirection(mp, direction);
}
#else
extern inline function setMotionPathDirection(mp:MotionPath, direction:MotionPathDirection):Void {
#if hl
	flight._hl._fn.MotionPath.setMotionPathDirection(mp, direction);
#elseif cpp
	flight._cpp._fn.MotionPath.setMotionPathDirection(mp, direction);
#elseif (js && flight_esm)
	flight._js._fn.MotionPath.setMotionPathDirection(mp, direction);
#else
	#error "flight.MotionPath: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setMotionPathDistance(mp:MotionPath, distance:Float):Void {
	flight._js._fn.MotionPath.setMotionPathDistance(mp, distance);
}
#else
extern inline function setMotionPathDistance(mp:MotionPath, distance:Float):Void {
#if hl
	flight._hl._fn.MotionPath.setMotionPathDistance(mp, distance);
#elseif cpp
	flight._cpp._fn.MotionPath.setMotionPathDistance(mp, distance);
#elseif (js && flight_esm)
	flight._js._fn.MotionPath.setMotionPathDistance(mp, distance);
#else
	#error "flight.MotionPath: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setMotionPathProgress(mp:MotionPath, t:Float):Void {
	flight._js._fn.MotionPath.setMotionPathProgress(mp, t);
}
#else
extern inline function setMotionPathProgress(mp:MotionPath, t:Float):Void {
#if hl
	flight._hl._fn.MotionPath.setMotionPathProgress(mp, t);
#elseif cpp
	flight._cpp._fn.MotionPath.setMotionPathProgress(mp, t);
#elseif (js && flight_esm)
	flight._js._fn.MotionPath.setMotionPathProgress(mp, t);
#else
	#error "flight.MotionPath: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateMotionPath(mp:MotionPath, deltaTime:Float):Void {
	flight._js._fn.MotionPath.updateMotionPath(mp, deltaTime);
}
#else
extern inline function updateMotionPath(mp:MotionPath, deltaTime:Float):Void {
#if hl
	flight._hl._fn.MotionPath.updateMotionPath(mp, deltaTime);
#elseif cpp
	flight._cpp._fn.MotionPath.updateMotionPath(mp, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.MotionPath.updateMotionPath(mp, deltaTime);
#else
	#error "flight.MotionPath: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMotionPath(ptr:MotionPath):Void {
	flight._js._fn.MotionPath.freeMotionPath(ptr);
}
#else
extern inline function freeMotionPath(ptr:MotionPath):Void {
#if hl
	flight._hl._fn.MotionPath.freeMotionPath(ptr);
#elseif cpp
	flight._cpp._fn.MotionPath.freeMotionPath(ptr);
#elseif (js && flight_esm)
	flight._js._fn.MotionPath.freeMotionPath(ptr);
#else
	#error "flight.MotionPath: no backend for this target."
#end
}
#end
