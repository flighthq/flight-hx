package flight;

#if (js && flight_esm)
extern inline function disableTextBidiGuards():Void {
	flight._js._fn.Textbidi.disableTextBidiGuards();
}
#else
extern inline function disableTextBidiGuards():Void {
#if hl
	flight._hl._fn.Textbidi.disableTextBidiGuards();
#elseif cpp
	flight._cpp._fn.Textbidi.disableTextBidiGuards();
#elseif (js && flight_esm)
	flight._js._fn.Textbidi.disableTextBidiGuards();
#else
	#error "flight.Textbidi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableTextBidiGuards(logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.Textbidi.enableTextBidiGuards(logState, clock);
}
#else
extern inline function enableTextBidiGuards(logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Textbidi.enableTextBidiGuards(logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.Textbidi.enableTextBidiGuards(logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.Textbidi.enableTextBidiGuards(logState, clockFn, clockCtx);
#else
	#error "flight.Textbidi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function reorderBidiLine(levels:Dynamic, start:Int, end:Int, out:Dynamic):Void {
	flight._js._fn.Textbidi.reorderBidiLine(levels, start, end, out);
}
#else
extern inline function reorderBidiLine(levels:Dynamic, levelsLen:Int, start:Int, end:Int, out:Dynamic):Void {
#if hl
	flight._hl._fn.Textbidi.reorderBidiLine(levels, levelsLen, start, end, out);
#elseif cpp
	flight._cpp._fn.Textbidi.reorderBidiLine(levels, levelsLen, start, end, out);
#elseif (js && flight_esm)
	flight._js._fn.Textbidi.reorderBidiLine(levels, levelsLen, start, end, out);
#else
	#error "flight.Textbidi: no backend for this target."
#end
}
#end
