package flight.esm.math;

#if (js && flight_esm)
@:jsRequire("@flighthq/math/contract")
extern class Contract {
  public static final CIRCLE_KAPPA:Float;
  public static final DEG_TO_RAD:Float;
  public static final EPSILON:Float;
  public static final HALF_PI:Float;
  public static final RAD_TO_DEG:Float;
  public static final TAU:Float;
  public static function approxEqual(a:Float, b:Float, ?epsilon:Null<Float>):Bool;
  public static function approxEqualRelative(a:Float, b:Float, ?relativeEpsilon:Null<Float>):Bool;
  public static function approxZero(value:Float, ?epsilon:Null<Float>):Bool;
  public static function ceilPowerOfTwo(n:Float):Float;
  public static function ceilTo(value:Float, step:Float):Float;
  public static function clamp(value:Float, min:Float, max:Float):Float;
  public static function createRandomSource(seed:Float):flight.esm.types.math.Types.RandomSource;
  public static function createRandomSourceFromHash(x:Float, y:Float):flight.esm.types.math.Types.RandomSource;
  public static function damp(current:Float, target:Float, lambda:Float, deltaTime:Float):Float;
  public static function degToRad(degrees:Float):Float;
  public static function deltaAngle(from:Float, to:Float):Float;
  public static function euclideanMod(value:Float, divisor:Float):Float;
  public static function factorial(n:Float):Float;
  public static function floorPowerOfTwo(n:Float):Float;
  public static function floorTo(value:Float, step:Float):Float;
  public static function fract(value:Float):Float;
  public static function gcd(a:Float, b:Float):Float;
  public static function hash2D(x:Float, y:Float):Float;
  public static function hash3D(x:Float, y:Float, z:Float):Float;
  public static function hashCombine(seed:Float, value:Float):Float;
  public static function hashUint32(value:Float):Float;
  public static function hypot2(x:Float, y:Float):Float;
  public static function inRange(value:Float, min:Float, max:Float):Bool;
  public static function inverseLerp(a:Float, b:Float, value:Float):Float;
  public static function isEven(n:Float):Bool;
  public static function isOdd(n:Float):Bool;
  public static function isPowerOfTwo(n:Float):Bool;
  public static function lcm(a:Float, b:Float):Float;
  public static function lerp(a:Float, b:Float, t:Float):Float;
  public static function lerpAngle(a:Float, b:Float, t:Float):Float;
  public static function mean(values:Array<Float>):Float;
  public static function median(values:Array<Float>):Float;
  public static function moveTowards(current:Float, target:Float, maxDelta:Float):Float;
  public static function nextMultipleOf(value:Float, multiple:Float):Float;
  public static function nextPowerOfTwo(n:Float):Float;
  public static function normalizeAngle(radians:Float):Float;
  public static function pick<T>(random:flight.esm.types.math.Types.RandomSource, items:Array<T>):Null<T>;
  public static function pingPong(t:Float, length:Float):Float;
  public static function previousPowerOfTwo(n:Float):Float;
  public static function quantize(value:Float, steps:Float, min:Float, max:Float):Float;
  public static function radToDeg(radians:Float):Float;
  public static function randomBool(random:flight.esm.types.math.Types.RandomSource, ?probability:Null<Float>):Bool;
  public static function randomExponential(random:flight.esm.types.math.Types.RandomSource, ?rate:Null<Float>):Float;
  public static function randomGaussian(random:flight.esm.types.math.Types.RandomSource, ?mean:Null<Float>, ?standardDeviation:Null<Float>):Float;
  public static function randomGaussianPair(random:flight.esm.types.math.Types.RandomSource, ?mean:Null<Float>, ?standardDeviation:Null<Float>):Array<Float>;
  public static function randomInsideUnitDisc(out:js.lib.Float32Array, random:flight.esm.types.math.Types.RandomSource):Void;
  public static function randomInsideUnitSphere(out:js.lib.Float32Array, random:flight.esm.types.math.Types.RandomSource):Void;
  public static function randomInt(random:flight.esm.types.math.Types.RandomSource, min:Float, max:Float):Float;
  public static function randomOnUnitCircle(out:js.lib.Float32Array, random:flight.esm.types.math.Types.RandomSource):Void;
  public static function randomOnUnitSphere(out:js.lib.Float32Array, random:flight.esm.types.math.Types.RandomSource):Void;
  public static function randomPoisson(random:flight.esm.types.math.Types.RandomSource, ?lambda:Null<Float>):Float;
  public static function randomRange(random:flight.esm.types.math.Types.RandomSource, min:Float, max:Float):Float;
  public static function randomSign(random:flight.esm.types.math.Types.RandomSource):Float;
  public static function randomWeighted(random:flight.esm.types.math.Types.RandomSource, weights:Array<Float>):Float;
  public static function remap(value:Float, inMin:Float, inMax:Float, outMin:Float, outMax:Float):Float;
  public static function repeat(t:Float, length:Float):Float;
  public static function roundTo(value:Float, step:Float):Float;
  public static function saturate(value:Float):Float;
  public static function shuffle<T>(out:Array<T>, random:flight.esm.types.math.Types.RandomSource, items:Array<T>):Void;
  public static function shuffleInPlace<T>(random:flight.esm.types.math.Types.RandomSource, items:Array<T>):Void;
  public static function sign(value:Float):Float;
  public static function smoothStep(edge0:Float, edge1:Float, x:Float):Float;
  public static function smootherStep(edge0:Float, edge1:Float, x:Float):Float;
  public static function standardDeviation(values:Array<Float>):Float;
  public static function step(edge:Float, x:Float):Float;
  public static function variance(values:Array<Float>):Float;
  public static function weightedAverage(values:Array<Float>, weights:Array<Float>):Float;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
