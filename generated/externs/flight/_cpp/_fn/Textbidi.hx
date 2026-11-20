package flight._cpp._fn;

extern class Textbidi {
	@:native("flight_disable_text_bidi_guards")
	public static function disableTextBidiGuards():Void;
	@:native("flight_reorder_bidi_line")
	public static function reorderBidiLine(levels:cpp.Star<cpp.Void>, levelsLen:Int, start:Int, end:Int, out:cpp.Star<cpp.Void>):Void;
}
