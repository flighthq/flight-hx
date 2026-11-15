package flight._hl._fn;

extern class Abc {
	@:hlNative("flight", "flight_read_abc_file")
	public static function readAbcFile(source:hl.Bytes, sourceLen:Int):Dynamic;
	@:hlNative("flight", "flight_read_abc_instructions")
	public static function readAbcInstructions(code:hl.Bytes, codeLen:Int):Dynamic;
	@:hlNative("flight", "flight_free_abc_file")
	public static function freeAbcFile(ptr:flight._hl.AbcFile):Void;
}
