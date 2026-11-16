package flight;

#if (js && flight_esm)
extern inline function disableTextSegmentGuards():Void {
	flight._js._fn.Textsegment.disableTextSegmentGuards();
}
#else
extern inline function disableTextSegmentGuards():Void {
#if hl
	flight._hl._fn.Textsegment.disableTextSegmentGuards();
#elseif cpp
	flight._cpp._fn.Textsegment.disableTextSegmentGuards();
#elseif (js && flight_esm)
	flight._js._fn.Textsegment.disableTextSegmentGuards();
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableTextSegmentGuards(logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.Textsegment.enableTextSegmentGuards(logState, clock);
}
#else
extern inline function enableTextSegmentGuards(logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Textsegment.enableTextSegmentGuards(logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.Textsegment.enableTextSegmentGuards(logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.Textsegment.enableTextSegmentGuards(logState, clockFn, clockCtx);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function segmentGraphemes(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:Null<String>):Void {
	flight._js._fn.Textsegment.segmentGraphemes(out, hostTextSegmenter, text, locale);
}
#else
extern inline function segmentGraphemes(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:String):Void {
#if hl
	flight._hl._fn.Textsegment.segmentGraphemes(out, hostTextSegmenter, cast text, cast locale);
#elseif cpp
	flight._cpp._fn.Textsegment.segmentGraphemes(out, hostTextSegmenter, cast text, cast locale);
#elseif (js && flight_esm)
	flight._js._fn.Textsegment.segmentGraphemes(out, hostTextSegmenter, text, locale);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function segmentSentences(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:Null<String>):Void {
	flight._js._fn.Textsegment.segmentSentences(out, hostTextSegmenter, text, locale);
}
#else
extern inline function segmentSentences(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:String):Void {
#if hl
	flight._hl._fn.Textsegment.segmentSentences(out, hostTextSegmenter, cast text, cast locale);
#elseif cpp
	flight._cpp._fn.Textsegment.segmentSentences(out, hostTextSegmenter, cast text, cast locale);
#elseif (js && flight_esm)
	flight._js._fn.Textsegment.segmentSentences(out, hostTextSegmenter, text, locale);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function segmentWords(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:Null<String>):Void {
	flight._js._fn.Textsegment.segmentWords(out, hostTextSegmenter, text, locale);
}
#else
extern inline function segmentWords(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:String):Void {
#if hl
	flight._hl._fn.Textsegment.segmentWords(out, hostTextSegmenter, cast text, cast locale);
#elseif cpp
	flight._cpp._fn.Textsegment.segmentWords(out, hostTextSegmenter, cast text, cast locale);
#elseif (js && flight_esm)
	flight._js._fn.Textsegment.segmentWords(out, hostTextSegmenter, text, locale);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNextGraphemeBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.Textsegment.getNextGraphemeBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getNextGraphemeBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.Textsegment.getNextGraphemeBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.Textsegment.getNextGraphemeBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.Textsegment.getNextGraphemeBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNextSentenceBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.Textsegment.getNextSentenceBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getNextSentenceBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.Textsegment.getNextSentenceBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.Textsegment.getNextSentenceBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.Textsegment.getNextSentenceBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNextWordBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.Textsegment.getNextWordBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getNextWordBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.Textsegment.getNextWordBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.Textsegment.getNextWordBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.Textsegment.getNextWordBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPreviousGraphemeBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.Textsegment.getPreviousGraphemeBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getPreviousGraphemeBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.Textsegment.getPreviousGraphemeBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.Textsegment.getPreviousGraphemeBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.Textsegment.getPreviousGraphemeBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPreviousSentenceBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.Textsegment.getPreviousSentenceBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getPreviousSentenceBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.Textsegment.getPreviousSentenceBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.Textsegment.getPreviousSentenceBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.Textsegment.getPreviousSentenceBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPreviousWordBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.Textsegment.getPreviousWordBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getPreviousWordBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.Textsegment.getPreviousWordBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.Textsegment.getPreviousWordBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.Textsegment.getPreviousWordBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getWordRangeAt(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Null<TextSegmentRange> {
	return flight._js._fn.Textsegment.getWordRangeAt(textSegmenter, text, index, locale);
}
#else
extern inline function getWordRangeAt(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):TextSegmentRange {
#if hl
	return flight._hl._fn.Textsegment.getWordRangeAt(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.Textsegment.getWordRangeAt(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.Textsegment.getWordRangeAt(textSegmenter, text, index, locale);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainTextSegmenterBackend(textSegmenter:HostTextSegmenterCapability):TextSegmenterExplanation {
	return flight._js._fn.Textsegment.explainTextSegmenterBackend(textSegmenter);
}
#else
extern inline function explainTextSegmenterBackend(textSegmenter:HostTextSegmenterCapability):TextSegmenterExplanation {
#if hl
	return flight._hl._fn.Textsegment.explainTextSegmenterBackend(textSegmenter);
#elseif cpp
	return flight._cpp._fn.Textsegment.explainTextSegmenterBackend(textSegmenter);
#elseif (js && flight_esm)
	return flight._js._fn.Textsegment.explainTextSegmenterBackend(textSegmenter);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextSegmentRange(ptr:TextSegmentRange):Void {
	flight._js._fn.Textsegment.freeTextSegmentRange(ptr);
}
#else
extern inline function freeTextSegmentRange(ptr:TextSegmentRange):Void {
#if hl
	flight._hl._fn.Textsegment.freeTextSegmentRange(ptr);
#elseif cpp
	flight._cpp._fn.Textsegment.freeTextSegmentRange(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textsegment.freeTextSegmentRange(ptr);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextSegmenterExplanation(ptr:TextSegmenterExplanation):Void {
	flight._js._fn.Textsegment.freeTextSegmenterExplanation(ptr);
}
#else
extern inline function freeTextSegmenterExplanation(ptr:TextSegmenterExplanation):Void {
#if hl
	flight._hl._fn.Textsegment.freeTextSegmenterExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Textsegment.freeTextSegmenterExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textsegment.freeTextSegmenterExplanation(ptr);
#else
	#error "flight.Textsegment: no backend for this target."
#end
}
#end
