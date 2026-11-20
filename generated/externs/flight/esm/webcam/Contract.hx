package flight.esm.webcam;

#if (js && flight_esm)
@:jsRequire("@flighthq/webcam/contract")
extern class Contract {
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
