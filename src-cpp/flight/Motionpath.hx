// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function createMotionPath(path:flight.Path, ?speed:Float, ?loopMode:flight.MotionPathLoopMode, ?tolerance:Float):flight.MotionPath {
  return flight._cpp._attempt.Attempt_Motionpath_createMotionPath.createMotionPath(path, speed, loopMode, tolerance);
}

extern inline function getMotionPathHeading(mp:flight.MotionPath):Float {
  return flight._cpp._attempt.Attempt_Motionpath_getMotionPathHeading.getMotionPathHeading(mp);
}

extern inline function getMotionPathPosition(mp:flight.MotionPath, pointOut:flight.Vector2Like, tangentOut:flight.Vector2Like):Bool {
  return flight._cpp._attempt.Attempt_Motionpath_getMotionPathPosition.getMotionPathPosition(mp, pointOut, tangentOut);
}

extern inline function getMotionPathProgress(mp:flight.MotionPath):Float {
  return flight._cpp._attempt.Attempt_Motionpath_getMotionPathProgress.getMotionPathProgress(mp);
}

extern inline function initializeMotionPath(out:flight.EntityConstruction<flight.MotionPath>, path:flight.Path, ?speed:Float, ?loopMode:flight.MotionPathLoopMode, ?tolerance:Float):Void {
  flight._cpp._attempt.Attempt_Motionpath_initializeMotionPath.initializeMotionPath(out, path, speed, loopMode, tolerance);
}

extern inline function isMotionPathAtEnd(mp:flight.MotionPath):Bool {
  return flight._cpp._attempt.Attempt_Motionpath_isMotionPathAtEnd.isMotionPathAtEnd(mp);
}

extern inline function setMotionPathDirection(mp:flight.MotionPath, direction:Dynamic):Void {
  flight._cpp._attempt.Attempt_Motionpath_setMotionPathDirection.setMotionPathDirection(mp, direction);
}

extern inline function setMotionPathDistance(mp:flight.MotionPath, distance:Float):Void {
  flight._cpp._attempt.Attempt_Motionpath_setMotionPathDistance.setMotionPathDistance(mp, distance);
}

extern inline function setMotionPathProgress(mp:flight.MotionPath, t:Float):Void {
  flight._cpp._attempt.Attempt_Motionpath_setMotionPathProgress.setMotionPathProgress(mp, t);
}

extern inline function updateMotionPath(mp:flight.MotionPath, deltaTime:Float):Void {
  flight._cpp._attempt.Attempt_Motionpath_updateMotionPath.updateMotionPath(mp, deltaTime);
}
