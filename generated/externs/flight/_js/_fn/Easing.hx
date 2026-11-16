package flight._js._fn;

@:jsRequire("@flighthq/easing")
extern class Easing {
	@:native("easeInBack")
	public static function easeInBack(t:Float):Float;
	@:native("easeInOutBack")
	public static function easeInOutBack(t:Float):Float;
	@:native("easeOutBack")
	public static function easeOutBack(t:Float):Float;
	@:native("easeInBounce")
	public static function easeInBounce(t:Float):Float;
	@:native("easeInOutBounce")
	public static function easeInOutBounce(t:Float):Float;
	@:native("easeOutBounce")
	public static function easeOutBounce(t:Float):Float;
	@:native("easeInCircular")
	public static function easeInCircular(t:Float):Float;
	@:native("easeInOutCircular")
	public static function easeInOutCircular(t:Float):Float;
	@:native("easeOutCircular")
	public static function easeOutCircular(t:Float):Float;
	@:native("easeClamp")
	public static function easeClamp(ease:flight._js.EasingFunction):flight._js.EasingFunction;
	@:native("easeClampOutput")
	public static function easeClampOutput(ease:flight._js.EasingFunction, min:Float, max:Float):flight._js.EasingFunction;
	@:native("easeInvert")
	public static function easeInvert(ease:flight._js.EasingFunction):flight._js.EasingFunction;
	@:native("easeMirror")
	public static function easeMirror(easeIn:flight._js.EasingFunction):flight._js.EasingFunction;
	@:native("easeReverse")
	public static function easeReverse(easeIn:flight._js.EasingFunction):flight._js.EasingFunction;
	@:native("easeScaleOutput")
	public static function easeScaleOutput(ease:flight._js.EasingFunction, fromValue:Float, toValue:Float):flight._js.EasingFunction;
	@:native("easeInCubic")
	public static function easeInCubic(t:Float):Float;
	@:native("easeInOutCubic")
	public static function easeInOutCubic(t:Float):Float;
	@:native("easeOutCubic")
	public static function easeOutCubic(t:Float):Float;
	@:native("easeCubicBezier")
	public static function easeCubicBezier(x1:Float, y1:Float, x2:Float, y2:Float):flight._js.EasingFunction;
	@:native("easeInDampedSine")
	public static function easeInDampedSine(amplitude:Float, period:Float):flight._js.EasingFunction;
	@:native("easeInOutDampedSine")
	public static function easeInOutDampedSine(amplitude:Float, period:Float):flight._js.EasingFunction;
	@:native("easeOutDampedSine")
	public static function easeOutDampedSine(amplitude:Float, period:Float):flight._js.EasingFunction;
	@:native("easeInElastic")
	public static function easeInElastic(t:Float):Float;
	@:native("easeInOutElastic")
	public static function easeInOutElastic(t:Float):Float;
	@:native("easeOutElastic")
	public static function easeOutElastic(t:Float):Float;
	@:native("easeInExponential")
	public static function easeInExponential(t:Float):Float;
	@:native("easeInOutExponential")
	public static function easeInOutExponential(t:Float):Float;
	@:native("easeOutExponential")
	public static function easeOutExponential(t:Float):Float;
	@:native("easeLinear")
	public static function easeLinear(t:Float):Float;
	@:native("easePiecewise")
	public static function easePiecewise(segments:Dynamic):flight._js.EasingFunction;
	@:native("easeInOutPower")
	public static function easeInOutPower(exponent:Float):flight._js.EasingFunction;
	@:native("easeInPower")
	public static function easeInPower(exponent:Float):flight._js.EasingFunction;
	@:native("easeOutPower")
	public static function easeOutPower(exponent:Float):flight._js.EasingFunction;
	@:native("easeInOutQuadratic")
	public static function easeInOutQuadratic(t:Float):Float;
	@:native("easeInQuadratic")
	public static function easeInQuadratic(t:Float):Float;
	@:native("easeOutQuadratic")
	public static function easeOutQuadratic(t:Float):Float;
	@:native("easeInOutQuartic")
	public static function easeInOutQuartic(t:Float):Float;
	@:native("easeInQuartic")
	public static function easeInQuartic(t:Float):Float;
	@:native("easeOutQuartic")
	public static function easeOutQuartic(t:Float):Float;
	@:native("easeInOutQuintic")
	public static function easeInOutQuintic(t:Float):Float;
	@:native("easeInQuintic")
	public static function easeInQuintic(t:Float):Float;
	@:native("easeOutQuintic")
	public static function easeOutQuintic(t:Float):Float;
	@:native("easeInOutSine")
	public static function easeInOutSine(t:Float):Float;
	@:native("easeInSine")
	public static function easeInSine(t:Float):Float;
	@:native("easeOutSine")
	public static function easeOutSine(t:Float):Float;
	@:native("easeSmootherstep")
	public static function easeSmootherstep(t:Float):Float;
	@:native("easeSmoothstep")
	public static function easeSmoothstep(t:Float):Float;
	@:native("easeSmoothstepRange")
	public static function easeSmoothstepRange(edge0:Float, edge1:Float):flight._js.ScalarRemap;
	@:native("easeSteps")
	public static function easeSteps(count:Int, position:Null<Dynamic>):flight._js.EasingFunction;
	@:native("disableEasingGuards")
	public static function disableEasingGuards():Void;
	@:native("enableEasingGuards")
	public static function enableEasingGuards(logState:Dynamic, clock:Dynamic):Void;
	@:native("getEasingDerivative")
	public static function getEasingDerivative(ease:Dynamic, t:Float, epsilon:Null<Float>):Float;
	@:native("writeEasingSamples")
	public static function writeEasingSamples(out:Dynamic, ease:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeEasingFunction(ptr:flight._js.EasingFunction):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScalarRemap(ptr:flight._js.ScalarRemap):Void {}
}
