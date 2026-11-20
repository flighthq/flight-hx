package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/resource")
extern class Resource {
  public static final ResourceResolutionState:Dynamic;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
