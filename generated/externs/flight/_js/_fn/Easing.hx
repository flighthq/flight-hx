package flight._js._fn;

@:jsRequire("flight")
extern class Easing {
	@:native("flight_ease_in_back")
	public static function easeInBack(t:Float):Float;
	@:native("flight_ease_in_out_back")
	public static function easeInOutBack(t:Float):Float;
	@:native("flight_ease_out_back")
	public static function easeOutBack(t:Float):Float;
	@:native("flight_ease_in_bounce")
	public static function easeInBounce(t:Float):Float;
	@:native("flight_ease_in_out_bounce")
	public static function easeInOutBounce(t:Float):Float;
	@:native("flight_ease_out_bounce")
	public static function easeOutBounce(t:Float):Float;
	@:native("flight_ease_in_circular")
	public static function easeInCircular(t:Float):Float;
	@:native("flight_ease_in_out_circular")
	public static function easeInOutCircular(t:Float):Float;
	@:native("flight_ease_out_circular")
	public static function easeOutCircular(t:Float):Float;
	@:native("flight_ease_clamp")
	public static function easeClamp(ease:flight._js.EasingFunction):flight._js.EasingFunction;
	@:native("flight_ease_clamp_output")
	public static function easeClampOutput(ease:flight._js.EasingFunction, min:Float, max:Float):flight._js.EasingFunction;
	@:native("flight_ease_invert")
	public static function easeInvert(ease:flight._js.EasingFunction):flight._js.EasingFunction;
	@:native("flight_ease_mirror")
	public static function easeMirror(easeIn:flight._js.EasingFunction):flight._js.EasingFunction;
	@:native("flight_ease_reverse")
	public static function easeReverse(easeIn:flight._js.EasingFunction):flight._js.EasingFunction;
	@:native("flight_ease_scale_output")
	public static function easeScaleOutput(ease:flight._js.EasingFunction, fromValue:Float, toValue:Float):flight._js.EasingFunction;
	@:native("flight_ease_in_cubic")
	public static function easeInCubic(t:Float):Float;
	@:native("flight_ease_in_out_cubic")
	public static function easeInOutCubic(t:Float):Float;
	@:native("flight_ease_out_cubic")
	public static function easeOutCubic(t:Float):Float;
	@:native("flight_ease_cubic_bezier")
	public static function easeCubicBezier(x1:Float, y1:Float, x2:Float, y2:Float):flight._js.EasingFunction;
	@:native("flight_ease_in_damped_sine")
	public static function easeInDampedSine(amplitude:Float, period:Float):flight._js.EasingFunction;
	@:native("flight_ease_in_out_damped_sine")
	public static function easeInOutDampedSine(amplitude:Float, period:Float):flight._js.EasingFunction;
	@:native("flight_ease_out_damped_sine")
	public static function easeOutDampedSine(amplitude:Float, period:Float):flight._js.EasingFunction;
	@:native("flight_ease_in_elastic")
	public static function easeInElastic(t:Float):Float;
	@:native("flight_ease_in_out_elastic")
	public static function easeInOutElastic(t:Float):Float;
	@:native("flight_ease_out_elastic")
	public static function easeOutElastic(t:Float):Float;
	@:native("flight_ease_in_exponential")
	public static function easeInExponential(t:Float):Float;
	@:native("flight_ease_in_out_exponential")
	public static function easeInOutExponential(t:Float):Float;
	@:native("flight_ease_out_exponential")
	public static function easeOutExponential(t:Float):Float;
	@:native("flight_ease_linear")
	public static function easeLinear(t:Float):Float;
	@:native("flight_ease_piecewise")
	public static function easePiecewise(segments:Dynamic, segmentsLen:Int):flight._js.EasingFunction;
	@:native("flight_ease_in_out_power")
	public static function easeInOutPower(exponent:Float):flight._js.EasingFunction;
	@:native("flight_ease_in_power")
	public static function easeInPower(exponent:Float):flight._js.EasingFunction;
	@:native("flight_ease_out_power")
	public static function easeOutPower(exponent:Float):flight._js.EasingFunction;
	@:native("flight_ease_in_out_quadratic")
	public static function easeInOutQuadratic(t:Float):Float;
	@:native("flight_ease_in_quadratic")
	public static function easeInQuadratic(t:Float):Float;
	@:native("flight_ease_out_quadratic")
	public static function easeOutQuadratic(t:Float):Float;
	@:native("flight_ease_in_out_quartic")
	public static function easeInOutQuartic(t:Float):Float;
	@:native("flight_ease_in_quartic")
	public static function easeInQuartic(t:Float):Float;
	@:native("flight_ease_out_quartic")
	public static function easeOutQuartic(t:Float):Float;
	@:native("flight_ease_in_out_quintic")
	public static function easeInOutQuintic(t:Float):Float;
	@:native("flight_ease_in_quintic")
	public static function easeInQuintic(t:Float):Float;
	@:native("flight_ease_out_quintic")
	public static function easeOutQuintic(t:Float):Float;
	@:native("flight_ease_in_out_sine")
	public static function easeInOutSine(t:Float):Float;
	@:native("flight_ease_in_sine")
	public static function easeInSine(t:Float):Float;
	@:native("flight_ease_out_sine")
	public static function easeOutSine(t:Float):Float;
	@:native("flight_ease_smootherstep")
	public static function easeSmootherstep(t:Float):Float;
	@:native("flight_ease_smoothstep")
	public static function easeSmoothstep(t:Float):Float;
	@:native("flight_ease_smoothstep_range")
	public static function easeSmoothstepRange(edge0:Float, edge1:Float):flight._js.ScalarRemap;
	@:native("flight_ease_steps")
	public static function easeSteps(count:Int, position:Int):flight._js.EasingFunction;
	@:native("flight_disable_easing_guards")
	public static function disableEasingGuards():Void;
	@:native("flight_enable_easing_guards")
	public static function enableEasingGuards(logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:native("flight_get_easing_derivative")
	public static function getEasingDerivative(easeFn:Dynamic, easeCtx:Dynamic):Float;
	@:native("flight_write_easing_samples")
	public static function writeEasingSamples(out:Dynamic, outLen:Int, easeFn:Dynamic, easeCtx:Dynamic):Void;
	@:native("flight_free_easing_function")
	public static function freeEasingFunction(ptr:flight._js.EasingFunction):Void;
	@:native("flight_free_scalar_remap")
	public static function freeScalarRemap(ptr:flight._js.ScalarRemap):Void;
}
