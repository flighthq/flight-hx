package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/textsegment")
extern class Textsegment {
  public static final TextSegmentGranularity:{ Grapheme:String, Word:String, Sentence:String };
  public static final TextSegmenterKind:{ Custom:String, WebIntl:String };
  public static function disableTextSegmentGuards():Void;
  public static function enableTextSegmentGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainTextSegmenterBackend(textSegmenter:flight.esm.types.textsegment.Types.HostTextSegmenterCapability):flight.esm.types.textsegment.Types.TextSegmenterExplanation;
  public static function getNextGraphemeBoundary(textSegmenter:flight.esm.types.textsegment.Types.HostTextSegmenterCapability, text:String, index:Float, ?locale:Null<String>):Float;
  public static function getNextSentenceBoundary(textSegmenter:flight.esm.types.textsegment.Types.HostTextSegmenterCapability, text:String, index:Float, ?locale:Null<String>):Float;
  public static function getNextWordBoundary(textSegmenter:flight.esm.types.textsegment.Types.HostTextSegmenterCapability, text:String, index:Float, ?locale:Null<String>):Float;
  public static function getPreviousGraphemeBoundary(textSegmenter:flight.esm.types.textsegment.Types.HostTextSegmenterCapability, text:String, index:Float, ?locale:Null<String>):Float;
  public static function getPreviousSentenceBoundary(textSegmenter:flight.esm.types.textsegment.Types.HostTextSegmenterCapability, text:String, index:Float, ?locale:Null<String>):Float;
  public static function getPreviousWordBoundary(textSegmenter:flight.esm.types.textsegment.Types.HostTextSegmenterCapability, text:String, index:Float, ?locale:Null<String>):Float;
  public static function getWordRangeAt(textSegmenter:flight.esm.types.textsegment.Types.HostTextSegmenterCapability, text:String, index:Float, ?locale:Null<String>):Null<flight.esm.types.textsegment.Types.TextSegmentRange>;
  public static function segmentGraphemes(out:Array<flight.esm.types.textsegment.Types.TextSegment>, hostTextSegmenter:flight.esm.types.textsegment.Types.HostTextSegmenterCapability, text:String, ?locale:Null<String>):Void;
  public static function segmentSentences(out:Array<flight.esm.types.textsegment.Types.TextSegment>, hostTextSegmenter:flight.esm.types.textsegment.Types.HostTextSegmenterCapability, text:String, ?locale:Null<String>):Void;
  public static function segmentWords(out:Array<flight.esm.types.textsegment.Types.TextSegment>, hostTextSegmenter:flight.esm.types.textsegment.Types.HostTextSegmenterCapability, text:String, ?locale:Null<String>):Void;
  public static final webTextSegmenterBackend:flight.esm.types.textsegment.Types.HostTextSegmenterCapability;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
