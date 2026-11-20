package flight;

#if (js && flight_esm)
extern inline function degToRad(degrees:Float):Float {
	return flight._js._fn.Math.degToRad(degrees);
}
#else
extern inline function degToRad(degrees:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function deltaAngle(from:Float, to:Float):Float {
	return flight._js._fn.Math.deltaAngle(from, to);
}
#else
extern inline function deltaAngle(from:Float, to:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function normalizeAngle(radians:Float):Float {
	return flight._js._fn.Math.normalizeAngle(radians);
}
#else
extern inline function normalizeAngle(radians:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function radToDeg(radians:Float):Float {
	return flight._js._fn.Math.radToDeg(radians);
}
#else
extern inline function radToDeg(radians:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function clamp(value:Float, min:Float, max:Float):Float {
	return flight._js._fn.Math.clamp(value, min, max);
}
#else
extern inline function clamp(value:Float, min:Float, max:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function inRange(value:Float, min:Float, max:Float):Bool {
	return flight._js._fn.Math.inRange(value, min, max);
}
#else
extern inline function inRange(value:Float, min:Float, max:Float):Bool {
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
#end
#if (js && flight_esm)
extern inline function saturate(value:Float):Float {
	return flight._js._fn.Math.saturate(value);
}
#else
extern inline function saturate(value:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function approxEqual(a:Float, b:Float, epsilon:Null<Float>):Bool {
	return flight._js._fn.Math.approxEqual(a, b, epsilon);
}
#else
extern inline function approxEqual(a:Float, b:Float, epsilon:Float):Bool {
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
#end
#if (js && flight_esm)
extern inline function approxEqualRelative(a:Float, b:Float, relativeEpsilon:Null<Float>):Bool {
	return flight._js._fn.Math.approxEqualRelative(a, b, relativeEpsilon);
}
#else
extern inline function approxEqualRelative(a:Float, b:Float, relativeEpsilon:Float):Bool {
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
#end
#if (js && flight_esm)
extern inline function approxZero(value:Float, epsilon:Null<Float>):Bool {
	return flight._js._fn.Math.approxZero(value, epsilon);
}
#else
extern inline function approxZero(value:Float, epsilon:Float):Bool {
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
#end
#if (js && flight_esm)
extern inline function createRandomSourceFromHash(x:Int, y:Int):RandomSource {
	return flight._js._fn.Math.createRandomSourceFromHash(x, y);
}
#else
extern inline function createRandomSourceFromHash(x:Int, y:Int):RandomSource {
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
#end
#if (js && flight_esm)
extern inline function hash2d(x:Int, y:Int):Int {
	return flight._js._fn.Math.hash2d(x, y);
}
#else
extern inline function hash2d(x:Int, y:Int):Int {
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
#end
#if (js && flight_esm)
extern inline function hash3d(x:Int, y:Int, z:Int):Int {
	return flight._js._fn.Math.hash3d(x, y, z);
}
#else
extern inline function hash3d(x:Int, y:Int, z:Int):Int {
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
#end
#if (js && flight_esm)
extern inline function hashCombine(seed:Int, value:Int):Int {
	return flight._js._fn.Math.hashCombine(seed, value);
}
#else
extern inline function hashCombine(seed:Int, value:Int):Int {
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
#end
#if (js && flight_esm)
extern inline function hashUint32(value:Int):Int {
	return flight._js._fn.Math.hashUint32(value);
}
#else
extern inline function hashUint32(value:Int):Int {
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
#end
#if (js && flight_esm)
extern inline function inverseLerp(a:Float, b:Float, value:Float):Float {
	return flight._js._fn.Math.inverseLerp(a, b, value);
}
#else
extern inline function inverseLerp(a:Float, b:Float, value:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function lerp(a:Float, b:Float, t:Float):Float {
	return flight._js._fn.Math.lerp(a, b, t);
}
#else
extern inline function lerp(a:Float, b:Float, t:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function remap(value:Float, inMin:Float, inMax:Float, outMin:Float, outMax:Float):Float {
	return flight._js._fn.Math.remap(value, inMin, inMax, outMin, outMax);
}
#else
extern inline function remap(value:Float, inMin:Float, inMax:Float, outMin:Float, outMax:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function smoothStep(edge0:Float, edge1:Float, x:Float):Float {
	return flight._js._fn.Math.smoothStep(edge0, edge1, x);
}
#else
extern inline function smoothStep(edge0:Float, edge1:Float, x:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function step(edge:Float, x:Float):Float {
	return flight._js._fn.Math.step(edge, x);
}
#else
extern inline function step(edge:Float, x:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function damp(current:Float, target:Float, lambda:Float, deltaTime:Float):Float {
	return flight._js._fn.Math.damp(current, target, lambda, deltaTime);
}
#else
extern inline function damp(current:Float, target:Float, lambda:Float, deltaTime:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function lerpAngle(a:Float, b:Float, t:Float):Float {
	return flight._js._fn.Math.lerpAngle(a, b, t);
}
#else
extern inline function lerpAngle(a:Float, b:Float, t:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function moveTowards(current:Float, target:Float, maxDelta:Float):Float {
	return flight._js._fn.Math.moveTowards(current, target, maxDelta);
}
#else
extern inline function moveTowards(current:Float, target:Float, maxDelta:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function pingPong(t:Float, length:Float):Float {
	return flight._js._fn.Math.pingPong(t, length);
}
#else
extern inline function pingPong(t:Float, length:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function repeat(t:Float, length:Float):Float {
	return flight._js._fn.Math.repeat(t, length);
}
#else
extern inline function repeat(t:Float, length:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function smootherStep(edge0:Float, edge1:Float, x:Float):Float {
	return flight._js._fn.Math.smootherStep(edge0, edge1, x);
}
#else
extern inline function smootherStep(edge0:Float, edge1:Float, x:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function isPowerOfTwo(n:Int):Bool {
	return flight._js._fn.Math.isPowerOfTwo(n);
}
#else
extern inline function isPowerOfTwo(n:Int):Bool {
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
#end
#if (js && flight_esm)
extern inline function nextMultipleOf(value:Float, multiple:Float):Float {
	return flight._js._fn.Math.nextMultipleOf(value, multiple);
}
#else
extern inline function nextMultipleOf(value:Float, multiple:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function nextPowerOfTwo(n:Int):Int {
	return flight._js._fn.Math.nextPowerOfTwo(n);
}
#else
extern inline function nextPowerOfTwo(n:Int):Int {
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
#end
#if (js && flight_esm)
extern inline function previousPowerOfTwo(n:Int):Int {
	return flight._js._fn.Math.previousPowerOfTwo(n);
}
#else
extern inline function previousPowerOfTwo(n:Int):Int {
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
#end
#if (js && flight_esm)
extern inline function factorial(n:Int):Float {
	return flight._js._fn.Math.factorial(n);
}
#else
extern inline function factorial(n:Int):Float {
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
#end
#if (js && flight_esm)
extern inline function gcd(a:Int, b:Int):Int {
	return flight._js._fn.Math.gcd(a, b);
}
#else
extern inline function gcd(a:Int, b:Int):Int {
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
#end
#if (js && flight_esm)
extern inline function hypot2(x:Float, y:Float):Float {
	return flight._js._fn.Math.hypot2(x, y);
}
#else
extern inline function hypot2(x:Float, y:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function isEven(n:Int):Bool {
	return flight._js._fn.Math.isEven(n);
}
#else
extern inline function isEven(n:Int):Bool {
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
#end
#if (js && flight_esm)
extern inline function isOdd(n:Int):Bool {
	return flight._js._fn.Math.isOdd(n);
}
#else
extern inline function isOdd(n:Int):Bool {
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
#end
#if (js && flight_esm)
extern inline function lcm(a:Int, b:Int):Int {
	return flight._js._fn.Math.lcm(a, b);
}
#else
extern inline function lcm(a:Int, b:Int):Int {
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
#end
#if (js && flight_esm)
extern inline function createRandomSource(seed:Int):RandomSource {
	return flight._js._fn.Math.createRandomSource(seed);
}
#else
extern inline function createRandomSource(seed:Int):RandomSource {
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
#end
#if (js && flight_esm)
extern inline function randomExponential(random:Dynamic, rate:Null<Float>):Float {
	return flight._js._fn.Math.randomExponential(random, rate);
}
#else
extern inline function randomExponential(randomFn:Dynamic, randomCtx:Dynamic, rate:Float):Float {
#if hl
	return flight._hl._fn.Math.randomExponential(randomFn, randomCtx, rate);
#elseif cpp
	return flight._cpp._fn.Math.randomExponential(randomFn, randomCtx, rate);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomExponential(randomFn, randomCtx, rate);
#else
	#error "flight.Math: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function randomGaussian(random:Dynamic, mean:Null<Float>, standardDeviation:Null<Float>):Float {
	return flight._js._fn.Math.randomGaussian(random, mean, standardDeviation);
}
#else
extern inline function randomGaussian(randomFn:Dynamic, randomCtx:Dynamic, mean:Float, standardDeviation:Float):Float {
#if hl
	return flight._hl._fn.Math.randomGaussian(randomFn, randomCtx, mean, standardDeviation);
#elseif cpp
	return flight._cpp._fn.Math.randomGaussian(randomFn, randomCtx, mean, standardDeviation);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomGaussian(randomFn, randomCtx, mean, standardDeviation);
#else
	#error "flight.Math: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function randomGaussianPair(random:Dynamic, mean:Null<Float>, standardDeviation:Null<Float>):{ _0:Float, _1:Float } {
	var result = flight._js._fn.Math.randomGaussianPair(random, mean, standardDeviation);
	return { _0: result[0], _1: result[1] };
}
#else
extern inline function randomGaussianPair(randomFn:Dynamic, randomCtx:Dynamic, mean:Float, standardDeviation:Float):{ _0:Float, _1:Float } {
#if hl
	var out0:Float = 0;
	var out1:Float = 0;
	flight._hl._fn.Math.randomGaussianPair(randomFn, randomCtx, mean, standardDeviation, hl.Ref.make(out0), hl.Ref.make(out1));
	return { _0: out0, _1: out1 };
#elseif cpp
	var out0:cpp.Float64 = 0;
	var out1:cpp.Float64 = 0;
	flight._cpp._fn.Math.randomGaussianPair(randomFn, randomCtx, mean, standardDeviation, cpp.RawPointer.addressOf(out0), cpp.RawPointer.addressOf(out1));
	return { _0: out0, _1: out1 };
#elseif (js && flight_esm)
	var result = flight._js._fn.Math.randomGaussianPair(randomFn, randomCtx, mean, standardDeviation);
	return { _0: result[0], _1: result[1] };
#else
	#error "flight.Math: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function randomInsideUnitDisc(out:Dynamic, random:Dynamic):Void {
	flight._js._fn.Math.randomInsideUnitDisc(out, random);
}
#else
extern inline function randomInsideUnitDisc(out:Dynamic, randomFn:Dynamic, randomCtx:Dynamic):Void {
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
#end
#if (js && flight_esm)
extern inline function randomInsideUnitSphere(out:Dynamic, random:Dynamic):Void {
	flight._js._fn.Math.randomInsideUnitSphere(out, random);
}
#else
extern inline function randomInsideUnitSphere(out:Dynamic, randomFn:Dynamic, randomCtx:Dynamic):Void {
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
#end
#if (js && flight_esm)
extern inline function randomOnUnitCircle(out:Dynamic, random:Dynamic):Void {
	flight._js._fn.Math.randomOnUnitCircle(out, random);
}
#else
extern inline function randomOnUnitCircle(out:Dynamic, randomFn:Dynamic, randomCtx:Dynamic):Void {
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
#end
#if (js && flight_esm)
extern inline function randomOnUnitSphere(out:Dynamic, random:Dynamic):Void {
	flight._js._fn.Math.randomOnUnitSphere(out, random);
}
#else
extern inline function randomOnUnitSphere(out:Dynamic, randomFn:Dynamic, randomCtx:Dynamic):Void {
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
#end
#if (js && flight_esm)
extern inline function randomPoisson(random:Dynamic, lambda:Null<Float>):Int {
	return flight._js._fn.Math.randomPoisson(random, lambda);
}
#else
extern inline function randomPoisson(randomFn:Dynamic, randomCtx:Dynamic, lambda:Float):Int {
#if hl
	return flight._hl._fn.Math.randomPoisson(randomFn, randomCtx, lambda);
#elseif cpp
	return flight._cpp._fn.Math.randomPoisson(randomFn, randomCtx, lambda);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomPoisson(randomFn, randomCtx, lambda);
#else
	#error "flight.Math: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function randomWeighted(random:Dynamic, weights:Dynamic):Int {
	return flight._js._fn.Math.randomWeighted(random, weights);
}
#else
extern inline function randomWeighted(randomFn:Dynamic, randomCtx:Dynamic, weights:Dynamic, weightsLen:Int):Int {
#if hl
	return flight._hl._fn.Math.randomWeighted(randomFn, randomCtx, weights, weightsLen);
#elseif cpp
	return flight._cpp._fn.Math.randomWeighted(randomFn, randomCtx, weights, weightsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomWeighted(randomFn, randomCtx, weights, weightsLen);
#else
	#error "flight.Math: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function randomBool(random:Dynamic, probability:Null<Float>):Bool {
	return flight._js._fn.Math.randomBool(random, probability);
}
#else
extern inline function randomBool(randomFn:Dynamic, randomCtx:Dynamic, probability:Float):Bool {
#if hl
	return flight._hl._fn.Math.randomBool(randomFn, randomCtx, probability);
#elseif cpp
	return flight._cpp._fn.Math.randomBool(randomFn, randomCtx, probability);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomBool(randomFn, randomCtx, probability);
#else
	#error "flight.Math: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function randomInt(random:Dynamic, min:Int, max:Int):Int {
	return flight._js._fn.Math.randomInt(random, min, max);
}
#else
extern inline function randomInt(randomFn:Dynamic, randomCtx:Dynamic, min:Int, max:Int):Int {
#if hl
	return flight._hl._fn.Math.randomInt(randomFn, randomCtx, min, max);
#elseif cpp
	return flight._cpp._fn.Math.randomInt(randomFn, randomCtx, min, max);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomInt(randomFn, randomCtx, min, max);
#else
	#error "flight.Math: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function randomRange(random:Dynamic, min:Float, max:Float):Float {
	return flight._js._fn.Math.randomRange(random, min, max);
}
#else
extern inline function randomRange(randomFn:Dynamic, randomCtx:Dynamic, min:Float, max:Float):Float {
#if hl
	return flight._hl._fn.Math.randomRange(randomFn, randomCtx, min, max);
#elseif cpp
	return flight._cpp._fn.Math.randomRange(randomFn, randomCtx, min, max);
#elseif (js && flight_esm)
	return flight._js._fn.Math.randomRange(randomFn, randomCtx, min, max);
#else
	#error "flight.Math: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function randomSign(random:Dynamic):Float {
	return flight._js._fn.Math.randomSign(random);
}
#else
extern inline function randomSign(randomFn:Dynamic, randomCtx:Dynamic):Float {
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
#end
#if (js && flight_esm)
extern inline function ceilTo(value:Float, step:Float):Float {
	return flight._js._fn.Math.ceilTo(value, step);
}
#else
extern inline function ceilTo(value:Float, step:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function euclideanMod(value:Float, divisor:Float):Float {
	return flight._js._fn.Math.euclideanMod(value, divisor);
}
#else
extern inline function euclideanMod(value:Float, divisor:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function floorTo(value:Float, step:Float):Float {
	return flight._js._fn.Math.floorTo(value, step);
}
#else
extern inline function floorTo(value:Float, step:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function fract(value:Float):Float {
	return flight._js._fn.Math.fract(value);
}
#else
extern inline function fract(value:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function roundTo(value:Float, step:Float):Float {
	return flight._js._fn.Math.roundTo(value, step);
}
#else
extern inline function roundTo(value:Float, step:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function ceilPowerOfTwo(n:Int):Int {
	return flight._js._fn.Math.ceilPowerOfTwo(n);
}
#else
extern inline function ceilPowerOfTwo(n:Int):Int {
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
#end
#if (js && flight_esm)
extern inline function floorPowerOfTwo(n:Int):Int {
	return flight._js._fn.Math.floorPowerOfTwo(n);
}
#else
extern inline function floorPowerOfTwo(n:Int):Int {
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
#end
#if (js && flight_esm)
extern inline function quantize(value:Float, steps:Float, min:Float, max:Float):Float {
	return flight._js._fn.Math.quantize(value, steps, min, max);
}
#else
extern inline function quantize(value:Float, steps:Float, min:Float, max:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function sign(value:Float):Float {
	return flight._js._fn.Math.sign(value);
}
#else
extern inline function sign(value:Float):Float {
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
#end
#if (js && flight_esm)
extern inline function mean(values:Dynamic):Float {
	return flight._js._fn.Math.mean(values);
}
#else
extern inline function mean(values:Dynamic, valuesLen:Int):Float {
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
#end
#if (js && flight_esm)
extern inline function median(values:Dynamic):Float {
	return flight._js._fn.Math.median(values);
}
#else
extern inline function median(values:Dynamic, valuesLen:Int):Float {
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
#end
#if (js && flight_esm)
extern inline function standardDeviation(values:Dynamic):Float {
	return flight._js._fn.Math.standardDeviation(values);
}
#else
extern inline function standardDeviation(values:Dynamic, valuesLen:Int):Float {
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
#end
#if (js && flight_esm)
extern inline function variance(values:Dynamic):Float {
	return flight._js._fn.Math.variance(values);
}
#else
extern inline function variance(values:Dynamic, valuesLen:Int):Float {
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
#end
#if (js && flight_esm)
extern inline function weightedAverage(values:Dynamic, weights:Dynamic):Float {
	return flight._js._fn.Math.weightedAverage(values, weights);
}
#else
extern inline function weightedAverage(values:Dynamic, valuesLen:Int, weights:Dynamic, weightsLen:Int):Float {
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
#end
#if (js && flight_esm)
extern inline function freeRandomSource(ptr:RandomSource):Void {
	flight._js._fn.Math.freeRandomSource(ptr);
}
#else
extern inline function freeRandomSource(ptr:RandomSource):Void {
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
#end
