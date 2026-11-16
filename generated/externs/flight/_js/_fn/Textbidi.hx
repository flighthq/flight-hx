package flight._js._fn;

@:jsRequire("@flighthq/textbidi")
extern class Textbidi {
	@:native("disableTextBidiGuards")
	public static function disableTextBidiGuards():Void;
	@:native("enableTextBidiGuards")
	public static function enableTextBidiGuards(logState:Dynamic, clock:Dynamic):Void;
	@:native("reorderBidiLine")
	public static function reorderBidiLine(levels:Dynamic, start:Int, end:Int, out:Dynamic):Void;
}
