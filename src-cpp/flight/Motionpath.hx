// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function getMotionPathHeading(mp:flight.MotionPath):Float {
  return flight._cpp._fn.Motionpath.getMotionPathHeading(mp);
}

extern inline function getMotionPathProgress(mp:flight.MotionPath):Float {
  return flight._cpp._fn.Motionpath.getMotionPathProgress(mp);
}

extern inline function isMotionPathAtEnd(mp:flight.MotionPath):Bool {
  return flight._cpp._fn.Motionpath.isMotionPathAtEnd(mp);
}

extern inline function setMotionPathDistance(mp:flight.MotionPath, distance:Float):Void {
  flight._cpp._fn.Motionpath.setMotionPathDistance(mp, distance);
}

extern inline function setMotionPathProgress(mp:flight.MotionPath, t:Float):Void {
  flight._cpp._fn.Motionpath.setMotionPathProgress(mp, t);
}

extern inline function updateMotionPath(mp:flight.MotionPath, deltaTime:Float):Void {
  flight._cpp._fn.Motionpath.updateMotionPath(mp, deltaTime);
}

extern inline function createMotionPath(path:flight.Path, ?speed:Float, ?loopMode:flight.MotionPathLoopMode, ?tolerance:Float):flight.MotionPath {
  return flight._cpp._attempt.Attempt_Motionpath_createMotionPath.createMotionPath(path, speed, loopMode, tolerance);
}

extern inline function getMotionPathPosition(mp:flight.MotionPath, pointOut:flight.Vector2Like, tangentOut:flight.Vector2Like):Bool {
  return flight._cpp._attempt.Attempt_Motionpath_getMotionPathPosition.getMotionPathPosition(mp, pointOut, tangentOut);
}

extern inline function initializeMotionPath(out:flight.EntityConstruction<flight.MotionPath>, path:flight.Path, ?speed:Float, ?loopMode:flight.MotionPathLoopMode, ?tolerance:Float):Void {
  flight._cpp._attempt.Attempt_Motionpath_initializeMotionPath.initializeMotionPath(out, path, speed, loopMode, tolerance);
}

extern inline function setMotionPathDirection(mp:flight.MotionPath, direction:Dynamic):Void {
  flight._cpp._attempt.Attempt_Motionpath_setMotionPathDirection.setMotionPathDirection(mp, direction);
}
