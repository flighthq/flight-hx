package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/webcam")
extern class Webcam {
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
