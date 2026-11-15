package flight;

inline function degToRad(degrees:Float):Float {
#if hl
	return flight._hl._fn.Math.degToRad(degrees);
#elseif cpp
	return flight._cpp._fn.Math.degToRad(degrees);
#elseif (js && flight_esm)
	return flight._js._fn.Math.degToRad(degrees);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function deltaAngle(from:Float, to:Float):Float {
#if hl
	return flight._hl._fn.Math.deltaAngle(from, to);
#elseif cpp
	return flight._cpp._fn.Math.deltaAngle(from, to);
#elseif (js && flight_esm)
	return flight._js._fn.Math.deltaAngle(from, to);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function normalizeAngle(radians:Float):Float {
#if hl
	return flight._hl._fn.Math.normalizeAngle(radians);
#elseif cpp
	return flight._cpp._fn.Math.normalizeAngle(radians);
#elseif (js && flight_esm)
	return flight._js._fn.Math.normalizeAngle(radians);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function radToDeg(radians:Float):Float {
#if hl
	return flight._hl._fn.Math.radToDeg(radians);
#elseif cpp
	return flight._cpp._fn.Math.radToDeg(radians);
#elseif (js && flight_esm)
	return flight._js._fn.Math.radToDeg(radians);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function clamp(value:Float, min:Float, max:Float):Float {
#if hl
	return flight._hl._fn.Math.clamp(value, min, max);
#elseif cpp
	return flight._cpp._fn.Math.clamp(value, min, max);
#elseif (js && flight_esm)
	return flight._js._fn.Math.clamp(value, min, max);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function inRange(value:Float, min:Float, max:Float):Bool {
#if hl
	return flight._hl._fn.Math.inRange(value, min, max);
#elseif cpp
	return flight._cpp._fn.Math.inRange(value, min, max);
#elseif (js && flight_esm)
	return flight._js._fn.Math.inRange(value, min, max);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function saturate(value:Float):Float {
#if hl
	return flight._hl._fn.Math.saturate(value);
#elseif cpp
	return flight._cpp._fn.Math.saturate(value);
#elseif (js && flight_esm)
	return flight._js._fn.Math.saturate(value);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function approxEqual(a:Float, b:Float, epsilon:Float):Bool {
#if hl
	return flight._hl._fn.Math.approxEqual(a, b, epsilon);
#elseif cpp
	return flight._cpp._fn.Math.approxEqual(a, b, epsilon);
#elseif (js && flight_esm)
	return flight._js._fn.Math.approxEqual(a, b, epsilon);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function approxEqualRelative(a:Float, b:Float, relativeEpsilon:Float):Bool {
#if hl
	return flight._hl._fn.Math.approxEqualRelative(a, b, relativeEpsilon);
#elseif cpp
	return flight._cpp._fn.Math.approxEqualRelative(a, b, relativeEpsilon);
#elseif (js && flight_esm)
	return flight._js._fn.Math.approxEqualRelative(a, b, relativeEpsilon);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function approxZero(value:Float, epsilon:Float):Bool {
#if hl
	return flight._hl._fn.Math.approxZero(value, epsilon);
#elseif cpp
	return flight._cpp._fn.Math.approxZero(value, epsilon);
#elseif (js && flight_esm)
	return flight._js._fn.Math.approxZero(value, epsilon);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function createRandomSourceFromHash(x:Int, y:Int):RandomSource {
#if hl
	return flight._hl._fn.Math.createRandomSourceFromHash(x, y);
#elseif cpp
	return flight._cpp._fn.Math.createRandomSourceFromHash(x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Math.createRandomSourceFromHash(x, y);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function hash2d(x:Int, y:Int):Int {
#if hl
	return flight._hl._fn.Math.hash2d(x, y);
#elseif cpp
	return flight._cpp._fn.Math.hash2d(x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Math.hash2d(x, y);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function hash3d(x:Int, y:Int, z:Int):Int {
#if hl
	return flight._hl._fn.Math.hash3d(x, y, z);
#elseif cpp
	return flight._cpp._fn.Math.hash3d(x, y, z);
#elseif (js && flight_esm)
	return flight._js._fn.Math.hash3d(x, y, z);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function hashCombine(seed:Int, value:Int):Int {
#if hl
	return flight._hl._fn.Math.hashCombine(seed, value);
#elseif cpp
	return flight._cpp._fn.Math.hashCombine(seed, value);
#elseif (js && flight_esm)
	return flight._js._fn.Math.hashCombine(seed, value);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function hashUint32(value:Int):Int {
#if hl
	return flight._hl._fn.Math.hashUint32(value);
#elseif cpp
	return flight._cpp._fn.Math.hashUint32(value);
#elseif (js && flight_esm)
	return flight._js._fn.Math.hashUint32(value);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function inverseLerp(a:Float, b:Float, value:Float):Float {
#if hl
	return flight._hl._fn.Math.inverseLerp(a, b, value);
#elseif cpp
	return flight._cpp._fn.Math.inverseLerp(a, b, value);
#elseif (js && flight_esm)
	return flight._js._fn.Math.inverseLerp(a, b, value);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function lerp(a:Float, b:Float, t:Float):Float {
#if hl
	return flight._hl._fn.Math.lerp(a, b, t);
#elseif cpp
	return flight._cpp._fn.Math.lerp(a, b, t);
#elseif (js && flight_esm)
	return flight._js._fn.Math.lerp(a, b, t);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function remap(value:Float, inMin:Float, inMax:Float, outMin:Float, outMax:Float):Float {
#if hl
	return flight._hl._fn.Math.remap(value, inMin, inMax, outMin, outMax);
#elseif cpp
	return flight._cpp._fn.Math.remap(value, inMin, inMax, outMin, outMax);
#elseif (js && flight_esm)
	return flight._js._fn.Math.remap(value, inMin, inMax, outMin, outMax);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function smoothStep(edge0:Float, edge1:Float, x:Float):Float {
#if hl
	return flight._hl._fn.Math.smoothStep(edge0, edge1, x);
#elseif cpp
	return flight._cpp._fn.Math.smoothStep(edge0, edge1, x);
#elseif (js && flight_esm)
	return flight._js._fn.Math.smoothStep(edge0, edge1, x);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function step(edge:Float, x:Float):Float {
#if hl
	return flight._hl._fn.Math.step(edge, x);
#elseif cpp
	return flight._cpp._fn.Math.step(edge, x);
#elseif (js && flight_esm)
	return flight._js._fn.Math.step(edge, x);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function damp(current:Float, target:Float, lambda:Float, deltaTime:Float):Float {
#if hl
	return flight._hl._fn.Math.damp(current, target, lambda, deltaTime);
#elseif cpp
	return flight._cpp._fn.Math.damp(current, target, lambda, deltaTime);
#elseif (js && flight_esm)
	return flight._js._fn.Math.damp(current, target, lambda, deltaTime);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function lerpAngle(a:Float, b:Float, t:Float):Float {
#if hl
	return flight._hl._fn.Math.lerpAngle(a, b, t);
#elseif cpp
	return flight._cpp._fn.Math.lerpAngle(a, b, t);
#elseif (js && flight_esm)
	return flight._js._fn.Math.lerpAngle(a, b, t);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function moveTowards(current:Float, target:Float, maxDelta:Float):Float {
#if hl
	return flight._hl._fn.Math.moveTowards(current, target, maxDelta);
#elseif cpp
	return flight._cpp._fn.Math.moveTowards(current, target, maxDelta);
#elseif (js && flight_esm)
	return flight._js._fn.Math.moveTowards(current, target, maxDelta);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function pingPong(t:Float, length:Float):Float {
#if hl
	return flight._hl._fn.Math.pingPong(t, length);
#elseif cpp
	return flight._cpp._fn.Math.pingPong(t, length);
#elseif (js && flight_esm)
	return flight._js._fn.Math.pingPong(t, length);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function repeat(t:Float, length:Float):Float {
#if hl
	return flight._hl._fn.Math.repeat(t, length);
#elseif cpp
	return flight._cpp._fn.Math.repeat(t, length);
#elseif (js && flight_esm)
	return flight._js._fn.Math.repeat(t, length);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function smootherStep(edge0:Float, edge1:Float, x:Float):Float {
#if hl
	return flight._hl._fn.Math.smootherStep(edge0, edge1, x);
#elseif cpp
	return flight._cpp._fn.Math.smootherStep(edge0, edge1, x);
#elseif (js && flight_esm)
	return flight._js._fn.Math.smootherStep(edge0, edge1, x);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function isPowerOfTwo(n:Int):Bool {
#if hl
	return flight._hl._fn.Math.isPowerOfTwo(n);
#elseif cpp
	return flight._cpp._fn.Math.isPowerOfTwo(n);
#elseif (js && flight_esm)
	return flight._js._fn.Math.isPowerOfTwo(n);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function nextMultipleOf(value:Float, multiple:Float):Float {
#if hl
	return flight._hl._fn.Math.nextMultipleOf(value, multiple);
#elseif cpp
	return flight._cpp._fn.Math.nextMultipleOf(value, multiple);
#elseif (js && flight_esm)
	return flight._js._fn.Math.nextMultipleOf(value, multiple);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function nextPowerOfTwo(n:Int):Int {
#if hl
	return flight._hl._fn.Math.nextPowerOfTwo(n);
#elseif cpp
	return flight._cpp._fn.Math.nextPowerOfTwo(n);
#elseif (js && flight_esm)
	return flight._js._fn.Math.nextPowerOfTwo(n);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function previousPowerOfTwo(n:Int):Int {
#if hl
	return flight._hl._fn.Math.previousPowerOfTwo(n);
#elseif cpp
	return flight._cpp._fn.Math.previousPowerOfTwo(n);
#elseif (js && flight_esm)
	return flight._js._fn.Math.previousPowerOfTwo(n);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function factorial(n:Int):Float {
#if hl
	return flight._hl._fn.Math.factorial(n);
#elseif cpp
	return flight._cpp._fn.Math.factorial(n);
#elseif (js && flight_esm)
	return flight._js._fn.Math.factorial(n);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function gcd(a:Int, b:Int):Int {
#if hl
	return flight._hl._fn.Math.gcd(a, b);
#elseif cpp
	return flight._cpp._fn.Math.gcd(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Math.gcd(a, b);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function hypot2(x:Float, y:Float):Float {
#if hl
	return flight._hl._fn.Math.hypot2(x, y);
#elseif cpp
	return flight._cpp._fn.Math.hypot2(x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Math.hypot2(x, y);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function isEven(n:Int):Bool {
#if hl
	return flight._hl._fn.Math.isEven(n);
#elseif cpp
	return flight._cpp._fn.Math.isEven(n);
#elseif (js && flight_esm)
	return flight._js._fn.Math.isEven(n);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function isOdd(n:Int):Bool {
#if hl
	return flight._hl._fn.Math.isOdd(n);
#elseif cpp
	return flight._cpp._fn.Math.isOdd(n);
#elseif (js && flight_esm)
	return flight._js._fn.Math.isOdd(n);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function lcm(a:Int, b:Int):Int {
#if hl
	return flight._hl._fn.Math.lcm(a, b);
#elseif cpp
	return flight._cpp._fn.Math.lcm(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Math.lcm(a, b);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function createRandomSource(seed:Int):RandomSource {
#if hl
	return flight._hl._fn.Math.createRandomSource(seed);
#elseif cpp
	return flight._cpp._fn.Math.createRandomSource(seed);
#elseif (js && flight_esm)
	return flight._js._fn.Math.createRandomSource(seed);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomExponential(randomFn:Dynamic, randomCtx:Dynamic):Float {
#if hl
	return flight._hl._fn.Math.randomExponential(randomFn, randomCtx);
#elseif cpp
	return flight._cpp._fn.Math.randomExponential(randomFn, randomCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomExponential(randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomGaussian(randomFn:Dynamic, randomCtx:Dynamic):Float {
#if hl
	return flight._hl._fn.Math.randomGaussian(randomFn, randomCtx);
#elseif cpp
	return flight._cpp._fn.Math.randomGaussian(randomFn, randomCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomGaussian(randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomInsideUnitDisc(out:Dynamic, randomFn:Dynamic, randomCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Math.randomInsideUnitDisc(out, randomFn, randomCtx);
#elseif cpp
	flight._cpp._fn.Math.randomInsideUnitDisc(out, randomFn, randomCtx);
#elseif (js && flight_esm)
	flight._js._fn.Math.randomInsideUnitDisc(out, randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomInsideUnitSphere(out:Dynamic, randomFn:Dynamic, randomCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Math.randomInsideUnitSphere(out, randomFn, randomCtx);
#elseif cpp
	flight._cpp._fn.Math.randomInsideUnitSphere(out, randomFn, randomCtx);
#elseif (js && flight_esm)
	flight._js._fn.Math.randomInsideUnitSphere(out, randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomOnUnitCircle(out:Dynamic, randomFn:Dynamic, randomCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Math.randomOnUnitCircle(out, randomFn, randomCtx);
#elseif cpp
	flight._cpp._fn.Math.randomOnUnitCircle(out, randomFn, randomCtx);
#elseif (js && flight_esm)
	flight._js._fn.Math.randomOnUnitCircle(out, randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomOnUnitSphere(out:Dynamic, randomFn:Dynamic, randomCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Math.randomOnUnitSphere(out, randomFn, randomCtx);
#elseif cpp
	flight._cpp._fn.Math.randomOnUnitSphere(out, randomFn, randomCtx);
#elseif (js && flight_esm)
	flight._js._fn.Math.randomOnUnitSphere(out, randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomPoisson(randomFn:Dynamic, randomCtx:Dynamic):Int {
#if hl
	return flight._hl._fn.Math.randomPoisson(randomFn, randomCtx);
#elseif cpp
	return flight._cpp._fn.Math.randomPoisson(randomFn, randomCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomPoisson(randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomWeighted(randomFn:Dynamic, randomCtx:Dynamic):Int {
#if hl
	return flight._hl._fn.Math.randomWeighted(randomFn, randomCtx);
#elseif cpp
	return flight._cpp._fn.Math.randomWeighted(randomFn, randomCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomWeighted(randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomBool(randomFn:Dynamic, randomCtx:Dynamic):Bool {
#if hl
	return flight._hl._fn.Math.randomBool(randomFn, randomCtx);
#elseif cpp
	return flight._cpp._fn.Math.randomBool(randomFn, randomCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomBool(randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomInt(randomFn:Dynamic, randomCtx:Dynamic):Int {
#if hl
	return flight._hl._fn.Math.randomInt(randomFn, randomCtx);
#elseif cpp
	return flight._cpp._fn.Math.randomInt(randomFn, randomCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomInt(randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomRange(randomFn:Dynamic, randomCtx:Dynamic):Float {
#if hl
	return flight._hl._fn.Math.randomRange(randomFn, randomCtx);
#elseif cpp
	return flight._cpp._fn.Math.randomRange(randomFn, randomCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomRange(randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function randomSign(randomFn:Dynamic, randomCtx:Dynamic):Float {
#if hl
	return flight._hl._fn.Math.randomSign(randomFn, randomCtx);
#elseif cpp
	return flight._cpp._fn.Math.randomSign(randomFn, randomCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomSign(randomFn, randomCtx);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function ceilTo(value:Float, step:Float):Float {
#if hl
	return flight._hl._fn.Math.ceilTo(value, step);
#elseif cpp
	return flight._cpp._fn.Math.ceilTo(value, step);
#elseif (js && flight_esm)
	return flight._js._fn.Math.ceilTo(value, step);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function euclideanMod(value:Float, divisor:Float):Float {
#if hl
	return flight._hl._fn.Math.euclideanMod(value, divisor);
#elseif cpp
	return flight._cpp._fn.Math.euclideanMod(value, divisor);
#elseif (js && flight_esm)
	return flight._js._fn.Math.euclideanMod(value, divisor);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function floorTo(value:Float, step:Float):Float {
#if hl
	return flight._hl._fn.Math.floorTo(value, step);
#elseif cpp
	return flight._cpp._fn.Math.floorTo(value, step);
#elseif (js && flight_esm)
	return flight._js._fn.Math.floorTo(value, step);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function fract(value:Float):Float {
#if hl
	return flight._hl._fn.Math.fract(value);
#elseif cpp
	return flight._cpp._fn.Math.fract(value);
#elseif (js && flight_esm)
	return flight._js._fn.Math.fract(value);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function roundTo(value:Float, step:Float):Float {
#if hl
	return flight._hl._fn.Math.roundTo(value, step);
#elseif cpp
	return flight._cpp._fn.Math.roundTo(value, step);
#elseif (js && flight_esm)
	return flight._js._fn.Math.roundTo(value, step);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function ceilPowerOfTwo(n:Int):Int {
#if hl
	return flight._hl._fn.Math.ceilPowerOfTwo(n);
#elseif cpp
	return flight._cpp._fn.Math.ceilPowerOfTwo(n);
#elseif (js && flight_esm)
	return flight._js._fn.Math.ceilPowerOfTwo(n);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function floorPowerOfTwo(n:Int):Int {
#if hl
	return flight._hl._fn.Math.floorPowerOfTwo(n);
#elseif cpp
	return flight._cpp._fn.Math.floorPowerOfTwo(n);
#elseif (js && flight_esm)
	return flight._js._fn.Math.floorPowerOfTwo(n);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function quantize(value:Float, steps:Float, min:Float, max:Float):Float {
#if hl
	return flight._hl._fn.Math.quantize(value, steps, min, max);
#elseif cpp
	return flight._cpp._fn.Math.quantize(value, steps, min, max);
#elseif (js && flight_esm)
	return flight._js._fn.Math.quantize(value, steps, min, max);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function sign(value:Float):Float {
#if hl
	return flight._hl._fn.Math.sign(value);
#elseif cpp
	return flight._cpp._fn.Math.sign(value);
#elseif (js && flight_esm)
	return flight._js._fn.Math.sign(value);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function mean(values:Dynamic, valuesLen:Int):Float {
#if hl
	return flight._hl._fn.Math.mean(values, valuesLen);
#elseif cpp
	return flight._cpp._fn.Math.mean(values, valuesLen);
#elseif (js && flight_esm)
	return flight._js._fn.Math.mean(values, valuesLen);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function median(values:Dynamic, valuesLen:Int):Float {
#if hl
	return flight._hl._fn.Math.median(values, valuesLen);
#elseif cpp
	return flight._cpp._fn.Math.median(values, valuesLen);
#elseif (js && flight_esm)
	return flight._js._fn.Math.median(values, valuesLen);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function standardDeviation(values:Dynamic, valuesLen:Int):Float {
#if hl
	return flight._hl._fn.Math.standardDeviation(values, valuesLen);
#elseif cpp
	return flight._cpp._fn.Math.standardDeviation(values, valuesLen);
#elseif (js && flight_esm)
	return flight._js._fn.Math.standardDeviation(values, valuesLen);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function variance(values:Dynamic, valuesLen:Int):Float {
#if hl
	return flight._hl._fn.Math.variance(values, valuesLen);
#elseif cpp
	return flight._cpp._fn.Math.variance(values, valuesLen);
#elseif (js && flight_esm)
	return flight._js._fn.Math.variance(values, valuesLen);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function weightedAverage(values:Dynamic, valuesLen:Int, weights:Dynamic, weightsLen:Int):Float {
#if hl
	return flight._hl._fn.Math.weightedAverage(values, valuesLen, weights, weightsLen);
#elseif cpp
	return flight._cpp._fn.Math.weightedAverage(values, valuesLen, weights, weightsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Math.weightedAverage(values, valuesLen, weights, weightsLen);
#else
	#error "flight.Math: no backend for this target."
#end
}
inline function freeRandomSource(ptr:RandomSource):Void {
#if hl
	flight._hl._fn.Math.freeRandomSource(ptr);
#elseif cpp
	flight._cpp._fn.Math.freeRandomSource(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Math.freeRandomSource(ptr);
#else
	#error "flight.Math: no backend for this target."
#end
}
