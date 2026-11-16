package flight._js._fn;

@:jsRequire("@flighthq/textsegment")
extern class Textsegment {
	@:native("disableTextSegmentGuards")
	public static function disableTextSegmentGuards():Void;
	@:native("enableTextSegmentGuards")
	public static function enableTextSegmentGuards(logState:Dynamic, clock:Dynamic):Void;
	@:native("segmentGraphemes")
	public static function segmentGraphemes(out:Dynamic, hostTextSegmenter:flight._js.HostTextSegmenterCapability, text:String, locale:Null<String>):Void;
	@:native("segmentSentences")
	public static function segmentSentences(out:Dynamic, hostTextSegmenter:flight._js.HostTextSegmenterCapability, text:String, locale:Null<String>):Void;
	@:native("segmentWords")
	public static function segmentWords(out:Dynamic, hostTextSegmenter:flight._js.HostTextSegmenterCapability, text:String, locale:Null<String>):Void;
	@:native("getNextGraphemeBoundary")
	public static function getNextGraphemeBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int;
	@:native("getNextSentenceBoundary")
	public static function getNextSentenceBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int;
	@:native("getNextWordBoundary")
	public static function getNextWordBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int;
	@:native("getPreviousGraphemeBoundary")
	public static function getPreviousGraphemeBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int;
	@:native("getPreviousSentenceBoundary")
	public static function getPreviousSentenceBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int;
	@:native("getPreviousWordBoundary")
	public static function getPreviousWordBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int;
	@:native("getWordRangeAt")
	public static function getWordRangeAt(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Null<flight._js.TextSegmentRange>;
	@:native("explainTextSegmenterBackend")
	public static function explainTextSegmenterBackend(textSegmenter:flight._js.HostTextSegmenterCapability):flight._js.TextSegmenterExplanation;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextSegmentRange(ptr:flight._js.TextSegmentRange):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextSegmenterExplanation(ptr:flight._js.TextSegmenterExplanation):Void {}
}
