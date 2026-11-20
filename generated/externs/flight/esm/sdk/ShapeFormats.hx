package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/shape-formats")
extern class ShapeFormats {
  public static final defaultShapeCommandSchemas:js.lib.Map<String, flight.esm.types.shape_formats_contract.Types.ShapeCommandSchema<String>>;
  public static function formatShapeJson(shape:flight.esm.types.shape.Types.Shape, ?options:Null<flight.esm.types.shape_formats_contract.Types.ShapeJsonFormatOptions>):String;
  public static function parseShapeJson(text:String, ?options:Null<flight.esm.types.shape_formats_contract.Types.ShapeJsonParseOptions>):Null<flight.esm.types.shape.Types.Shape>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
