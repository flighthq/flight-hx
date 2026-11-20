package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/net")
extern class Net {
  public static final NetFormContentType:String;
  public static function areNetGuardsEnabled():Bool;
  public static function disableNetGuards():Void;
  public static function enableNetGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainNetResponse(response:flight.esm.types.net.Types.NetResponse):Null<flight.esm.types.net.Types.NetResponseExplanation>;
  public static function formatNetFormBody(fields:Dynamic):String;
  public static function sendNetRequest(hostNet:flight.esm.types.net.Types.HostNetCapability, request:flight.esm.types.net.Types.NetRequest, ?options:Null<flight.esm.types.net.Types.NetRequestOptions>):js.lib.Promise<flight.esm.types.net.Types.NetResponse>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
