package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/resource")
extern class Resource {
  public static final ResourceResolutionState:{ Failed:String, Loading:String, Resolved:String, Unresolved:String };
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
