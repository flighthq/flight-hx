package flight.esm.text_markup;

#if (js && flight_esm)
@:jsRequire("@flighthq/text-markup/contract")
extern class Contract {
  public static function MARKUP_HEX_COLOR_RESOLVER(value:String):Null<Float>;
  public static final TextMarkupIssueKind:Dynamic;
  public static function createMarkupTagRegistry():flight.esm.types.text_markup_contract.Types.MarkupTagRegistry;
  public static function createTextMarkupGuardState():flight.esm.types.text_markup_contract.Types.TextMarkupGuardState;
  public static function disableTextMarkupGuards():Void;
  public static function enableTextMarkupGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainTextMarkup(html:String, ?registry:Null<flight.esm.types.text_markup_contract.Types.MarkupTagRegistry>):flight.esm.types.text_markup_contract.Types.TextMarkupExplanation;
  public static function formatTextMarkup(content:flight.esm.types.textlayout.Types.RichTextContent):String;
  public static function getTextMarkupIssueKindString(value:flight.esm.types.text_markup_contract.Types.TextMarkupIssueKind):String;
  public static function normalizeMarkupTagResult(result:flight.esm.types.text_markup_contract.Types.MarkupTagResult):flight.esm.types.text_markup_contract.Types.MarkupTagEffect;
  public static function parseTextMarkup(html:String, ?registry:Null<flight.esm.types.text_markup_contract.Types.MarkupTagRegistry>):flight.esm.types.textlayout.Types.RichTextContent;
  public static function parseTextMarkupIssueKind(value:String):Null<String>;
  public static function registerMarkupClassStyles(registry:flight.esm.types.text_markup_contract.Types.MarkupTagRegistry, styles:Dynamic):Void;
  public static function registerMarkupNamedColors(registry:flight.esm.types.text_markup_contract.Types.MarkupTagRegistry):Void;
  public static function registerMarkupTag(registry:flight.esm.types.text_markup_contract.Types.MarkupTagRegistry, name:String, handler:flight.esm.types.text_markup_contract.Types.MarkupTagHandler):Void;
  public static function registerStandardMarkupTags(registry:flight.esm.types.text_markup_contract.Types.MarkupTagRegistry):Void;
  public static function reportTextMarkupIssue(issue:flight.esm.types.text_markup_contract.Types.TextMarkupIssue):Void;
  public static function resolveMarkupHexColor(value:String):Null<Float>;
  public static function setTextMarkupGuard(guard:Null<flight.esm.types.text_markup_contract.Types.TextMarkupGuard>):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
