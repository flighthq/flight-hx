package flight._js._fn;

@:jsRequire("flight")
extern class Compression {
	@:native("flight_compress_deflate")
	public static function compressDeflate(bytes:Dynamic, bytesLen:Int):Dynamic;
	@:native("flight_compress_deflate_zlib")
	public static function compressDeflateZlib(bytes:Dynamic, bytesLen:Int):Dynamic;
	@:native("flight_decompress_deflate")
	public static function decompressDeflate(compressed:Dynamic, compressedLen:Int, uncompressedLength:Int, framing:Int):Dynamic;
	@:native("flight_decompress_lzma")
	public static function decompressLzma(compressed:Dynamic, compressedLen:Int, uncompressedLength:Int, framing:Int):Dynamic;
	@:native("flight_compress_lzma")
	public static function compressLzma(bytes:Dynamic, bytesLen:Int):Dynamic;
	@:native("flight_get_compression_string")
	public static function getCompressionString(value:Int):String;
	@:native("flight_parse_compression")
	public static function parseCompression(value:String):Int;
}
