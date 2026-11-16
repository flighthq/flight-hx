package flight._js._fn;

@:jsRequire("@flighthq/math")
extern class Math {
	@:native("degToRad")
	public static function degToRad(degrees:Float):Float;
	@:native("deltaAngle")
	public static function deltaAngle(from:Float, to:Float):Float;
	@:native("normalizeAngle")
	public static function normalizeAngle(radians:Float):Float;
	@:native("radToDeg")
	public static function radToDeg(radians:Float):Float;
	@:native("clamp")
	public static function clamp(value:Float, min:Float, max:Float):Float;
	@:native("inRange")
	public static function inRange(value:Float, min:Float, max:Float):Bool;
	@:native("saturate")
	public static function saturate(value:Float):Float;
	@:native("approxEqual")
	public static function approxEqual(a:Float, b:Float, epsilon:Null<Float>):Bool;
	@:native("approxEqualRelative")
	public static function approxEqualRelative(a:Float, b:Float, relativeEpsilon:Null<Float>):Bool;
	@:native("approxZero")
	public static function approxZero(value:Float, epsilon:Null<Float>):Bool;
	@:native("createRandomSourceFromHash")
	public static function createRandomSourceFromHash(x:Int, y:Int):flight._js.RandomSource;
	@:native("hash2D")
	public static function hash2d(x:Int, y:Int):Int;
	@:native("hash3D")
	public static function hash3d(x:Int, y:Int, z:Int):Int;
	@:native("hashCombine")
	public static function hashCombine(seed:Int, value:Int):Int;
	@:native("hashUint32")
	public static function hashUint32(value:Int):Int;
	@:native("inverseLerp")
	public static function inverseLerp(a:Float, b:Float, value:Float):Float;
	@:native("lerp")
	public static function lerp(a:Float, b:Float, t:Float):Float;
	@:native("remap")
	public static function remap(value:Float, inMin:Float, inMax:Float, outMin:Float, outMax:Float):Float;
	@:native("smoothStep")
	public static function smoothStep(edge0:Float, edge1:Float, x:Float):Float;
	@:native("step")
	public static function step(edge:Float, x:Float):Float;
	@:native("damp")
	public static function damp(current:Float, target:Float, lambda:Float, deltaTime:Float):Float;
	@:native("lerpAngle")
	public static function lerpAngle(a:Float, b:Float, t:Float):Float;
	@:native("moveTowards")
	public static function moveTowards(current:Float, target:Float, maxDelta:Float):Float;
	@:native("pingPong")
	public static function pingPong(t:Float, length:Float):Float;
	@:native("repeat")
	public static function repeat(t:Float, length:Float):Float;
	@:native("smootherStep")
	public static function smootherStep(edge0:Float, edge1:Float, x:Float):Float;
	@:native("isPowerOfTwo")
	public static function isPowerOfTwo(n:Int):Bool;
	@:native("nextMultipleOf")
	public static function nextMultipleOf(value:Float, multiple:Float):Float;
	@:native("nextPowerOfTwo")
	public static function nextPowerOfTwo(n:Int):Int;
	@:native("previousPowerOfTwo")
	public static function previousPowerOfTwo(n:Int):Int;
	@:native("factorial")
	public static function factorial(n:Int):Float;
	@:native("gcd")
	public static function gcd(a:Int, b:Int):Int;
	@:native("hypot2")
	public static function hypot2(x:Float, y:Float):Float;
	@:native("isEven")
	public static function isEven(n:Int):Bool;
	@:native("isOdd")
	public static function isOdd(n:Int):Bool;
	@:native("lcm")
	public static function lcm(a:Int, b:Int):Int;
	@:native("createRandomSource")
	public static function createRandomSource(seed:Int):flight._js.RandomSource;
	@:native("randomExponential")
	public static function randomExponential(random:Dynamic, rate:Null<Float>):Float;
	@:native("randomGaussian")
	public static function randomGaussian(random:Dynamic, mean:Null<Float>, standardDeviation:Null<Float>):Float;
	@:native("randomInsideUnitDisc")
	public static function randomInsideUnitDisc(out:Dynamic, random:Dynamic):Void;
	@:native("randomInsideUnitSphere")
	public static function randomInsideUnitSphere(out:Dynamic, random:Dynamic):Void;
	@:native("randomOnUnitCircle")
	public static function randomOnUnitCircle(out:Dynamic, random:Dynamic):Void;
	@:native("randomOnUnitSphere")
	public static function randomOnUnitSphere(out:Dynamic, random:Dynamic):Void;
	@:native("randomPoisson")
	public static function randomPoisson(random:Dynamic, lambda:Null<Float>):Int;
	@:native("randomWeighted")
	public static function randomWeighted(random:Dynamic, weights:Dynamic):Int;
	@:native("randomBool")
	public static function randomBool(random:Dynamic, probability:Null<Float>):Bool;
	@:native("randomInt")
	public static function randomInt(random:Dynamic, min:Int, max:Int):Int;
	@:native("randomRange")
	public static function randomRange(random:Dynamic, min:Float, max:Float):Float;
	@:native("randomSign")
	public static function randomSign(random:Dynamic):Float;
	@:native("ceilTo")
	public static function ceilTo(value:Float, step:Float):Float;
	@:native("euclideanMod")
	public static function euclideanMod(value:Float, divisor:Float):Float;
	@:native("floorTo")
	public static function floorTo(value:Float, step:Float):Float;
	@:native("fract")
	public static function fract(value:Float):Float;
	@:native("roundTo")
	public static function roundTo(value:Float, step:Float):Float;
	@:native("ceilPowerOfTwo")
	public static function ceilPowerOfTwo(n:Int):Int;
	@:native("floorPowerOfTwo")
	public static function floorPowerOfTwo(n:Int):Int;
	@:native("quantize")
	public static function quantize(value:Float, steps:Float, min:Float, max:Float):Float;
	@:native("sign")
	public static function sign(value:Float):Float;
	@:native("mean")
	public static function mean(values:Dynamic):Float;
	@:native("median")
	public static function median(values:Dynamic):Float;
	@:native("standardDeviation")
	public static function standardDeviation(values:Dynamic):Float;
	@:native("variance")
	public static function variance(values:Dynamic):Float;
	@:native("weightedAverage")
	public static function weightedAverage(values:Dynamic, weights:Dynamic):Float;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRandomSource(ptr:flight._js.RandomSource):Void {}
}
