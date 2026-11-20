package flight;

#if (js && flight_esm)
extern inline function contributeTransformVelocity(field:VelocityField, root:Dynamic):Void {
	flight._js._fn.Velocity.contributeTransformVelocity(field, root);
}
#else
extern inline function contributeTransformVelocity(field:VelocityField, root:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Velocity.contributeTransformVelocity(field, root);
#elseif cpp
	flight._cpp._fn.Velocity.contributeTransformVelocity(field, root);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.contributeTransformVelocity(field, root);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addVelocity(out:Velocity2D, a:Velocity2D, b:Velocity2D):Void {
	flight._js._fn.Velocity.addVelocity(out, a, b);
}
#else
extern inline function addVelocity(out:Velocity2D, a:Velocity2D, b:Velocity2D):Void {
#if hl
	flight._hl._fn.Velocity.addVelocity(out, a, b);
#elseif cpp
	flight._cpp._fn.Velocity.addVelocity(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.addVelocity(out, a, b);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clampVelocity(out:Velocity2D, velocity:Velocity2D, maxLength:Float):Void {
	flight._js._fn.Velocity.clampVelocity(out, velocity, maxLength);
}
#else
extern inline function clampVelocity(out:Velocity2D, velocity:Velocity2D, maxLength:Float):Void {
#if hl
	flight._hl._fn.Velocity.clampVelocity(out, velocity, maxLength);
#elseif cpp
	flight._cpp._fn.Velocity.clampVelocity(out, velocity, maxLength);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.clampVelocity(out, velocity, maxLength);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function copyVelocity(out:Velocity2D, source:Velocity2D):Void {
	flight._js._fn.Velocity.copyVelocity(out, source);
}
#else
extern inline function copyVelocity(out:Velocity2D, source:Velocity2D):Void {
#if hl
	flight._hl._fn.Velocity.copyVelocity(out, source);
#elseif cpp
	flight._cpp._fn.Velocity.copyVelocity(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.copyVelocity(out, source);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dampVelocity(out:Velocity2D, current:Velocity2D, previous:Velocity2D, factor:Float):Void {
	flight._js._fn.Velocity.dampVelocity(out, current, previous, factor);
}
#else
extern inline function dampVelocity(out:Velocity2D, current:Velocity2D, previous:Velocity2D, factor:Float):Void {
#if hl
	flight._hl._fn.Velocity.dampVelocity(out, current, previous, factor);
#elseif cpp
	flight._cpp._fn.Velocity.dampVelocity(out, current, previous, factor);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.dampVelocity(out, current, previous, factor);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isVelocityZero(velocity:Velocity2D, epsilon:Null<Float>):Bool {
	return flight._js._fn.Velocity.isVelocityZero(velocity, epsilon);
}
#else
extern inline function isVelocityZero(velocity:Velocity2D, epsilon:Float):Bool {
#if hl
	return flight._hl._fn.Velocity.isVelocityZero(velocity, epsilon);
#elseif cpp
	return flight._cpp._fn.Velocity.isVelocityZero(velocity, epsilon);
#elseif (js && flight_esm)
	return flight._js._fn.Velocity.isVelocityZero(velocity, epsilon);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function lengthOfVelocity(velocity:Velocity2D):Float {
	return flight._js._fn.Velocity.lengthOfVelocity(velocity);
}
#else
extern inline function lengthOfVelocity(velocity:Velocity2D):Float {
#if hl
	return flight._hl._fn.Velocity.lengthOfVelocity(velocity);
#elseif cpp
	return flight._cpp._fn.Velocity.lengthOfVelocity(velocity);
#elseif (js && flight_esm)
	return flight._js._fn.Velocity.lengthOfVelocity(velocity);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function lerpVelocity(out:Velocity2D, a:Velocity2D, b:Velocity2D, t:Float):Void {
	flight._js._fn.Velocity.lerpVelocity(out, a, b, t);
}
#else
extern inline function lerpVelocity(out:Velocity2D, a:Velocity2D, b:Velocity2D, t:Float):Void {
#if hl
	flight._hl._fn.Velocity.lerpVelocity(out, a, b, t);
#elseif cpp
	flight._cpp._fn.Velocity.lerpVelocity(out, a, b, t);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.lerpVelocity(out, a, b, t);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function normalizeVelocity(out:Velocity2D, source:Velocity2D):Void {
	flight._js._fn.Velocity.normalizeVelocity(out, source);
}
#else
extern inline function normalizeVelocity(out:Velocity2D, source:Velocity2D):Void {
#if hl
	flight._hl._fn.Velocity.normalizeVelocity(out, source);
#elseif cpp
	flight._cpp._fn.Velocity.normalizeVelocity(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.normalizeVelocity(out, source);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function scaleVelocity(out:Velocity2D, velocity:Velocity2D, scale:Float):Void {
	flight._js._fn.Velocity.scaleVelocity(out, velocity, scale);
}
#else
extern inline function scaleVelocity(out:Velocity2D, velocity:Velocity2D, scale:Float):Void {
#if hl
	flight._hl._fn.Velocity.scaleVelocity(out, velocity, scale);
#elseif cpp
	flight._cpp._fn.Velocity.scaleVelocity(out, velocity, scale);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.scaleVelocity(out, velocity, scale);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function subtractVelocity(out:Velocity2D, a:Velocity2D, b:Velocity2D):Void {
	flight._js._fn.Velocity.subtractVelocity(out, a, b);
}
#else
extern inline function subtractVelocity(out:Velocity2D, a:Velocity2D, b:Velocity2D):Void {
#if hl
	flight._hl._fn.Velocity.subtractVelocity(out, a, b);
#elseif cpp
	flight._cpp._fn.Velocity.subtractVelocity(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.subtractVelocity(out, a, b);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function zeroVelocity(out:Velocity2D):Void {
	flight._js._fn.Velocity.zeroVelocity(out);
}
#else
extern inline function zeroVelocity(out:Velocity2D):Void {
#if hl
	flight._hl._fn.Velocity.zeroVelocity(out);
#elseif cpp
	flight._cpp._fn.Velocity.zeroVelocity(out);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.zeroVelocity(out);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getVelocitySampleAt(sample:VelocitySample, currentWorldTransform:Matrix, pointX:Float, pointY:Float, out:Velocity2D):Void {
	flight._js._fn.Velocity.getVelocitySampleAt(sample, currentWorldTransform, pointX, pointY, out);
}
#else
extern inline function getVelocitySampleAt(sample:VelocitySample, currentWorldTransform:Matrix, pointX:Float, pointY:Float, out:Velocity2D):Void {
#if hl
	flight._hl._fn.Velocity.getVelocitySampleAt(sample, currentWorldTransform, pointX, pointY, out);
#elseif cpp
	flight._cpp._fn.Velocity.getVelocitySampleAt(sample, currentWorldTransform, pointX, pointY, out);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.getVelocitySampleAt(sample, currentWorldTransform, pointX, pointY, out);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createVelocityField():VelocityField {
	return flight._js._fn.Velocity.createVelocityField();
}
#else
extern inline function createVelocityField():VelocityField {
#if hl
	return flight._hl._fn.Velocity.createVelocityField();
#elseif cpp
	return flight._cpp._fn.Velocity.createVelocityField();
#elseif (js && flight_esm)
	return flight._js._fn.Velocity.createVelocityField();
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function beginVelocityFrame(field:VelocityField):Void {
	flight._js._fn.Velocity.beginVelocityFrame(field);
}
#else
extern inline function beginVelocityFrame(field:VelocityField):Void {
#if hl
	flight._hl._fn.Velocity.beginVelocityFrame(field);
#elseif cpp
	flight._cpp._fn.Velocity.beginVelocityFrame(field);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.beginVelocityFrame(field);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function contributeVelocity(field:VelocityField, source:Float, x:Float, y:Float):Void {
	flight._js._fn.Velocity.contributeVelocity(field, source, x, y);
}
#else
extern inline function contributeVelocity(field:VelocityField, source:haxe.Int64, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Velocity.contributeVelocity(field, source, x, y);
#elseif cpp
	flight._cpp._fn.Velocity.contributeVelocity(field, source, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.contributeVelocity(field, source, x, y);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainVelocity(field:VelocityField, source:Float):VelocityExplanation {
	return flight._js._fn.Velocity.explainVelocity(field, source);
}
#else
extern inline function explainVelocity(field:VelocityField, source:haxe.Int64):VelocityExplanation {
#if hl
	return flight._hl._fn.Velocity.explainVelocity(field, source);
#elseif cpp
	return flight._cpp._fn.Velocity.explainVelocity(field, source);
#elseif (js && flight_esm)
	return flight._js._fn.Velocity.explainVelocity(field, source);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getVelocity(field:VelocityField, source:Float, out:Velocity2D):Void {
	flight._js._fn.Velocity.getVelocity(field, source, out);
}
#else
extern inline function getVelocity(field:VelocityField, source:haxe.Int64, out:Velocity2D):Void {
#if hl
	flight._hl._fn.Velocity.getVelocity(field, source, out);
#elseif cpp
	flight._cpp._fn.Velocity.getVelocity(field, source, out);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.getVelocity(field, source, out);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasVelocity(field:VelocityField, source:Float):Bool {
	return flight._js._fn.Velocity.hasVelocity(field, source);
}
#else
extern inline function hasVelocity(field:VelocityField, source:haxe.Int64):Bool {
#if hl
	return flight._hl._fn.Velocity.hasVelocity(field, source);
#elseif cpp
	return flight._cpp._fn.Velocity.hasVelocity(field, source);
#elseif (js && flight_esm)
	return flight._js._fn.Velocity.hasVelocity(field, source);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function suppressVelocity(field:VelocityField, source:Float):Void {
	flight._js._fn.Velocity.suppressVelocity(field, source);
}
#else
extern inline function suppressVelocity(field:VelocityField, source:haxe.Int64):Void {
#if hl
	flight._hl._fn.Velocity.suppressVelocity(field, source);
#elseif cpp
	flight._cpp._fn.Velocity.suppressVelocity(field, source);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.suppressVelocity(field, source);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeVelocityField(ptr:VelocityField):Void {
	flight._js._fn.Velocity.freeVelocityField(ptr);
}
#else
extern inline function freeVelocityField(ptr:VelocityField):Void {
#if hl
	flight._hl._fn.Velocity.freeVelocityField(ptr);
#elseif cpp
	flight._cpp._fn.Velocity.freeVelocityField(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.freeVelocityField(ptr);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeVelocityExplanation(ptr:VelocityExplanation):Void {
	flight._js._fn.Velocity.freeVelocityExplanation(ptr);
}
#else
extern inline function freeVelocityExplanation(ptr:VelocityExplanation):Void {
#if hl
	flight._hl._fn.Velocity.freeVelocityExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Velocity.freeVelocityExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Velocity.freeVelocityExplanation(ptr);
#else
	#error "flight.Velocity: no backend for this target."
#end
}
#end
