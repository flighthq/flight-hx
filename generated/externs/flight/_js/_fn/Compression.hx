package flight._js._fn;

@:jsRequire("@flighthq/compression")
extern class Compression {
	@:native("compressDeflate")
	public static function compressDeflate(bytes:Dynamic):Dynamic;
	@:native("compressDeflateZlib")
	public static function compressDeflateZlib(bytes:Dynamic):Dynamic;
	@:native("decompressDeflate")
	public static function decompressDeflate(compressed:Dynamic, uncompressedLength:Int, framing:Dynamic):Null<Dynamic>;
	@:native("decompressLzma")
	public static function decompressLzma(compressed:Dynamic, uncompressedLength:Int, framing:Dynamic):Null<Dynamic>;
	@:native("compressLzma")
	public static function compressLzma(bytes:Dynamic):Dynamic;
	@:native("getCompressionString")
	public static function getCompressionString(value:Dynamic):String;
	@:native("parseCompression")
	public static function parseCompression(value:String):Null<Dynamic>;
}
