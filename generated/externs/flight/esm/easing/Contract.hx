package flight.esm.easing;

#if (js && flight_esm)
@:jsRequire("@flighthq/easing/contract")
extern class Contract {
  public static final DEFAULT_EASING_DERIVATIVE_EPSILON:Float;
  public static function disableEasingGuards():Void;
  public static function easeClamp(ease:flight.esm.types.easing.Types.EasingFunction):flight.esm.types.easing.Types.EasingFunction;
  public static function easeClampOutput(ease:flight.esm.types.easing.Types.EasingFunction, min:Float, max:Float):flight.esm.types.easing.Types.EasingFunction;
  public static function easeCubicBezier(x1:Float, y1:Float, x2:Float, y2:Float):flight.esm.types.easing.Types.EasingFunction;
  public static function easeInBack(t:Float):Float;
  public static function easeInBounce(t:Float):Float;
  public static function easeInCircular(t:Float):Float;
  public static function easeInCubic(t:Float):Float;
  public static function easeInDampedSine(amplitude:Float, period:Float):flight.esm.types.easing.Types.EasingFunction;
  public static function easeInElastic(t:Float):Float;
  public static function easeInExponential(t:Float):Float;
  public static function easeInOutBack(t:Float):Float;
  public static function easeInOutBounce(t:Float):Float;
  public static function easeInOutCircular(t:Float):Float;
  public static function easeInOutCubic(t:Float):Float;
  public static function easeInOutDampedSine(amplitude:Float, period:Float):flight.esm.types.easing.Types.EasingFunction;
  public static function easeInOutElastic(t:Float):Float;
  public static function easeInOutExponential(t:Float):Float;
  public static function easeInOutPower(exponent:Float):flight.esm.types.easing.Types.EasingFunction;
  public static function easeInOutQuadratic(t:Float):Float;
  public static function easeInOutQuartic(t:Float):Float;
  public static function easeInOutQuintic(t:Float):Float;
  public static function easeInOutSine(t:Float):Float;
  public static function easeInPower(exponent:Float):flight.esm.types.easing.Types.EasingFunction;
  public static function easeInQuadratic(t:Float):Float;
  public static function easeInQuartic(t:Float):Float;
  public static function easeInQuintic(t:Float):Float;
  public static function easeInSine(t:Float):Float;
  public static function easeInvert(ease:flight.esm.types.easing.Types.EasingFunction):flight.esm.types.easing.Types.EasingFunction;
  public static function easeLinear(t:Float):Float;
  public static function easeMirror(easeIn:flight.esm.types.easing.Types.EasingFunction):flight.esm.types.easing.Types.EasingFunction;
  public static function easeOutBack(t:Float):Float;
  public static function easeOutBounce(t:Float):Float;
  public static function easeOutCircular(t:Float):Float;
  public static function easeOutCubic(t:Float):Float;
  public static function easeOutDampedSine(amplitude:Float, period:Float):flight.esm.types.easing.Types.EasingFunction;
  public static function easeOutElastic(t:Float):Float;
  public static function easeOutExponential(t:Float):Float;
  public static function easeOutPower(exponent:Float):flight.esm.types.easing.Types.EasingFunction;
  public static function easeOutQuadratic(t:Float):Float;
  public static function easeOutQuartic(t:Float):Float;
  public static function easeOutQuintic(t:Float):Float;
  public static function easeOutSine(t:Float):Float;
  public static function easePiecewise(segments:Array<flight.esm.types.easing.Types.EasingSegment>):flight.esm.types.easing.Types.EasingFunction;
  public static function easeReverse(easeIn:flight.esm.types.easing.Types.EasingFunction):flight.esm.types.easing.Types.EasingFunction;
  public static function easeScaleOutput(ease:flight.esm.types.easing.Types.EasingFunction, fromValue:Float, toValue:Float):flight.esm.types.easing.Types.EasingFunction;
  public static function easeSmootherstep(t:Float):Float;
  public static function easeSmoothstep(t:Float):Float;
  public static function easeSmoothstepRange(edge0:Float, edge1:Float):flight.esm.types.easing.Types.ScalarRemap;
  public static function easeSteps(count:Float, ?position:Null<String>):flight.esm.types.easing.Types.EasingFunction;
  public static function enableEasingGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function getEasingDerivative(ease:flight.esm.types.easing.Types.EasingFunction, t:Float, ?epsilon:Null<Float>):Float;
  public static function getStepPositionString(value:flight.esm.types.easing.Types.StepPosition):String;
  public static function parseStepPosition(value:String):Null<String>;
  public static function setEasingStepsGuard(guard:Null<flight.esm.types.easing_contract.Types.EasingStepsGuard>):Void;
  public static function writeEasingSamples(out:js.lib.Float32Array, ease:flight.esm.types.easing.Types.EasingFunction):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
