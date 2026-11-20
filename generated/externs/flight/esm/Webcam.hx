package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/webcam")
extern class Webcam {
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
