package flight._js._fn;

@:jsRequire("flight")
extern class Abc {
	@:native("flight_read_abc_file")
	public static function readAbcFile(source:Dynamic, sourceLen:Int):Dynamic;
	@:native("flight_read_abc_instructions")
	public static function readAbcInstructions(code:Dynamic, codeLen:Int):Dynamic;
	@:native("flight_free_abc_file")
	public static function freeAbcFile(ptr:flight._js.AbcFile):Void;
}
