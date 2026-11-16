package flight;

#if hl

typedef TextSegment = flight._hl.TextSegment;

#elseif cpp

typedef TextSegment = flight._cpp.TextSegment;

#elseif (js && flight_esm)

typedef TextSegment = flight._js.TextSegment;

#elseif js

#error "flight.TextSegment on js requires flight_esm."

#else

#error "flight.TextSegment: no backend for this target."

#end

#if (js && flight_esm)
extern inline function disableTextSegmentGuards():Void {
	flight._js._fn.TextSegment.disableTextSegmentGuards();
}
#else
extern inline function disableTextSegmentGuards():Void {
#if hl
	flight._hl._fn.TextSegment.disableTextSegmentGuards();
#elseif cpp
	flight._cpp._fn.TextSegment.disableTextSegmentGuards();
#elseif (js && flight_esm)
	flight._js._fn.TextSegment.disableTextSegmentGuards();
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableTextSegmentGuards(logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.TextSegment.enableTextSegmentGuards(logState, clock);
}
#else
extern inline function enableTextSegmentGuards(logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.TextSegment.enableTextSegmentGuards(logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.TextSegment.enableTextSegmentGuards(logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.TextSegment.enableTextSegmentGuards(logState, clockFn, clockCtx);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function segmentGraphemes(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:Null<String>):Void {
	flight._js._fn.TextSegment.segmentGraphemes(out, hostTextSegmenter, text, locale);
}
#else
extern inline function segmentGraphemes(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:String):Void {
#if hl
	flight._hl._fn.TextSegment.segmentGraphemes(out, hostTextSegmenter, cast text, cast locale);
#elseif cpp
	flight._cpp._fn.TextSegment.segmentGraphemes(out, hostTextSegmenter, cast text, cast locale);
#elseif (js && flight_esm)
	flight._js._fn.TextSegment.segmentGraphemes(out, hostTextSegmenter, text, locale);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function segmentSentences(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:Null<String>):Void {
	flight._js._fn.TextSegment.segmentSentences(out, hostTextSegmenter, text, locale);
}
#else
extern inline function segmentSentences(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:String):Void {
#if hl
	flight._hl._fn.TextSegment.segmentSentences(out, hostTextSegmenter, cast text, cast locale);
#elseif cpp
	flight._cpp._fn.TextSegment.segmentSentences(out, hostTextSegmenter, cast text, cast locale);
#elseif (js && flight_esm)
	flight._js._fn.TextSegment.segmentSentences(out, hostTextSegmenter, text, locale);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function segmentWords(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:Null<String>):Void {
	flight._js._fn.TextSegment.segmentWords(out, hostTextSegmenter, text, locale);
}
#else
extern inline function segmentWords(out:Dynamic, hostTextSegmenter:HostTextSegmenterCapability, text:String, locale:String):Void {
#if hl
	flight._hl._fn.TextSegment.segmentWords(out, hostTextSegmenter, cast text, cast locale);
#elseif cpp
	flight._cpp._fn.TextSegment.segmentWords(out, hostTextSegmenter, cast text, cast locale);
#elseif (js && flight_esm)
	flight._js._fn.TextSegment.segmentWords(out, hostTextSegmenter, text, locale);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNextGraphemeBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.TextSegment.getNextGraphemeBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getNextGraphemeBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.TextSegment.getNextGraphemeBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.TextSegment.getNextGraphemeBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.TextSegment.getNextGraphemeBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNextSentenceBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.TextSegment.getNextSentenceBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getNextSentenceBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.TextSegment.getNextSentenceBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.TextSegment.getNextSentenceBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.TextSegment.getNextSentenceBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNextWordBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.TextSegment.getNextWordBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getNextWordBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.TextSegment.getNextWordBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.TextSegment.getNextWordBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.TextSegment.getNextWordBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPreviousGraphemeBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.TextSegment.getPreviousGraphemeBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getPreviousGraphemeBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.TextSegment.getPreviousGraphemeBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.TextSegment.getPreviousGraphemeBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.TextSegment.getPreviousGraphemeBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPreviousSentenceBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.TextSegment.getPreviousSentenceBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getPreviousSentenceBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.TextSegment.getPreviousSentenceBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.TextSegment.getPreviousSentenceBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.TextSegment.getPreviousSentenceBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPreviousWordBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Int {
	return flight._js._fn.TextSegment.getPreviousWordBoundary(textSegmenter, text, index, locale);
}
#else
extern inline function getPreviousWordBoundary(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):Int {
#if hl
	return flight._hl._fn.TextSegment.getPreviousWordBoundary(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.TextSegment.getPreviousWordBoundary(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.TextSegment.getPreviousWordBoundary(textSegmenter, text, index, locale);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getWordRangeAt(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:Null<String>):Null<TextSegmentRange> {
	return flight._js._fn.TextSegment.getWordRangeAt(textSegmenter, text, index, locale);
}
#else
extern inline function getWordRangeAt(textSegmenter:HostTextSegmenterCapability, text:String, index:Int, locale:String):TextSegmentRange {
#if hl
	return flight._hl._fn.TextSegment.getWordRangeAt(textSegmenter, cast text, index, cast locale);
#elseif cpp
	return flight._cpp._fn.TextSegment.getWordRangeAt(textSegmenter, cast text, index, cast locale);
#elseif (js && flight_esm)
	return flight._js._fn.TextSegment.getWordRangeAt(textSegmenter, text, index, locale);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainTextSegmenterBackend(textSegmenter:HostTextSegmenterCapability):TextSegmenterExplanation {
	return flight._js._fn.TextSegment.explainTextSegmenterBackend(textSegmenter);
}
#else
extern inline function explainTextSegmenterBackend(textSegmenter:HostTextSegmenterCapability):TextSegmenterExplanation {
#if hl
	return flight._hl._fn.TextSegment.explainTextSegmenterBackend(textSegmenter);
#elseif cpp
	return flight._cpp._fn.TextSegment.explainTextSegmenterBackend(textSegmenter);
#elseif (js && flight_esm)
	return flight._js._fn.TextSegment.explainTextSegmenterBackend(textSegmenter);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextSegmentRange(ptr:TextSegmentRange):Void {
	flight._js._fn.TextSegment.freeTextSegmentRange(ptr);
}
#else
extern inline function freeTextSegmentRange(ptr:TextSegmentRange):Void {
#if hl
	flight._hl._fn.TextSegment.freeTextSegmentRange(ptr);
#elseif cpp
	flight._cpp._fn.TextSegment.freeTextSegmentRange(ptr);
#elseif (js && flight_esm)
	flight._js._fn.TextSegment.freeTextSegmentRange(ptr);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextSegmenterExplanation(ptr:TextSegmenterExplanation):Void {
	flight._js._fn.TextSegment.freeTextSegmenterExplanation(ptr);
}
#else
extern inline function freeTextSegmenterExplanation(ptr:TextSegmenterExplanation):Void {
#if hl
	flight._hl._fn.TextSegment.freeTextSegmenterExplanation(ptr);
#elseif cpp
	flight._cpp._fn.TextSegment.freeTextSegmenterExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.TextSegment.freeTextSegmenterExplanation(ptr);
#else
	#error "flight.TextSegment: no backend for this target."
#end
}
#end
