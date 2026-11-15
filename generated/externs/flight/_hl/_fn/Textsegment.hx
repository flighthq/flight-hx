package flight._hl._fn;

extern class Textsegment {
	@:hlNative("flight", "flight_disable_text_segment_guards")
	public static function disableTextSegmentGuards():Void;
	@:hlNative("flight", "flight_enable_text_segment_guards")
	public static function enableTextSegmentGuards(logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:hlNative("flight", "flight_segment_graphemes")
	public static function segmentGraphemes(out:Dynamic, hostTextSegmenter:flight._hl.HostTextSegmenterCapability, text:hl.Bytes, locale:hl.Bytes):Void;
	@:hlNative("flight", "flight_segment_sentences")
	public static function segmentSentences(out:Dynamic, hostTextSegmenter:flight._hl.HostTextSegmenterCapability, text:hl.Bytes, locale:hl.Bytes):Void;
	@:hlNative("flight", "flight_segment_words")
	public static function segmentWords(out:Dynamic, hostTextSegmenter:flight._hl.HostTextSegmenterCapability, text:hl.Bytes, locale:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_next_grapheme_boundary")
	public static function getNextGraphemeBoundary(textSegmenter:flight._hl.HostTextSegmenterCapability, text:hl.Bytes, index:Int, locale:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_next_sentence_boundary")
	public static function getNextSentenceBoundary(textSegmenter:flight._hl.HostTextSegmenterCapability, text:hl.Bytes, index:Int, locale:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_next_word_boundary")
	public static function getNextWordBoundary(textSegmenter:flight._hl.HostTextSegmenterCapability, text:hl.Bytes, index:Int, locale:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_previous_grapheme_boundary")
	public static function getPreviousGraphemeBoundary(textSegmenter:flight._hl.HostTextSegmenterCapability, text:hl.Bytes, index:Int, locale:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_previous_sentence_boundary")
	public static function getPreviousSentenceBoundary(textSegmenter:flight._hl.HostTextSegmenterCapability, text:hl.Bytes, index:Int, locale:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_previous_word_boundary")
	public static function getPreviousWordBoundary(textSegmenter:flight._hl.HostTextSegmenterCapability, text:hl.Bytes, index:Int, locale:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_word_range_at")
	public static function getWordRangeAt(textSegmenter:flight._hl.HostTextSegmenterCapability, text:hl.Bytes, index:Int, locale:hl.Bytes):Dynamic;
	@:hlNative("flight", "flight_explain_text_segmenter_backend")
	public static function explainTextSegmenterBackend(textSegmenter:flight._hl.HostTextSegmenterCapability):flight._hl.TextSegmenterExplanation;
	@:hlNative("flight", "flight_free_text_segment_range")
	public static function freeTextSegmentRange(ptr:flight._hl.TextSegmentRange):Void;
	@:hlNative("flight", "flight_free_text_segmenter_explanation")
	public static function freeTextSegmenterExplanation(ptr:flight._hl.TextSegmenterExplanation):Void;
}
