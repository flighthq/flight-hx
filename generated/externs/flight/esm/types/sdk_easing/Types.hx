package flight.esm.types.sdk_easing;

#if (js && flight_esm)
typedef EasingFunction = flight.esm.types.easing.Types.EasingFunction;

typedef EasingSegment = flight.esm.types.easing.Types.EasingSegment;

typedef ScalarRemap = flight.esm.types.easing.Types.ScalarRemap;

typedef StepPosition = flight.esm.types.easing.Types.StepPosition;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
