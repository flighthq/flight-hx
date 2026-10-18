// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function approxEqual(a:Float, b:Float, ?epsilon:Float):Bool {
  return flight._cpp._fn.Math.approxEqual(a, b, epsilon != null, epsilon == null ? 0.0 : epsilon);
}

inline function approxEqualRelative(a:Float, b:Float, ?relativeEpsilon:Float):Bool {
  return flight._cpp._fn.Math.approxEqualRelative(a, b, relativeEpsilon != null, relativeEpsilon == null ? 0.0 : relativeEpsilon);
}

inline function approxZero(value:Float, ?epsilon:Float):Bool {
  return flight._cpp._fn.Math.approxZero(value, epsilon != null, epsilon == null ? 0.0 : epsilon);
}

inline function ceilPowerOfTwo(n:Float):Float {
  return flight._cpp._fn.Math.ceilPowerOfTwo(n);
}

inline function ceilTo(value:Float, step:Float):Float {
  return flight._cpp._fn.Math.ceilTo(value, step);
}

inline function clamp(value:Float, min:Float, max:Float):Float {
  return flight._cpp._fn.Math.clamp(value, min, max);
}

inline function damp(current:Float, target:Float, lambda:Float, deltaTime:Float):Float {
  return flight._cpp._fn.Math.damp(current, target, lambda, deltaTime);
}

inline function degToRad(degrees:Float):Float {
  return flight._cpp._fn.Math.degToRad(degrees);
}

inline function deltaAngle(from:Float, to:Float):Float {
  return flight._cpp._fn.Math.deltaAngle(from, to);
}

inline function euclideanMod(value:Float, divisor:Float):Float {
  return flight._cpp._fn.Math.euclideanMod(value, divisor);
}

inline function factorial(n:Float):Float {
  return flight._cpp._fn.Math.factorial(n);
}

inline function floorPowerOfTwo(n:Float):Float {
  return flight._cpp._fn.Math.floorPowerOfTwo(n);
}

inline function floorTo(value:Float, step:Float):Float {
  return flight._cpp._fn.Math.floorTo(value, step);
}

inline function fract(value:Float):Float {
  return flight._cpp._fn.Math.fract(value);
}

inline function gcd(a:Float, b:Float):Float {
  return flight._cpp._fn.Math.gcd(a, b);
}

inline function hash2D(x:Float, y:Float):Float {
  return flight._cpp._fn.Math.hash2D(x, y);
}

inline function hash3D(x:Float, y:Float, z:Float):Float {
  return flight._cpp._fn.Math.hash3D(x, y, z);
}

inline function hashCombine(seed:Float, value:Float):Float {
  return flight._cpp._fn.Math.hashCombine(seed, value);
}

inline function hashUint32(value:Float):Float {
  return flight._cpp._fn.Math.hashUint32(value);
}

inline function hypot2(x:Float, y:Float):Float {
  return flight._cpp._fn.Math.hypot2(x, y);
}

inline function inRange(value:Float, min:Float, max:Float):Bool {
  return flight._cpp._fn.Math.inRange(value, min, max);
}

inline function inverseLerp(a:Float, b:Float, value:Float):Float {
  return flight._cpp._fn.Math.inverseLerp(a, b, value);
}

inline function isEven(n:Float):Bool {
  return flight._cpp._fn.Math.isEven(n);
}

inline function isOdd(n:Float):Bool {
  return flight._cpp._fn.Math.isOdd(n);
}

inline function isPowerOfTwo(n:Float):Bool {
  return flight._cpp._fn.Math.isPowerOfTwo(n);
}

inline function lcm(a:Float, b:Float):Float {
  return flight._cpp._fn.Math.lcm(a, b);
}

inline function lerp(a:Float, b:Float, t:Float):Float {
  return flight._cpp._fn.Math.lerp(a, b, t);
}

inline function lerpAngle(a:Float, b:Float, t:Float):Float {
  return flight._cpp._fn.Math.lerpAngle(a, b, t);
}

inline function moveTowards(current:Float, target:Float, maxDelta:Float):Float {
  return flight._cpp._fn.Math.moveTowards(current, target, maxDelta);
}

inline function nextMultipleOf(value:Float, multiple:Float):Float {
  return flight._cpp._fn.Math.nextMultipleOf(value, multiple);
}

