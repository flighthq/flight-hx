package flight._js._fn;

@:jsRequire("flight")
extern class Textbidi {
	@:native("flight_disable_text_bidi_guards")
	public static function disableTextBidiGuards():Void;
	@:native("flight_enable_text_bidi_guards")
	public static function enableTextBidiGuards(logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:native("flight_reorder_bidi_line")
	public static function reorderBidiLine(levels:Dynamic, levelsLen:Int, start:Int, end:Int, out:Dynamic):Void;
}
