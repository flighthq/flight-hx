package flight._cpp._fn;

extern class Textbidi {
	@:native("flight_disable_text_bidi_guards")
	public static function disableTextBidiGuards():Void;
	@:native("flight_enable_text_bidi_guards")
	public static function enableTextBidiGuards(logState:cpp.Star<cpp.Void>, clockFn:cpp.Star<cpp.Void>, clockCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_reorder_bidi_line")
	public static function reorderBidiLine(levels:cpp.Star<cpp.Void>, levelsLen:Int, start:Int, end:Int, out:cpp.Star<cpp.Void>):Void;
}