inline function nextPowerOfTwo(n:Float):Float {
  return flight._cpp._fn.Math.nextPowerOfTwo(n);
}

inline function normalizeAngle(radians:Float):Float {
  return flight._cpp._fn.Math.normalizeAngle(radians);
}

inline function pingPong(t:Float, length:Float):Float {
  return flight._cpp._fn.Math.pingPong(t, length);
}

inline function previousPowerOfTwo(n:Float):Float {
  return flight._cpp._fn.Math.previousPowerOfTwo(n);
}

inline function quantize(value:Float, steps:Float, min:Float, max:Float):Float {
  return flight._cpp._fn.Math.quantize(value, steps, min, max);
}

inline function radToDeg(radians:Float):Float {
  return flight._cpp._fn.Math.radToDeg(radians);
}

inline function remap(value:Float, inMin:Float, inMax:Float, outMin:Float, outMax:Float):Float {
  return flight._cpp._fn.Math.remap(value, inMin, inMax, outMin, outMax);
}

inline function repeat(t:Float, length:Float):Float {
  return flight._cpp._fn.Math.repeat(t, length);
}

inline function roundTo(value:Float, step:Float):Float {
  return flight._cpp._fn.Math.roundTo(value, step);
}

inline function saturate(value:Float):Float {
  return flight._cpp._fn.Math.saturate(value);
}

inline function sign(value:Float):Float {
  return flight._cpp._fn.Math.sign(value);
}

inline function smootherStep(edge0:Float, edge1:Float, x:Float):Float {
  return flight._cpp._fn.Math.smootherStep(edge0, edge1, x);
}

inline function smoothStep(edge0:Float, edge1:Float, x:Float):Float {
  return flight._cpp._fn.Math.smoothStep(edge0, edge1, x);
}

inline function step(edge:Float, x:Float):Float {
  return flight._cpp._fn.Math.step(edge, x);
}

var CIRCLE_KAPPA(get, set):Float;

private extern inline function get_CIRCLE_KAPPA():Float return flight._cpp._attempt.Attempt_Math_CIRCLE_KAPPA.CIRCLE_KAPPA;

private extern inline function set_CIRCLE_KAPPA(value:Float):Float return flight._cpp._attempt.Attempt_Math_CIRCLE_KAPPA.CIRCLE_KAPPA = value;

var DEG_TO_RAD(get, set):Float;

private extern inline function get_DEG_TO_RAD():Float return flight._cpp._attempt.Attempt_Math_DEG_TO_RAD.DEG_TO_RAD;

private extern inline function set_DEG_TO_RAD(value:Float):Float return flight._cpp._attempt.Attempt_Math_DEG_TO_RAD.DEG_TO_RAD = value;

var EPSILON(get, set):Float;

private extern inline function get_EPSILON():Float return flight._cpp._attempt.Attempt_Math_EPSILON.EPSILON;

private extern inline function set_EPSILON(value:Float):Float return flight._cpp._attempt.Attempt_Math_EPSILON.EPSILON = value;

var HALF_PI(get, set):Float;

private extern inline function get_HALF_PI():Float return flight._cpp._attempt.Attempt_Math_HALF_PI.HALF_PI;

private extern inline function set_HALF_PI(value:Float):Float return flight._cpp._attempt.Attempt_Math_HALF_PI.HALF_PI = value;

var RAD_TO_DEG(get, set):Float;

private extern inline function get_RAD_TO_DEG():Float return flight._cpp._attempt.Attempt_Math_RAD_TO_DEG.RAD_TO_DEG;

private extern inline function set_RAD_TO_DEG(value:Float):Float return flight._cpp._attempt.Attempt_Math_RAD_TO_DEG.RAD_TO_DEG = value;

var TAU(get, set):Float;

private extern inline function get_TAU():Float return flight._cpp._attempt.Attempt_Math_TAU.TAU;

private extern inline function set_TAU(value:Float):Float return flight._cpp._attempt.Attempt_Math_TAU.TAU = value;

extern inline function createRandomSource(seed:Float):flight.RandomSource {
  return flight._cpp._attempt.Attempt_Math_createRandomSource.createRandomSource(seed);
}

