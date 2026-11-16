package flight._js._fn;

@:jsRequire("@flighthq/abc")
extern class Abc {
	@:native("readAbcFile")
	public static function readAbcFile(source:Dynamic):Null<flight._js.AbcFile>;
	@:native("readAbcInstructions")
	public static function readAbcInstructions(code:Dynamic):Null<Dynamic>;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAbcFile(ptr:flight._js.AbcFile):Void {}
}
