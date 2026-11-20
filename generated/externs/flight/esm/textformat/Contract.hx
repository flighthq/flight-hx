package flight.esm.textformat;

#if (js && flight_esm)
@:jsRequire("@flighthq/textformat/contract")
extern class Contract {
  public static final FontVariationItalic:String;
  public static final FontVariationOpticalSize:String;
  public static final FontVariationSlant:String;
  public static final FontVariationWeight:String;
  public static final FontVariationWidth:String;
  public static final TextFormatRange:Dynamic;
  public static function createTextFormatRange(format:Dynamic, start:Float, end:Float):flight.esm.types.textformat.Types.TextFormatRangeRaw;
  public static function getTextFormatAlignString(value:flight.esm.types.textformat.Types.TextFormatAlign):String;
  public static function getTextFormatAscent(format:flight.esm.types.textformat.Types.TextFormat):Float;
  public static function getTextFormatDescent(format:flight.esm.types.textformat.Types.TextFormat):Float;
  public static function getTextFormatHeight(format:flight.esm.types.textformat.Types.TextFormat):Float;
  public static function getTextFormatLeading(format:flight.esm.types.textformat.Types.TextFormat):Float;
  public static function getTextFormatListMarkerString(value:flight.esm.types.textformat.Types.TextFormatListMarker):String;
  public static function initializeTextFormatRange(out:flight.esm.types.textformat.Types.TextFormatRangeRaw, format:Dynamic, start:Float, end:Float):Void;
  public static function mergeTextFormat(base:flight.esm.types.textformat.Types.TextFormat, override_:flight.esm.types.textformat.Types.TextFormat):flight.esm.types.textformat.Types.TextFormat;
  public static function parseTextFormatAlign(value:String):Null<String>;
  public static function parseTextFormatListMarker(value:String):Null<String>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
