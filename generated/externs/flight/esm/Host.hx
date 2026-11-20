package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/host")
extern class Host {
  public static function explainHostCapabilitySlot(capability:String, group:String, slot:String, isPresent:Bool, consequence:String, fix:String, backends:Array<flight.esm.types.host.Types.HostCapabilityBackend>):flight.esm.types.host.Types.HostCapabilityExplanation;
  public static function getBackendExplanationLayerString(value:flight.esm.types.host.Types.BackendExplanationLayer):String;
  public static function getBackendExplanationViabilityString(value:flight.esm.types.host.Types.BackendExplanationViability):String;
  public static function getBackendOperationExplanationLayerString(value:flight.esm.types.host.Types.BackendOperationExplanationLayer):String;
  public static function parseBackendExplanationLayer(value:String):Null<String>;
  public static function parseBackendExplanationViability(value:String):Null<String>;
  public static function parseBackendOperationExplanationLayer(value:String):Null<String>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
