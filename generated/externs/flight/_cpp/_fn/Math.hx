package flight._cpp._fn;

extern class Math {
	@:native("flight_deg_to_rad")
	public static function degToRad(degrees:Float):Float;
	@:native("flight_delta_angle")
	public static function deltaAngle(from:Float, to:Float):Float;
	@:native("flight_normalize_angle")
	public static function normalizeAngle(radians:Float):Float;
	@:native("flight_rad_to_deg")
	public static function radToDeg(radians:Float):Float;
	@:native("flight_clamp")
	public static function clamp(value:Float, min:Float, max:Float):Float;
	@:native("flight_in_range")
	public static function inRange(value:Float, min:Float, max:Float):Bool;
	@:native("flight_saturate")
	public static function saturate(value:Float):Float;
	@:native("flight_approx_equal")
	public static function approxEqual(a:Float, b:Float, epsilon:Float):Bool;
	@:native("flight_approx_equal_relative")
	public static function approxEqualRelative(a:Float, b:Float, relativeEpsilon:Float):Bool;
	@:native("flight_approx_zero")
	public static function approxZero(value:Float, epsilon:Float):Bool;
	@:native("flight_create_random_source_from_hash")
	public static function createRandomSourceFromHash(x:Int, y:Int):flight._cpp.RandomSource;
	@:native("flight_hash_2d")
	public static function hash2d(x:Int, y:Int):Int;
	@:native("flight_hash_3d")
	public static function hash3d(x:Int, y:Int, z:Int):Int;
	@:native("flight_hash_combine")
	public static function hashCombine(seed:Int, value:Int):Int;
	@:native("flight_hash_uint32")
	public static function hashUint32(value:Int):Int;
	@:native("flight_inverse_lerp")
	public static function inverseLerp(a:Float, b:Float, value:Float):Float;
	@:native("flight_lerp")
	public static function lerp(a:Float, b:Float, t:Float):Float;
	@:native("flight_remap")
	public static function remap(value:Float, inMin:Float, inMax:Float, outMin:Float, outMax:Float):Float;
	@:native("flight_smooth_step")
	public static function smoothStep(edge0:Float, edge1:Float, x:Float):Float;
	@:native("flight_step")
	public static function step(edge:Float, x:Float):Float;
	@:native("flight_damp")
	public static function damp(current:Float, target:Float, lambda:Float, deltaTime:Float):Float;
	@:native("flight_lerp_angle")
	public static function lerpAngle(a:Float, b:Float, t:Float):Float;
	@:native("flight_move_towards")
	public static function moveTowards(current:Float, target:Float, maxDelta:Float):Float;
	@:native("flight_ping_pong")
	public static function pingPong(t:Float, length:Float):Float;
	@:native("flight_repeat")
	public static function repeat(t:Float, length:Float):Float;
	@:native("flight_smoother_step")
	public static function smootherStep(edge0:Float, edge1:Float, x:Float):Float;
	@:native("flight_is_power_of_two")
	public static function isPowerOfTwo(n:Int):Bool;
	@:native("flight_next_multiple_of")
	public static function nextMultipleOf(value:Float, multiple:Float):Float;
	@:native("flight_next_power_of_two")
	public static function nextPowerOfTwo(n:Int):Int;
	@:native("flight_previous_power_of_two")
	public static function previousPowerOfTwo(n:Int):Int;
	@:native("flight_factorial")
	public static function factorial(n:Int):Float;
	@:native("flight_gcd")
	public static function gcd(a:Int, b:Int):Int;
	@:native("flight_hypot2")
	public static function hypot2(x:Float, y:Float):Float;
	@:native("flight_is_even")
	public static function isEven(n:Int):Bool;
	@:native("flight_is_odd")
	public static function isOdd(n:Int):Bool;
	@:native("flight_lcm")
	public static function lcm(a:Int, b:Int):Int;
	@:native("flight_create_random_source")
	public static function createRandomSource(seed:Int):flight._cpp.RandomSource;
	@:native("flight_random_exponential")
	public static function randomExponential(randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>, rate:Float):Float;
	@:native("flight_random_gaussian")
	public static function randomGaussian(randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>, mean:Float, standardDeviation:Float):Float;
	@:native("flight_random_gaussian_pair")
	public static function randomGaussianPair(randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>, mean:Float, standardDeviation:Float, out0:cpp.RawPointer<cpp.Float64>, out1:cpp.RawPointer<cpp.Float64>):Void;
	@:native("flight_random_inside_unit_disc")
	public static function randomInsideUnitDisc(out:cpp.Star<cpp.Void>, randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_random_inside_unit_sphere")
	public static function randomInsideUnitSphere(out:cpp.Star<cpp.Void>, randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_random_on_unit_circle")
	public static function randomOnUnitCircle(out:cpp.Star<cpp.Void>, randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_random_on_unit_sphere")
	public static function randomOnUnitSphere(out:cpp.Star<cpp.Void>, randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_random_poisson")
	public static function randomPoisson(randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>, lambda:Float):Int;
	@:native("flight_random_weighted")
	public static function randomWeighted(randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>, weights:cpp.Star<cpp.Void>, weightsLen:Int):Int;
	@:native("flight_random_bool")
	public static function randomBool(randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>, probability:Float):Bool;
	@:native("flight_random_int")
	public static function randomInt(randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>, min:Int, max:Int):Int;
	@:native("flight_random_range")
	public static function randomRange(randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>, min:Float, max:Float):Float;
	@:native("flight_random_sign")
	public static function randomSign(randomFn:cpp.Star<cpp.Void>, randomCtx:cpp.Star<cpp.Void>):Float;
	@:native("flight_ceil_to")
	public static function ceilTo(value:Float, step:Float):Float;
	@:native("flight_euclidean_mod")
	public static function euclideanMod(value:Float, divisor:Float):Float;
	@:native("flight_floor_to")
	public static function floorTo(value:Float, step:Float):Float;
	@:native("flight_fract")
	public static function fract(value:Float):Float;
	@:native("flight_round_to")
	public static function roundTo(value:Float, step:Float):Float;
	@:native("flight_ceil_power_of_two")
	public static function ceilPowerOfTwo(n:Int):Int;
	@:native("flight_floor_power_of_two")
	public static function floorPowerOfTwo(n:Int):Int;
	@:native("flight_quantize")
	public static function quantize(value:Float, steps:Float, min:Float, max:Float):Float;
	@:native("flight_sign")
	public static function sign(value:Float):Float;
	@:native("flight_mean")
	public static function mean(values:cpp.Star<cpp.Void>, valuesLen:Int):Float;
	@:native("flight_median")
	public static function median(values:cpp.Star<cpp.Void>, valuesLen:Int):Float;
	@:native("flight_standard_deviation")
	public static function standardDeviation(values:cpp.Star<cpp.Void>, valuesLen:Int):Float;
	@:native("flight_variance")
	public static function variance(values:cpp.Star<cpp.Void>, valuesLen:Int):Float;
	@:native("flight_weighted_average")
	public static function weightedAverage(values:cpp.Star<cpp.Void>, valuesLen:Int, weights:cpp.Star<cpp.Void>, weightsLen:Int):Float;
	@:native("flight_free_random_source")
	public static function freeRandomSource(ptr:flight._cpp.RandomSource):Void;
}
