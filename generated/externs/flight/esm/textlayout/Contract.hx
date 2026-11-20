package flight.esm.textlayout;

#if (js && flight_esm)
@:jsRequire("@flighthq/textlayout/contract")
extern class Contract {
  public static final TEXT_BOUNDS_GUTTER:Float;
  public static final TEXT_LAYOUT_GUTTER:Float;
  public static final TextAutoSize:Dynamic;
  public static final TextJustification:Dynamic;
  public static final TextVerticalAlign:Dynamic;
  public static function computeRichTextCharIndexAtPoint(layout:flight.esm.types.textlayout.Types.TextLayoutResult, x:Float, y:Float):Float;
  public static function computeRichTextLineMetrics(layout:flight.esm.types.textlayout.Types.TextLayoutResult, lineIndex:Float):Null<flight.esm.types.textlayout.Types.TextLineMetrics>;
  public static function computeTextBoundsHeight(spec:Dynamic, layout:flight.esm.types.textlayout.Types.TextLayoutResult):Float;
  public static function computeTextBoundsOffsetX(spec:Dynamic, layout:flight.esm.types.textlayout.Types.TextLayoutResult):Float;
  public static function computeTextBoundsRectangle(out:flight.esm.types.geometry.Types.Rectangle, spec:Dynamic, layout:flight.esm.types.textlayout.Types.TextLayoutResult):Void;
  public static function computeTextBoundsWidth(spec:Dynamic, layout:flight.esm.types.textlayout.Types.TextLayoutResult):Float;
  public static function computeTextLayout(out:flight.esm.types.textlayout.Types.TextLayoutResult, params:flight.esm.types.textlayout.Types.TextLayoutParams):Void;
  public static function createRichTextContent():flight.esm.types.textlayout.Types.RichTextContent;
  public static function createTextLayoutGroup(format:flight.esm.types.textformat.Types.TextFormat, ?startIndex:Float, ?endIndex:Float):flight.esm.types.textlayout.Types.TextLayoutGroup;
  public static function createTextLayoutResult():flight.esm.types.textlayout.Types.TextLayoutResult;
  public static function createTextMetrics():flight.esm.types.textlayout.Types.TextMetrics;
  public static function getRichTextCharBoundaries(out:flight.esm.types.geometry.Types.Rectangle, layout:flight.esm.types.textlayout.Types.TextLayoutResult, charIndex:Float):Bool;
  public static function getRichTextFirstCharInParagraph(text:String, charIndex:Float):Float;
  public static function getRichTextLineIndexAtPoint(layout:flight.esm.types.textlayout.Types.TextLayoutResult, y:Float):Float;
  public static function getRichTextLineIndexOfChar(layout:flight.esm.types.textlayout.Types.TextLayoutResult, charIndex:Float):Float;
  public static function getRichTextLineLength(layout:flight.esm.types.textlayout.Types.TextLayoutResult, lineIndex:Float):Float;
  public static function getRichTextLineOffset(layout:flight.esm.types.textlayout.Types.TextLayoutResult, lineIndex:Float):Float;
  public static function getRichTextLineText(text:String, layout:flight.esm.types.textlayout.Types.TextLayoutResult, lineIndex:Float):String;
  public static function getRichTextLinkAtPoint(layout:flight.esm.types.textlayout.Types.TextLayoutResult, x:Float, y:Float):Null<String>;
  public static function getRichTextParagraphLength(text:String, charIndex:Float):Float;
  public static function getRichTextSelectionRectangles(out:Array<flight.esm.types.textlayout.Types.TextSelectionRectangle>, beginIndex:Float, endIndex:Float, layout:flight.esm.types.textlayout.Types.TextLayoutResult):Void;
  public static function getTextAutoSizeString(value:flight.esm.types.textlayout.Types.TextAutoSize):String;
  public static function getTextJustificationString(value:flight.esm.types.textlayout.Types.TextJustification):String;
  public static function getTextLayoutMeasureProvider(?hostTextShaper:Null<flight.esm.types.textshaper.Types.HostTextShaperCapability>):Null<flight.esm.types.textshaper.Types.TextMeasureFunction>;
  public static function getTextLineBreakIndex(lineBreaks:Array<Float>, ?startIndex:Null<Float>):Float;
  public static function getTextLineBreaks(out:Array<Float>, text:String):Void;
  public static function getTextMetrics(out:flight.esm.types.textlayout.Types.TextMetrics, layout:flight.esm.types.textlayout.Types.TextLayoutResult):Void;
  public static function getTextVerticalAlignString(value:flight.esm.types.textlayout.Types.TextVerticalAlign):String;
  public static function initializeRichTextContent(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.textlayout.Types.RichTextContent>):Void;
  public static function initializeTextLayoutGroup(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.textlayout.Types.TextLayoutGroup>, format:flight.esm.types.textformat.Types.TextFormat, ?startIndex:Float, ?endIndex:Float):Void;
  public static function initializeTextLayoutResult(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.textlayout.Types.TextLayoutResult>):Void;
  public static function initializeTextMetrics(out:flight.esm.types.textlayout.Types.TextMetrics):Void;
  public static function isTextLayoutTruncated(layout:flight.esm.types.textlayout.Types.TextLayoutResult, params:flight.esm.types.textlayout.Types.TextLayoutParams):Bool;
  public static function parseTextAutoSize(value:String):Null<String>;
  public static function parseTextJustification(value:String):Null<String>;
  public static function parseTextVerticalAlign(value:String):Null<String>;
  public static function setTextLayoutMeasureProvider(measure:Null<flight.esm.types.textshaper.Types.TextMeasureFunction>):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
