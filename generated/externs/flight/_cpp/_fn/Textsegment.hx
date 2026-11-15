package flight._cpp._fn;

extern class Textsegment {
	@:native("flight_disable_text_segment_guards")
	public static function disableTextSegmentGuards():Void;
	@:native("flight_enable_text_segment_guards")
	public static function enableTextSegmentGuards(logState:cpp.Star<cpp.Void>, clockFn:cpp.Star<cpp.Void>, clockCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_segment_graphemes")
	public static function segmentGraphemes(out:cpp.Star<cpp.Void>, hostTextSegmenter:flight._cpp.HostTextSegmenterCapability, text:cpp.ConstCharStar, locale:cpp.ConstCharStar):Void;
	@:native("flight_segment_sentences")
	public static function segmentSentences(out:cpp.Star<cpp.Void>, hostTextSegmenter:flight._cpp.HostTextSegmenterCapability, text:cpp.ConstCharStar, locale:cpp.ConstCharStar):Void;
	@:native("flight_segment_words")
	public static function segmentWords(out:cpp.Star<cpp.Void>, hostTextSegmenter:flight._cpp.HostTextSegmenterCapability, text:cpp.ConstCharStar, locale:cpp.ConstCharStar):Void;
	@:native("flight_get_next_grapheme_boundary")
	public static function getNextGraphemeBoundary(textSegmenter:flight._cpp.HostTextSegmenterCapability, text:cpp.ConstCharStar, index:Int, locale:cpp.ConstCharStar):Int;
	@:native("flight_get_next_sentence_boundary")
	public static function getNextSentenceBoundary(textSegmenter:flight._cpp.HostTextSegmenterCapability, text:cpp.ConstCharStar, index:Int, locale:cpp.ConstCharStar):Int;
	@:native("flight_get_next_word_boundary")
	public static function getNextWordBoundary(textSegmenter:flight._cpp.HostTextSegmenterCapability, text:cpp.ConstCharStar, index:Int, locale:cpp.ConstCharStar):Int;
	@:native("flight_get_previous_grapheme_boundary")
	public static function getPreviousGraphemeBoundary(textSegmenter:flight._cpp.HostTextSegmenterCapability, text:cpp.ConstCharStar, index:Int, locale:cpp.ConstCharStar):Int;
	@:native("flight_get_previous_sentence_boundary")
	public static function getPreviousSentenceBoundary(textSegmenter:flight._cpp.HostTextSegmenterCapability, text:cpp.ConstCharStar, index:Int, locale:cpp.ConstCharStar):Int;
	@:native("flight_get_previous_word_boundary")
	public static function getPreviousWordBoundary(textSegmenter:flight._cpp.HostTextSegmenterCapability, text:cpp.ConstCharStar, index:Int, locale:cpp.ConstCharStar):Int;
	@:native("flight_get_word_range_at")
	public static function getWordRangeAt(textSegmenter:flight._cpp.HostTextSegmenterCapability, text:cpp.ConstCharStar, index:Int, locale:cpp.ConstCharStar):flight._cpp.TextSegmentRange;
	@:native("flight_explain_text_segmenter_backend")
	public static function explainTextSegmenterBackend(textSegmenter:flight._cpp.HostTextSegmenterCapability):flight._cpp.TextSegmenterExplanation;
	@:native("flight_free_text_segment_range")
	public static function freeTextSegmentRange(ptr:flight._cpp.TextSegmentRange):Void;
	@:native("flight_free_text_segmenter_explanation")
	public static function freeTextSegmenterExplanation(ptr:flight._cpp.TextSegmenterExplanation):Void;
}
