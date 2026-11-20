package flight._hl._fn;

extern class Easing {
	@:hlNative("flight", "flight_ease_in_back")
	public static function easeInBack(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_out_back")
	public static function easeInOutBack(t:Single):Single;
	@:hlNative("flight", "flight_ease_out_back")
	public static function easeOutBack(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_bounce")
	public static function easeInBounce(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_out_bounce")
	public static function easeInOutBounce(t:Single):Single;
	@:hlNative("flight", "flight_ease_out_bounce")
	public static function easeOutBounce(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_circular")
	public static function easeInCircular(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_out_circular")
	public static function easeInOutCircular(t:Single):Single;
	@:hlNative("flight", "flight_ease_out_circular")
	public static function easeOutCircular(t:Single):Single;
	@:hlNative("flight", "flight_ease_clamp")
	public static function easeClamp(ease:flight._hl.EasingFunction):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_clamp_output")
	public static function easeClampOutput(ease:flight._hl.EasingFunction, min:Single, max:Single):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_invert")
	public static function easeInvert(ease:flight._hl.EasingFunction):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_mirror")
	public static function easeMirror(easeIn:flight._hl.EasingFunction):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_reverse")
	public static function easeReverse(easeIn:flight._hl.EasingFunction):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_scale_output")
	public static function easeScaleOutput(ease:flight._hl.EasingFunction, fromValue:Single, toValue:Single):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_in_cubic")
	public static function easeInCubic(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_out_cubic")
	public static function easeInOutCubic(t:Single):Single;
	@:hlNative("flight", "flight_ease_out_cubic")
	public static function easeOutCubic(t:Single):Single;
	@:hlNative("flight", "flight_ease_cubic_bezier")
	public static function easeCubicBezier(x1:Single, y1:Single, x2:Single, y2:Single):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_in_damped_sine")
	public static function easeInDampedSine(amplitude:Single, period:Single):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_in_out_damped_sine")
	public static function easeInOutDampedSine(amplitude:Single, period:Single):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_out_damped_sine")
	public static function easeOutDampedSine(amplitude:Single, period:Single):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_in_elastic")
	public static function easeInElastic(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_out_elastic")
	public static function easeInOutElastic(t:Single):Single;
	@:hlNative("flight", "flight_ease_out_elastic")
	public static function easeOutElastic(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_exponential")
	public static function easeInExponential(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_out_exponential")
	public static function easeInOutExponential(t:Single):Single;
	@:hlNative("flight", "flight_ease_out_exponential")
	public static function easeOutExponential(t:Single):Single;
	@:hlNative("flight", "flight_ease_linear")
	public static function easeLinear(t:Single):Single;
	@:hlNative("flight", "flight_ease_piecewise")
	public static function easePiecewise(segments:hl.Bytes, segmentsLen:Int):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_in_out_power")
	public static function easeInOutPower(exponent:Single):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_in_power")
	public static function easeInPower(exponent:Single):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_out_power")
	public static function easeOutPower(exponent:Single):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_ease_in_out_quadratic")
	public static function easeInOutQuadratic(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_quadratic")
	public static function easeInQuadratic(t:Single):Single;
	@:hlNative("flight", "flight_ease_out_quadratic")
	public static function easeOutQuadratic(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_out_quartic")
	public static function easeInOutQuartic(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_quartic")
	public static function easeInQuartic(t:Single):Single;
	@:hlNative("flight", "flight_ease_out_quartic")
	public static function easeOutQuartic(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_out_quintic")
	public static function easeInOutQuintic(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_quintic")
	public static function easeInQuintic(t:Single):Single;
	@:hlNative("flight", "flight_ease_out_quintic")
	public static function easeOutQuintic(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_out_sine")
	public static function easeInOutSine(t:Single):Single;
	@:hlNative("flight", "flight_ease_in_sine")
	public static function easeInSine(t:Single):Single;
	@:hlNative("flight", "flight_ease_out_sine")
	public static function easeOutSine(t:Single):Single;
	@:hlNative("flight", "flight_ease_smootherstep")
	public static function easeSmootherstep(t:Single):Single;
	@:hlNative("flight", "flight_ease_smoothstep")
	public static function easeSmoothstep(t:Single):Single;
	@:hlNative("flight", "flight_ease_smoothstep_range")
	public static function easeSmoothstepRange(edge0:Single, edge1:Single):flight._hl.ScalarRemap;
	@:hlNative("flight", "flight_ease_steps")
	public static function easeSteps(count:Int, position:Int):flight._hl.EasingFunction;
	@:hlNative("flight", "flight_disable_easing_guards")
	public static function disableEasingGuards():Void;
	@:hlNative("flight", "flight_get_easing_derivative")
	public static function getEasingDerivative(easeFn:hl.Bytes, easeCtx:hl.Bytes, t:Single, epsilon:Single):Single;
	@:hlNative("flight", "flight_write_easing_samples")
	public static function writeEasingSamples(out:hl.Bytes, outLen:Int, easeFn:hl.Bytes, easeCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_free_easing_function")
	public static function freeEasingFunction(ptr:flight._hl.EasingFunction):Void;
	@:hlNative("flight", "flight_free_scalar_remap")
	public static function freeScalarRemap(ptr:flight._hl.ScalarRemap):Void;
}
