// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function beginVelocityFrame(field:flight.VelocityField):Void {
  flight._cpp._fn.Velocity.beginVelocityFrame(field);
}

extern inline function createVelocityField():flight.VelocityField {
  return flight._cpp._fn.Velocity.createVelocityField();
}

extern inline function addVelocity(out:flight.Velocity2D, a:flight.Velocity2D, b:flight.Velocity2D):flight.Velocity2D {
  return flight._cpp._attempt.Attempt_Velocity_addVelocity.addVelocity(out, a, b);
}

extern inline function clampVelocity(out:flight.Velocity2D, velocity:flight.Velocity2D, maxLength:Float):flight.Velocity2D {
  return flight._cpp._attempt.Attempt_Velocity_clampVelocity.clampVelocity(out, velocity, maxLength);
}

extern inline function contributeTransformVelocity<Traits:Dynamic>(field:flight.VelocityField, root:flight.Transform2DNode<Traits>):Void {
  flight._cpp._attempt.Attempt_Velocity_contributeTransformVelocity.contributeTransformVelocity(field, root);
}

extern inline function contributeVelocity(field:flight.VelocityField, source:Dynamic, x:Float, y:Float):Void {
  flight._cpp._attempt.Attempt_Velocity_contributeVelocity.contributeVelocity(field, source, x, y);
}

extern inline function copyVelocity(out:flight.Velocity2D, source:flight.Velocity2D):flight.Velocity2D {
  return flight._cpp._attempt.Attempt_Velocity_copyVelocity.copyVelocity(out, source);
}

extern inline function dampVelocity(out:flight.Velocity2D, current:flight.Velocity2D, previous:flight.Velocity2D, factor:Float):flight.Velocity2D {
  return flight._cpp._attempt.Attempt_Velocity_dampVelocity.dampVelocity(out, current, previous, factor);
}

extern inline function ensureVelocitySample(field:flight.VelocityField, source:Dynamic):flight.VelocitySample {
  return flight._cpp._attempt.Attempt_Velocity_ensureVelocitySample.ensureVelocitySample(field, source);
}

extern inline function explainVelocity(field:flight.VelocityField, source:Dynamic):flight.VelocityExplanation {
  return flight._cpp._attempt.Attempt_Velocity_explainVelocity.explainVelocity(field, source);
}

extern inline function getVelocity(field:flight.VelocityField, source:Dynamic, out:flight.Velocity2D):flight.Velocity2D {
  return flight._cpp._attempt.Attempt_Velocity_getVelocity.getVelocity(field, source, out);
}

extern inline function getVelocitySampleAt(sample:flight.VelocitySample, currentWorldTransform:flight.Matrix, pointX:Float, pointY:Float, out:flight.Velocity2D):flight.Velocity2D {
  return flight._cpp._attempt.Attempt_Velocity_getVelocitySampleAt.getVelocitySampleAt(sample, currentWorldTransform, pointX, pointY, out);
}

extern inline function hasVelocity(field:flight.VelocityField, source:Dynamic):Bool {
  return flight._cpp._attempt.Attempt_Velocity_hasVelocity.hasVelocity(field, source);
}

extern inline function initializeVelocityField(out:flight.EntityConstruction<flight.VelocityField>):Void {
  flight._cpp._attempt.Attempt_Velocity_initializeVelocityField.initializeVelocityField(out);
}

extern inline function isVelocityZero(velocity:flight.Velocity2D, ?epsilon:Float):Bool {
  return flight._cpp._attempt.Attempt_Velocity_isVelocityZero.isVelocityZero(velocity, epsilon);
}

extern inline function lengthOfVelocity(velocity:flight.Velocity2D):Float {
  return flight._cpp._attempt.Attempt_Velocity_lengthOfVelocity.lengthOfVelocity(velocity);
}

extern inline function lerpVelocity(out:flight.Velocity2D, a:flight.Velocity2D, b:flight.Velocity2D, t:Float):flight.Velocity2D {
  return flight._cpp._attempt.Attempt_Velocity_lerpVelocity.lerpVelocity(out, a, b, t);
}

extern inline function normalizeVelocity(out:flight.Velocity2D, source:flight.Velocity2D):flight.Velocity2D {
  return flight._cpp._attempt.Attempt_Velocity_normalizeVelocity.normalizeVelocity(out, source);
}

extern inline function scaleVelocity(out:flight.Velocity2D, velocity:flight.Velocity2D, scale:Float):flight.Velocity2D {
  return flight._cpp._attempt.Attempt_Velocity_scaleVelocity.scaleVelocity(out, velocity, scale);
}

extern inline function subtractVelocity(out:flight.Velocity2D, a:flight.Velocity2D, b:flight.Velocity2D):flight.Velocity2D {
  return flight._cpp._attempt.Attempt_Velocity_subtractVelocity.subtractVelocity(out, a, b);
}

extern inline function suppressVelocity(field:flight.VelocityField, source:Dynamic):Void {
  flight._cpp._attempt.Attempt_Velocity_suppressVelocity.suppressVelocity(field, source);
}

extern inline function zeroVelocity(out:flight.Velocity2D):flight.Velocity2D {
  return flight._cpp._attempt.Attempt_Velocity_zeroVelocity.zeroVelocity(out);
}
