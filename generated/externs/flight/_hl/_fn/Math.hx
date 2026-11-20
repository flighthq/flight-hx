package flight._hl._fn;

extern class Math {
	@:hlNative("flight", "flight_deg_to_rad")
	public static function degToRad(degrees:Float):Float;
	@:hlNative("flight", "flight_delta_angle")
	public static function deltaAngle(from:Float, to:Float):Float;
	@:hlNative("flight", "flight_normalize_angle")
	public static function normalizeAngle(radians:Float):Float;
	@:hlNative("flight", "flight_rad_to_deg")
	public static function radToDeg(radians:Float):Float;
	@:hlNative("flight", "flight_clamp")
	public static function clamp(value:Float, min:Float, max:Float):Float;
	@:hlNative("flight", "flight_in_range")
	public static function inRange(value:Float, min:Float, max:Float):Bool;
	@:hlNative("flight", "flight_saturate")
	public static function saturate(value:Float):Float;
	@:hlNative("flight", "flight_approx_equal")
	public static function approxEqual(a:Float, b:Float, epsilon:Float):Bool;
	@:hlNative("flight", "flight_approx_equal_relative")
	public static function approxEqualRelative(a:Float, b:Float, relativeEpsilon:Float):Bool;
	@:hlNative("flight", "flight_approx_zero")
	public static function approxZero(value:Float, epsilon:Float):Bool;
	@:hlNative("flight", "flight_create_random_source_from_hash")
	public static function createRandomSourceFromHash(x:Int, y:Int):flight._hl.RandomSource;
	@:hlNative("flight", "flight_hash_2d")
	public static function hash2d(x:Int, y:Int):Int;
	@:hlNative("flight", "flight_hash_3d")
	public static function hash3d(x:Int, y:Int, z:Int):Int;
	@:hlNative("flight", "flight_hash_combine")
	public static function hashCombine(seed:Int, value:Int):Int;
	@:hlNative("flight", "flight_hash_uint32")
	public static function hashUint32(value:Int):Int;
	@:hlNative("flight", "flight_inverse_lerp")
	public static function inverseLerp(a:Float, b:Float, value:Float):Float;
	@:hlNative("flight", "flight_lerp")
	public static function lerp(a:Float, b:Float, t:Float):Float;
	@:hlNative("flight", "flight_remap")
	public static function remap(value:Float, inMin:Float, inMax:Float, outMin:Float, outMax:Float):Float;
	@:hlNative("flight", "flight_smooth_step")
	public static function smoothStep(edge0:Float, edge1:Float, x:Float):Float;
	@:hlNative("flight", "flight_step")
	public static function step(edge:Float, x:Float):Float;
	@:hlNative("flight", "flight_damp")
	public static function damp(current:Float, target:Float, lambda:Float, deltaTime:Float):Float;
	@:hlNative("flight", "flight_lerp_angle")
	public static function lerpAngle(a:Float, b:Float, t:Float):Float;
	@:hlNative("flight", "flight_move_towards")
	public static function moveTowards(current:Float, target:Float, maxDelta:Float):Float;
	@:hlNative("flight", "flight_ping_pong")
	public static function pingPong(t:Float, length:Float):Float;
	@:hlNative("flight", "flight_repeat")
	public static function repeat(t:Float, length:Float):Float;
	@:hlNative("flight", "flight_smoother_step")
	public static function smootherStep(edge0:Float, edge1:Float, x:Float):Float;
	@:hlNative("flight", "flight_is_power_of_two")
	public static function isPowerOfTwo(n:Int):Bool;
	@:hlNative("flight", "flight_next_multiple_of")
	public static function nextMultipleOf(value:Float, multiple:Float):Float;
	@:hlNative("flight", "flight_next_power_of_two")
	public static function nextPowerOfTwo(n:Int):Int;
	@:hlNative("flight", "flight_previous_power_of_two")
	public static function previousPowerOfTwo(n:Int):Int;
	@:hlNative("flight", "flight_factorial")
	public static function factorial(n:Int):Float;
	@:hlNative("flight", "flight_gcd")
	public static function gcd(a:Int, b:Int):Int;
	@:hlNative("flight", "flight_hypot2")
	public static function hypot2(x:Float, y:Float):Float;
	@:hlNative("flight", "flight_is_even")
	public static function isEven(n:Int):Bool;
	@:hlNative("flight", "flight_is_odd")
	public static function isOdd(n:Int):Bool;
	@:hlNative("flight", "flight_lcm")
	public static function lcm(a:Int, b:Int):Int;
	@:hlNative("flight", "flight_create_random_source")
	public static function createRandomSource(seed:Int):flight._hl.RandomSource;
	@:hlNative("flight", "flight_random_exponential")
	public static function randomExponential(randomFn:hl.Bytes, randomCtx:hl.Bytes, rate:Float):Float;
	@:hlNative("flight", "flight_random_gaussian")
	public static function randomGaussian(randomFn:hl.Bytes, randomCtx:hl.Bytes, mean:Float, standardDeviation:Float):Float;
	@:hlNative("flight", "flight_random_gaussian_pair")
	public static function randomGaussianPair(randomFn:hl.Bytes, randomCtx:hl.Bytes, mean:Float, standardDeviation:Float, out0:hl.Ref<Float>, out1:hl.Ref<Float>):Void;
	@:hlNative("flight", "flight_random_inside_unit_disc")
	public static function randomInsideUnitDisc(out:hl.Bytes, randomFn:hl.Bytes, randomCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_random_inside_unit_sphere")
	public static function randomInsideUnitSphere(out:hl.Bytes, randomFn:hl.Bytes, randomCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_random_on_unit_circle")
	public static function randomOnUnitCircle(out:hl.Bytes, randomFn:hl.Bytes, randomCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_random_on_unit_sphere")
	public static function randomOnUnitSphere(out:hl.Bytes, randomFn:hl.Bytes, randomCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_random_poisson")
	public static function randomPoisson(randomFn:hl.Bytes, randomCtx:hl.Bytes, lambda:Float):Int;
	@:hlNative("flight", "flight_random_weighted")
	public static function randomWeighted(randomFn:hl.Bytes, randomCtx:hl.Bytes, weights:hl.Bytes, weightsLen:Int):Int;
	@:hlNative("flight", "flight_random_bool")
	public static function randomBool(randomFn:hl.Bytes, randomCtx:hl.Bytes, probability:Float):Bool;
	@:hlNative("flight", "flight_random_int")
	public static function randomInt(randomFn:hl.Bytes, randomCtx:hl.Bytes, min:Int, max:Int):Int;
	@:hlNative("flight", "flight_random_range")
	public static function randomRange(randomFn:hl.Bytes, randomCtx:hl.Bytes, min:Float, max:Float):Float;
	@:hlNative("flight", "flight_random_sign")
	public static function randomSign(randomFn:hl.Bytes, randomCtx:hl.Bytes):Float;
	@:hlNative("flight", "flight_ceil_to")
	public static function ceilTo(value:Float, step:Float):Float;
	@:hlNative("flight", "flight_euclidean_mod")
	public static function euclideanMod(value:Float, divisor:Float):Float;
	@:hlNative("flight", "flight_floor_to")
	public static function floorTo(value:Float, step:Float):Float;
	@:hlNative("flight", "flight_fract")
	public static function fract(value:Float):Float;
	@:hlNative("flight", "flight_round_to")
	public static function roundTo(value:Float, step:Float):Float;
	@:hlNative("flight", "flight_ceil_power_of_two")
	public static function ceilPowerOfTwo(n:Int):Int;
	@:hlNative("flight", "flight_floor_power_of_two")
	public static function floorPowerOfTwo(n:Int):Int;
	@:hlNative("flight", "flight_quantize")
	public static function quantize(value:Float, steps:Float, min:Float, max:Float):Float;
	@:hlNative("flight", "flight_sign")
	public static function sign(value:Float):Float;
	@:hlNative("flight", "flight_mean")
	public static function mean(values:hl.Bytes, valuesLen:Int):Float;
	@:hlNative("flight", "flight_median")
	public static function median(values:hl.Bytes, valuesLen:Int):Float;
	@:hlNative("flight", "flight_standard_deviation")
	public static function standardDeviation(values:hl.Bytes, valuesLen:Int):Float;
	@:hlNative("flight", "flight_variance")
	public static function variance(values:hl.Bytes, valuesLen:Int):Float;
	@:hlNative("flight", "flight_weighted_average")
	public static function weightedAverage(values:hl.Bytes, valuesLen:Int, weights:hl.Bytes, weightsLen:Int):Float;
	@:hlNative("flight", "flight_free_random_source")
	public static function freeRandomSource(ptr:flight._hl.RandomSource):Void;
}
