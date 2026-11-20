package flight.esm.types.textformat;

#if (js && flight_esm)
typedef FontVariation = { axis:String, value:Float };

typedef TextFormat = { ?align:Null<String>, ?blockIndent:Null<Float>, ?bold:Null<Bool>, ?bullet:Null<Bool>, ?color:Null<Float>, ?font:Null<String>, ?indent:Null<Float>, ?italic:Null<Bool>, ?kerning:Null<Bool>, ?leading:Null<Float>, ?leftMargin:Null<Float>, ?letterSpacing:Null<Float>, ?listMarker:Null<String>, ?rightMargin:Null<Float>, ?size:Null<Float>, ?strikethrough:Null<Bool>, ?tabStops:Null<Array<Float>>, ?target:Null<String>, ?underline:Null<Bool>, ?url:Null<String>, ?variations:Null<Array<flight.esm.types.textformat.Types.FontVariation>> };

typedef TextFormatAlign = String;

typedef TextFormatListMarker = String;

@:jsRequire("@flighthq/textformat", "TextFormatRange")
extern class TextFormatRange {
  @:overload(function(format:Dynamic, start:Float, end:Float):Void {})
  public function new();
  public final raw:Dynamic;
  public final format:Dynamic;
  public final start:Float;
  public final end:Float;
  @:overload(function(format:Dynamic, start:Float, end:Float):flight.esm.types.textformat.Types.TextFormatRange {})
  public static function create():flight.esm.types.textformat.Types.TextFormatRange;
  public static function from(raw:Dynamic):flight.esm.types.textformat.Types.TextFormatRange;
}

typedef TextFormatRangeRaw = { end:Float, format:Dynamic, start:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
