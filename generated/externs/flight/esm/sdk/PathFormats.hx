package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/path-formats")
extern class PathFormats {
  public static function appendSvgPathData(path:flight.esm.types.path_contract.Types.PathRaw, d:String):Bool;
  public static function explainSvgPathData(d:String):Null<flight.esm.types.path_formats.Types.SvgPathDataExplanation>;
  public static function formatSvgPathData(path:flight.esm.types.path_contract.Types.PathRaw, ?options:Null<flight.esm.types.path_formats.Types.SvgPathDataFormatOptions>):String;
  public static function parseSvgPathData(d:String):Null<flight.esm.types.path_contract.Types.PathRaw>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
