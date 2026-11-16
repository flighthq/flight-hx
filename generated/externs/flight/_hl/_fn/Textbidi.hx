package flight._hl._fn;

extern class Textbidi {
	@:hlNative("flight", "flight_disable_text_bidi_guards")
	public static function disableTextBidiGuards():Void;
	@:hlNative("flight", "flight_enable_text_bidi_guards")
	public static function enableTextBidiGuards(logState:hl.Bytes, clockFn:hl.Bytes, clockCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_reorder_bidi_line")
	public static function reorderBidiLine(levels:hl.Bytes, levelsLen:Int, start:Int, end:Int, out:hl.Bytes):Void;
}
