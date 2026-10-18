// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Spring = flight._cpp.Spring;

var SpringPresetBouncy(get, set):SpringConfig;

private extern inline function get_SpringPresetBouncy():SpringConfig return flight._cpp._attempt.Attempt_Spring_SpringPresetBouncy.SpringPresetBouncy;

private extern inline function set_SpringPresetBouncy(value:SpringConfig):SpringConfig return flight._cpp._attempt.Attempt_Spring_SpringPresetBouncy.SpringPresetBouncy = value;

var SpringPresetGentle(get, set):SpringConfig;

private extern inline function get_SpringPresetGentle():SpringConfig return flight._cpp._attempt.Attempt_Spring_SpringPresetGentle.SpringPresetGentle;

private extern inline function set_SpringPresetGentle(value:SpringConfig):SpringConfig return flight._cpp._attempt.Attempt_Spring_SpringPresetGentle.SpringPresetGentle = value;

var SpringPresetStiff(get, set):SpringConfig;

private extern inline function get_SpringPresetStiff():SpringConfig return flight._cpp._attempt.Attempt_Spring_SpringPresetStiff.SpringPresetStiff;

private extern inline function set_SpringPresetStiff(value:SpringConfig):SpringConfig return flight._cpp._attempt.Attempt_Spring_SpringPresetStiff.SpringPresetStiff = value;

extern inline function addSpringImpulse(spring:flight.Spring, velocity:Float):Void {
  flight._cpp._attempt.Attempt_Spring_addSpringImpulse.addSpringImpulse(spring, velocity);
}

extern inline function addSpringImpulse2D(spring2D:flight.Spring2D, velocityX:Float, velocityY:Float):Void {
  flight._cpp._attempt.Attempt_Spring_addSpringImpulse2D.addSpringImpulse2D(spring2D, velocityX, velocityY);
}

extern inline function addSpringImpulse3D(spring3D:flight.Spring3D, velocityX:Float, velocityY:Float, velocityZ:Float):Void {
  flight._cpp._attempt.Attempt_Spring_addSpringImpulse3D.addSpringImpulse3D(spring3D, velocityX, velocityY, velocityZ);
}

extern inline function createSpring(?value:Float, ?velocity:Float):flight.Spring {
  return flight._cpp._attempt.Attempt_Spring_createSpring.createSpring(value, velocity);
}

extern inline function createSpring2D(?valueX:Float, ?valueY:Float, ?velocityX:Float, ?velocityY:Float):flight.Spring2D {
  return flight._cpp._attempt.Attempt_Spring_createSpring2D.createSpring2D(valueX, valueY, velocityX, velocityY);
}

extern inline function createSpring3D(?valueX:Float, ?valueY:Float, ?valueZ:Float, ?velocityX:Float, ?velocityY:Float, ?velocityZ:Float):flight.Spring3D {
  return flight._cpp._attempt.Attempt_Spring_createSpring3D.createSpring3D(valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
}

extern inline function createSpringConfig(frequency:Float, dampingRatio:Float):flight.SpringConfig {
  return flight._cpp._attempt.Attempt_Spring_createSpringConfig.createSpringConfig(frequency, dampingRatio);
}

extern inline function createSpringConfigFromPhysical(stiffness:Float, damping:Float, mass:Float):flight.SpringConfig {
  return flight._cpp._attempt.Attempt_Spring_createSpringConfigFromPhysical.createSpringConfigFromPhysical(stiffness, damping, mass);
}

extern inline function initializeSpring(out:flight.EntityConstruction<flight.Spring>, ?value:Float, ?velocity:Float):Void {
  flight._cpp._attempt.Attempt_Spring_initializeSpring.initializeSpring(out, value, velocity);
}

extern inline function initializeSpring2D(out:flight.EntityConstruction<flight.Spring2D>, ?valueX:Float, ?valueY:Float, ?velocityX:Float, ?velocityY:Float):Void {
  flight._cpp._attempt.Attempt_Spring_initializeSpring2D.initializeSpring2D(out, valueX, valueY, velocityX, velocityY);
}

extern inline function initializeSpring3D(out:flight.EntityConstruction<flight.Spring3D>, ?valueX:Float, ?valueY:Float, ?valueZ:Float, ?velocityX:Float, ?velocityY:Float, ?velocityZ:Float):Void {
  flight._cpp._attempt.Attempt_Spring_initializeSpring3D.initializeSpring3D(out, valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
}

extern inline function isSpring2DSettled(spring2D:flight.Spring2D, targetX:Float, targetY:Float, ?positionEpsilon:Float, ?velocityEpsilon:Float):Bool {
  return flight._cpp._attempt.Attempt_Spring_isSpring2DSettled.isSpring2DSettled(spring2D, targetX, targetY, positionEpsilon, velocityEpsilon);
}

extern inline function isSpring3DSettled(spring3D:flight.Spring3D, targetX:Float, targetY:Float, targetZ:Float, ?positionEpsilon:Float, ?velocityEpsilon:Float):Bool {
  return flight._cpp._attempt.Attempt_Spring_isSpring3DSettled.isSpring3DSettled(spring3D, targetX, targetY, targetZ, positionEpsilon, velocityEpsilon);
}

extern inline function isSpringSettled(spring:flight.Spring, target:Float, ?positionEpsilon:Float, ?velocityEpsilon:Float):Bool {
  return flight._cpp._attempt.Attempt_Spring_isSpringSettled.isSpringSettled(spring, target, positionEpsilon, velocityEpsilon);
}

extern inline function resetSpring(spring:flight.Spring, value:Float, ?velocity:Float):Void {
  flight._cpp._attempt.Attempt_Spring_resetSpring.resetSpring(spring, value, velocity);
}

extern inline function resetSpring2D(spring2D:flight.Spring2D, valueX:Float, valueY:Float, ?velocityX:Float, ?velocityY:Float):Void {
  flight._cpp._attempt.Attempt_Spring_resetSpring2D.resetSpring2D(spring2D, valueX, valueY, velocityX, velocityY);
}

extern inline function resetSpring3D(spring3D:flight.Spring3D, valueX:Float, valueY:Float, valueZ:Float, ?velocityX:Float, ?velocityY:Float, ?velocityZ:Float):Void {
  flight._cpp._attempt.Attempt_Spring_resetSpring3D.resetSpring3D(spring3D, valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
}

extern inline function updateSpring(spring:flight.Spring, target:Float, config:flight.SpringConfig, deltaTime:Float):Void {
  flight._cpp._attempt.Attempt_Spring_updateSpring.updateSpring(spring, target, config, deltaTime);
}

extern inline function updateSpring2D(spring2D:flight.Spring2D, targetX:Float, targetY:Float, config:flight.SpringConfig, deltaTime:Float):Void {
  flight._cpp._attempt.Attempt_Spring_updateSpring2D.updateSpring2D(spring2D, targetX, targetY, config, deltaTime);
}

extern inline function updateSpring3D(spring3D:flight.Spring3D, targetX:Float, targetY:Float, targetZ:Float, config:flight.SpringConfig, deltaTime:Float):Void {
  flight._cpp._attempt.Attempt_Spring_updateSpring3D.updateSpring3D(spring3D, targetX, targetY, targetZ, config, deltaTime);
}

extern inline function updateSpringAngle(spring:flight.Spring, target:Float, fullTurn:Float, config:flight.SpringConfig, deltaTime:Float):Void {
  flight._cpp._attempt.Attempt_Spring_updateSpringAngle.updateSpringAngle(spring, target, fullTurn, config, deltaTime);
}
