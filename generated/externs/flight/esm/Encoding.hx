package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/encoding")
extern class Encoding {
  public static function decodeUTF8(bytes:js.lib.Uint8Array, ?offset:Null<Float>, ?length:Null<Float>):String;
  public static function encodeUTF8(text:String):js.lib.Uint8Array;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
