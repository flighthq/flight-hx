package flight;

#if (js && flight_esm)
extern inline function easeInBack(t:Float):Float {
	return flight._js._fn.Easing.easeInBack(t);
}
#else
extern inline function easeInBack(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInBack(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInBack(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInBack(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutBack(t:Float):Float {
	return flight._js._fn.Easing.easeInOutBack(t);
}
#else
extern inline function easeInOutBack(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInOutBack(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutBack(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutBack(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutBack(t:Float):Float {
	return flight._js._fn.Easing.easeOutBack(t);
}
#else
extern inline function easeOutBack(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeOutBack(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutBack(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutBack(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInBounce(t:Float):Float {
	return flight._js._fn.Easing.easeInBounce(t);
}
#else
extern inline function easeInBounce(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInBounce(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInBounce(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInBounce(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutBounce(t:Float):Float {
	return flight._js._fn.Easing.easeInOutBounce(t);
}
#else
extern inline function easeInOutBounce(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInOutBounce(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutBounce(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutBounce(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutBounce(t:Float):Float {
	return flight._js._fn.Easing.easeOutBounce(t);
}
#else
extern inline function easeOutBounce(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeOutBounce(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutBounce(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutBounce(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInCircular(t:Float):Float {
	return flight._js._fn.Easing.easeInCircular(t);
}
#else
extern inline function easeInCircular(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInCircular(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInCircular(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInCircular(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutCircular(t:Float):Float {
	return flight._js._fn.Easing.easeInOutCircular(t);
}
#else
extern inline function easeInOutCircular(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInOutCircular(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutCircular(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutCircular(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutCircular(t:Float):Float {
	return flight._js._fn.Easing.easeOutCircular(t);
}
#else
extern inline function easeOutCircular(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeOutCircular(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutCircular(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutCircular(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeClamp(ease:EasingFunction):EasingFunction {
	return flight._js._fn.Easing.easeClamp(ease);
}
#else
extern inline function easeClamp(ease:EasingFunction):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeClamp(ease);
#elseif cpp
	return flight._cpp._fn.Easing.easeClamp(ease);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeClamp(ease);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeClampOutput(ease:EasingFunction, min:Float, max:Float):EasingFunction {
	return flight._js._fn.Easing.easeClampOutput(ease, min, max);
}
#else
extern inline function easeClampOutput(ease:EasingFunction, min:Float, max:Float):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeClampOutput(ease, min, max);
#elseif cpp
	return flight._cpp._fn.Easing.easeClampOutput(ease, min, max);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeClampOutput(ease, min, max);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInvert(ease:EasingFunction):EasingFunction {
	return flight._js._fn.Easing.easeInvert(ease);
}
#else
extern inline function easeInvert(ease:EasingFunction):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeInvert(ease);
#elseif cpp
	return flight._cpp._fn.Easing.easeInvert(ease);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInvert(ease);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeMirror(easeIn:EasingFunction):EasingFunction {
	return flight._js._fn.Easing.easeMirror(easeIn);
}
#else
extern inline function easeMirror(easeIn:EasingFunction):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeMirror(easeIn);
#elseif cpp
	return flight._cpp._fn.Easing.easeMirror(easeIn);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeMirror(easeIn);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeReverse(easeIn:EasingFunction):EasingFunction {
	return flight._js._fn.Easing.easeReverse(easeIn);
}
#else
extern inline function easeReverse(easeIn:EasingFunction):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeReverse(easeIn);
#elseif cpp
	return flight._cpp._fn.Easing.easeReverse(easeIn);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeReverse(easeIn);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeScaleOutput(ease:EasingFunction, fromValue:Float, toValue:Float):EasingFunction {
	return flight._js._fn.Easing.easeScaleOutput(ease, fromValue, toValue);
}
#else
extern inline function easeScaleOutput(ease:EasingFunction, fromValue:Float, toValue:Float):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeScaleOutput(ease, fromValue, toValue);
#elseif cpp
	return flight._cpp._fn.Easing.easeScaleOutput(ease, fromValue, toValue);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeScaleOutput(ease, fromValue, toValue);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInCubic(t:Float):Float {
	return flight._js._fn.Easing.easeInCubic(t);
}
#else
extern inline function easeInCubic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInCubic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInCubic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInCubic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutCubic(t:Float):Float {
	return flight._js._fn.Easing.easeInOutCubic(t);
}
#else
extern inline function easeInOutCubic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInOutCubic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutCubic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutCubic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutCubic(t:Float):Float {
	return flight._js._fn.Easing.easeOutCubic(t);
}
#else
extern inline function easeOutCubic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeOutCubic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutCubic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutCubic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeCubicBezier(x1:Float, y1:Float, x2:Float, y2:Float):EasingFunction {
	return flight._js._fn.Easing.easeCubicBezier(x1, y1, x2, y2);
}
#else
extern inline function easeCubicBezier(x1:Float, y1:Float, x2:Float, y2:Float):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeCubicBezier(x1, y1, x2, y2);
#elseif cpp
	return flight._cpp._fn.Easing.easeCubicBezier(x1, y1, x2, y2);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeCubicBezier(x1, y1, x2, y2);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInDampedSine(amplitude:Float, period:Float):EasingFunction {
	return flight._js._fn.Easing.easeInDampedSine(amplitude, period);
}
#else
extern inline function easeInDampedSine(amplitude:Float, period:Float):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeInDampedSine(amplitude, period);
#elseif cpp
	return flight._cpp._fn.Easing.easeInDampedSine(amplitude, period);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInDampedSine(amplitude, period);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutDampedSine(amplitude:Float, period:Float):EasingFunction {
	return flight._js._fn.Easing.easeInOutDampedSine(amplitude, period);
}
#else
extern inline function easeInOutDampedSine(amplitude:Float, period:Float):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeInOutDampedSine(amplitude, period);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutDampedSine(amplitude, period);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutDampedSine(amplitude, period);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutDampedSine(amplitude:Float, period:Float):EasingFunction {
	return flight._js._fn.Easing.easeOutDampedSine(amplitude, period);
}
#else
extern inline function easeOutDampedSine(amplitude:Float, period:Float):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeOutDampedSine(amplitude, period);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutDampedSine(amplitude, period);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutDampedSine(amplitude, period);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInElastic(t:Float):Float {
	return flight._js._fn.Easing.easeInElastic(t);
}
#else
extern inline function easeInElastic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInElastic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInElastic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInElastic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutElastic(t:Float):Float {
	return flight._js._fn.Easing.easeInOutElastic(t);
}
#else
extern inline function easeInOutElastic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInOutElastic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutElastic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutElastic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutElastic(t:Float):Float {
	return flight._js._fn.Easing.easeOutElastic(t);
}
#else
extern inline function easeOutElastic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeOutElastic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutElastic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutElastic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInExponential(t:Float):Float {
	return flight._js._fn.Easing.easeInExponential(t);
}
#else
extern inline function easeInExponential(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInExponential(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInExponential(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInExponential(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutExponential(t:Float):Float {
	return flight._js._fn.Easing.easeInOutExponential(t);
}
#else
extern inline function easeInOutExponential(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInOutExponential(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutExponential(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutExponential(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutExponential(t:Float):Float {
	return flight._js._fn.Easing.easeOutExponential(t);
}
#else
extern inline function easeOutExponential(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeOutExponential(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutExponential(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutExponential(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeLinear(t:Float):Float {
	return flight._js._fn.Easing.easeLinear(t);
}
#else
extern inline function easeLinear(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeLinear(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeLinear(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeLinear(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easePiecewise(segments:Dynamic):EasingFunction {
	return flight._js._fn.Easing.easePiecewise(segments);
}
#else
extern inline function easePiecewise(segments:Dynamic, segmentsLen:Int):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easePiecewise(segments, segmentsLen);
#elseif cpp
	return flight._cpp._fn.Easing.easePiecewise(segments, segmentsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easePiecewise(segments, segmentsLen);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutPower(exponent:Float):EasingFunction {
	return flight._js._fn.Easing.easeInOutPower(exponent);
}
#else
extern inline function easeInOutPower(exponent:Float):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeInOutPower(exponent);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutPower(exponent);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutPower(exponent);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInPower(exponent:Float):EasingFunction {
	return flight._js._fn.Easing.easeInPower(exponent);
}
#else
extern inline function easeInPower(exponent:Float):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeInPower(exponent);
#elseif cpp
	return flight._cpp._fn.Easing.easeInPower(exponent);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInPower(exponent);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutPower(exponent:Float):EasingFunction {
	return flight._js._fn.Easing.easeOutPower(exponent);
}
#else
extern inline function easeOutPower(exponent:Float):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeOutPower(exponent);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutPower(exponent);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutPower(exponent);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutQuadratic(t:Float):Float {
	return flight._js._fn.Easing.easeInOutQuadratic(t);
}
#else
extern inline function easeInOutQuadratic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInOutQuadratic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutQuadratic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutQuadratic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInQuadratic(t:Float):Float {
	return flight._js._fn.Easing.easeInQuadratic(t);
}
#else
extern inline function easeInQuadratic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInQuadratic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInQuadratic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInQuadratic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutQuadratic(t:Float):Float {
	return flight._js._fn.Easing.easeOutQuadratic(t);
}
#else
extern inline function easeOutQuadratic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeOutQuadratic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutQuadratic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutQuadratic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutQuartic(t:Float):Float {
	return flight._js._fn.Easing.easeInOutQuartic(t);
}
#else
extern inline function easeInOutQuartic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInOutQuartic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutQuartic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutQuartic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInQuartic(t:Float):Float {
	return flight._js._fn.Easing.easeInQuartic(t);
}
#else
extern inline function easeInQuartic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInQuartic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInQuartic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInQuartic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutQuartic(t:Float):Float {
	return flight._js._fn.Easing.easeOutQuartic(t);
}
#else
extern inline function easeOutQuartic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeOutQuartic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutQuartic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutQuartic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutQuintic(t:Float):Float {
	return flight._js._fn.Easing.easeInOutQuintic(t);
}
#else
extern inline function easeInOutQuintic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInOutQuintic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutQuintic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutQuintic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInQuintic(t:Float):Float {
	return flight._js._fn.Easing.easeInQuintic(t);
}
#else
extern inline function easeInQuintic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInQuintic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInQuintic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInQuintic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutQuintic(t:Float):Float {
	return flight._js._fn.Easing.easeOutQuintic(t);
}
#else
extern inline function easeOutQuintic(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeOutQuintic(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutQuintic(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutQuintic(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInOutSine(t:Float):Float {
	return flight._js._fn.Easing.easeInOutSine(t);
}
#else
extern inline function easeInOutSine(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInOutSine(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInOutSine(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInOutSine(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeInSine(t:Float):Float {
	return flight._js._fn.Easing.easeInSine(t);
}
#else
extern inline function easeInSine(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeInSine(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeInSine(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeInSine(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeOutSine(t:Float):Float {
	return flight._js._fn.Easing.easeOutSine(t);
}
#else
extern inline function easeOutSine(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeOutSine(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeOutSine(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeOutSine(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeSmootherstep(t:Float):Float {
	return flight._js._fn.Easing.easeSmootherstep(t);
}
#else
extern inline function easeSmootherstep(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeSmootherstep(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeSmootherstep(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeSmootherstep(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeSmoothstep(t:Float):Float {
	return flight._js._fn.Easing.easeSmoothstep(t);
}
#else
extern inline function easeSmoothstep(t:Float):Float {
#if hl
	return flight._hl._fn.Easing.easeSmoothstep(t);
#elseif cpp
	return flight._cpp._fn.Easing.easeSmoothstep(t);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeSmoothstep(t);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeSmoothstepRange(edge0:Float, edge1:Float):ScalarRemap {
	return flight._js._fn.Easing.easeSmoothstepRange(edge0, edge1);
}
#else
extern inline function easeSmoothstepRange(edge0:Float, edge1:Float):ScalarRemap {
#if hl
	return flight._hl._fn.Easing.easeSmoothstepRange(edge0, edge1);
#elseif cpp
	return flight._cpp._fn.Easing.easeSmoothstepRange(edge0, edge1);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeSmoothstepRange(edge0, edge1);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function easeSteps(count:Int, position:Null<Dynamic>):EasingFunction {
	return flight._js._fn.Easing.easeSteps(count, position);
}
#else
extern inline function easeSteps(count:Int, position:Int):EasingFunction {
#if hl
	return flight._hl._fn.Easing.easeSteps(count, position);
#elseif cpp
	return flight._cpp._fn.Easing.easeSteps(count, position);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.easeSteps(count, position);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableEasingGuards():Void {
	flight._js._fn.Easing.disableEasingGuards();
}
#else
extern inline function disableEasingGuards():Void {
#if hl
	flight._hl._fn.Easing.disableEasingGuards();
#elseif cpp
	flight._cpp._fn.Easing.disableEasingGuards();
#elseif (js && flight_esm)
	flight._js._fn.Easing.disableEasingGuards();
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableEasingGuards(logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.Easing.enableEasingGuards(logState, clock);
}
#else
extern inline function enableEasingGuards(logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Easing.enableEasingGuards(logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.Easing.enableEasingGuards(logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.Easing.enableEasingGuards(logState, clockFn, clockCtx);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getEasingDerivative(ease:Dynamic, t:Float, epsilon:Null<Float>):Float {
	return flight._js._fn.Easing.getEasingDerivative(ease, t, epsilon);
}
#else
extern inline function getEasingDerivative(easeFn:Dynamic, easeCtx:Dynamic, t:Float, epsilon:Float):Float {
#if hl
	return flight._hl._fn.Easing.getEasingDerivative(easeFn, easeCtx, t, epsilon);
#elseif cpp
	return flight._cpp._fn.Easing.getEasingDerivative(easeFn, easeCtx, t, epsilon);
#elseif (js && flight_esm)
	return flight._js._fn.Easing.getEasingDerivative(easeFn, easeCtx, t, epsilon);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writeEasingSamples(out:Dynamic, ease:Dynamic):Void {
	flight._js._fn.Easing.writeEasingSamples(out, ease);
}
#else
extern inline function writeEasingSamples(out:Dynamic, outLen:Int, easeFn:Dynamic, easeCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Easing.writeEasingSamples(out, outLen, easeFn, easeCtx);
#elseif cpp
	flight._cpp._fn.Easing.writeEasingSamples(out, outLen, easeFn, easeCtx);
#elseif (js && flight_esm)
	flight._js._fn.Easing.writeEasingSamples(out, outLen, easeFn, easeCtx);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeEasingFunction(ptr:EasingFunction):Void {
	flight._js._fn.Easing.freeEasingFunction(ptr);
}
#else
extern inline function freeEasingFunction(ptr:EasingFunction):Void {
#if hl
	flight._hl._fn.Easing.freeEasingFunction(ptr);
#elseif cpp
	flight._cpp._fn.Easing.freeEasingFunction(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Easing.freeEasingFunction(ptr);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScalarRemap(ptr:ScalarRemap):Void {
	flight._js._fn.Easing.freeScalarRemap(ptr);
}
#else
extern inline function freeScalarRemap(ptr:ScalarRemap):Void {
#if hl
	flight._hl._fn.Easing.freeScalarRemap(ptr);
#elseif cpp
	flight._cpp._fn.Easing.freeScalarRemap(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Easing.freeScalarRemap(ptr);
#else
	#error "flight.Easing: no backend for this target."
#end
}
#end
