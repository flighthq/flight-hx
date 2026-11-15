package flight._js._fn;

@:jsRequire("flight")
extern class Textsegment {
	@:native("flight_disable_text_segment_guards")
	public static function disableTextSegmentGuards():Void;
	@:native("flight_enable_text_segment_guards")
	public static function enableTextSegmentGuards(logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:native("flight_segment_graphemes")
	public static function segmentGraphemes(out:Dynamic, hostTextSegmenter:flight._js.HostTextSegmenterCapability, text:String, locale:String):Void;
	@:native("flight_segment_sentences")
	public static function segmentSentences(out:Dynamic, hostTextSegmenter:flight._js.HostTextSegmenterCapability, text:String, locale:String):Void;
	@:native("flight_segment_words")
	public static function segmentWords(out:Dynamic, hostTextSegmenter:flight._js.HostTextSegmenterCapability, text:String, locale:String):Void;
	@:native("flight_get_next_grapheme_boundary")
	public static function getNextGraphemeBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:String):Int;
	@:native("flight_get_next_sentence_boundary")
	public static function getNextSentenceBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:String):Int;
	@:native("flight_get_next_word_boundary")
	public static function getNextWordBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:String):Int;
	@:native("flight_get_previous_grapheme_boundary")
	public static function getPreviousGraphemeBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:String):Int;
	@:native("flight_get_previous_sentence_boundary")
	public static function getPreviousSentenceBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:String):Int;
	@:native("flight_get_previous_word_boundary")
	public static function getPreviousWordBoundary(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:String):Int;
	@:native("flight_get_word_range_at")
	public static function getWordRangeAt(textSegmenter:flight._js.HostTextSegmenterCapability, text:String, index:Int, locale:String):Dynamic;
	@:native("flight_explain_text_segmenter_backend")
	public static function explainTextSegmenterBackend(textSegmenter:flight._js.HostTextSegmenterCapability):flight._js.TextSegmenterExplanation;
	@:native("flight_free_text_segment_range")
	public static function freeTextSegmentRange(ptr:flight._js.TextSegmentRange):Void;
	@:native("flight_free_text_segmenter_explanation")
	public static function freeTextSegmenterExplanation(ptr:flight._js.TextSegmenterExplanation):Void;
}
