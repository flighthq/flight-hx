package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/text-markup")
extern class TextMarkup {
  public static function createMarkupTagRegistry():flight.esm.types.text_markup_contract.Types.MarkupTagRegistry;
  public static function disableTextMarkupGuards():Void;
  public static function enableTextMarkupGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainTextMarkup(html:String, ?registry:Null<flight.esm.types.text_markup_contract.Types.MarkupTagRegistry>):flight.esm.types.text_markup_contract.Types.TextMarkupExplanation;
  public static function formatTextMarkup(content:flight.esm.types.textlayout.Types.RichTextContent):String;
  public static function parseTextMarkup(html:String, ?registry:Null<flight.esm.types.text_markup_contract.Types.MarkupTagRegistry>):flight.esm.types.textlayout.Types.RichTextContent;
  public static function registerMarkupClassStyles(registry:flight.esm.types.text_markup_contract.Types.MarkupTagRegistry, styles:Dynamic):Void;
  public static function registerMarkupNamedColors(registry:flight.esm.types.text_markup_contract.Types.MarkupTagRegistry):Void;
  public static function registerMarkupTag(registry:flight.esm.types.text_markup_contract.Types.MarkupTagRegistry, name:String, handler:flight.esm.types.text_markup_contract.Types.MarkupTagHandler):Void;
  public static function registerStandardMarkupTags(registry:flight.esm.types.text_markup_contract.Types.MarkupTagRegistry):Void;
  public static function resolveMarkupHexColor(value:String):Null<Float>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
