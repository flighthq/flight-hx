package flight._cpp._fn;

extern class Abc {
	@:native("flight_read_abc_file")
	public static function readAbcFile(source:cpp.Star<cpp.Void>, sourceLen:Int):flight._cpp.AbcFile;
	@:native("flight_read_abc_instructions")
	public static function readAbcInstructions(code:cpp.Star<cpp.Void>, codeLen:Int):cpp.Star<cpp.Void>;
	@:native("flight_free_abc_file")
	public static function freeAbcFile(ptr:flight._cpp.AbcFile):Void;
}