extern inline function createRandomSourceFromHash(x:Float, y:Float):flight.RandomSource {
  return flight._cpp._attempt.Attempt_Math_createRandomSourceFromHash.createRandomSourceFromHash(x, y);
}

extern inline function mean(values:Array<Float>):Float {
  return flight._cpp._attempt.Attempt_Math_mean.mean(values);
}

extern inline function median(values:Array<Float>):Float {
  return flight._cpp._attempt.Attempt_Math_median.median(values);
}

extern inline function pick<T>(random:flight.RandomSource, items:Array<T>):Null<T> {
  return flight._cpp._attempt.Attempt_Math_pick.pick(random, items);
}

extern inline function randomBool(random:flight.RandomSource, ?probability:Float):Bool {
  return flight._cpp._attempt.Attempt_Math_randomBool.randomBool(random, probability);
}

extern inline function randomExponential(random:flight.RandomSource, ?rate:Float):Float {
  return flight._cpp._attempt.Attempt_Math_randomExponential.randomExponential(random, rate);
}

extern inline function randomGaussian(random:flight.RandomSource, ?mean:Float, ?standardDeviation:Float):Float {
  return flight._cpp._attempt.Attempt_Math_randomGaussian.randomGaussian(random, mean, standardDeviation);
}

extern inline function randomGaussianPair(random:flight.RandomSource, ?mean:Float, ?standardDeviation:Float):Array<Float> {
  return flight._cpp._attempt.Attempt_Math_randomGaussianPair.randomGaussianPair(random, mean, standardDeviation);
}

extern inline function randomInsideUnitDisc(random:flight.RandomSource, out:flight.Vector2Like):Void {
  flight._cpp._attempt.Attempt_Math_randomInsideUnitDisc.randomInsideUnitDisc(random, out);
}

extern inline function randomInsideUnitSphere(random:flight.RandomSource, out:flight.Vector3Like):Void {
  flight._cpp._attempt.Attempt_Math_randomInsideUnitSphere.randomInsideUnitSphere(random, out);
}

extern inline function randomInt(random:flight.RandomSource, min:Float, max:Float):Float {
  return flight._cpp._attempt.Attempt_Math_randomInt.randomInt(random, min, max);
}

extern inline function randomOnUnitCircle(random:flight.RandomSource, out:flight.Vector2Like):Void {
  flight._cpp._attempt.Attempt_Math_randomOnUnitCircle.randomOnUnitCircle(random, out);
}

extern inline function randomOnUnitSphere(random:flight.RandomSource, out:flight.Vector3Like):Void {
  flight._cpp._attempt.Attempt_Math_randomOnUnitSphere.randomOnUnitSphere(random, out);
}

extern inline function randomPoisson(random:flight.RandomSource, ?lambda:Float):Float {
  return flight._cpp._attempt.Attempt_Math_randomPoisson.randomPoisson(random, lambda);
}

extern inline function randomRange(random:flight.RandomSource, min:Float, max:Float):Float {
  return flight._cpp._attempt.Attempt_Math_randomRange.randomRange(random, min, max);
}

extern inline function randomSign(random:flight.RandomSource):Float {
  return flight._cpp._attempt.Attempt_Math_randomSign.randomSign(random);
}

extern inline function randomWeighted(random:flight.RandomSource, weights:Array<Float>):Float {
  return flight._cpp._attempt.Attempt_Math_randomWeighted.randomWeighted(random, weights);
}

extern inline function shuffle<T>(random:flight.RandomSource, items:Array<T>):Array<T> {
  return flight._cpp._attempt.Attempt_Math_shuffle.shuffle(random, items);
}

extern inline function shuffleInPlace<T>(random:flight.RandomSource, items:Array<T>):Void {
  flight._cpp._attempt.Attempt_Math_shuffleInPlace.shuffleInPlace(random, items);
}

extern inline function standardDeviation(values:Array<Float>):Float {
  return flight._cpp._attempt.Attempt_Math_standardDeviation.standardDeviation(values);
}

extern inline function variance(values:Array<Float>):Float {
  return flight._cpp._attempt.Attempt_Math_variance.variance(values);
}

extern inline function weightedAverage(values:Array<Float>, weights:Array<Float>):Float {
  return flight._cpp._attempt.Attempt_Math_weightedAverage.weightedAverage(values, weights);
}
