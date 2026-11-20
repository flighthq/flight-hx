package flight.esm.resource;

#if (js && flight_esm)
@:jsRequire("@flighthq/resource/contract")
extern class Contract {
  public static final ResourceResolutionState:Dynamic;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
