package flight.esm.types.easing;

#if (js && flight_esm)
typedef EasingFunction = ((t:Float) -> Float);

typedef EasingSegment = { ease:flight.esm.types.easing.Types.EasingFunction, ?weight:Null<Float> };

typedef ScalarRemap = ((x:Float) -> Float);

typedef StepPosition = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
