package flight._cpp._fn;

extern class Compression {
	@:native("flight_compress_deflate")
	public static function compressDeflate(bytes:cpp.Star<cpp.Void>, bytesLen:Int):flight._cpp.NativeByteBuffer;
	@:native("flight_compress_deflate_zlib")
	public static function compressDeflateZlib(bytes:cpp.Star<cpp.Void>, bytesLen:Int):flight._cpp.NativeByteBuffer;
	@:native("flight_decompress_deflate")
	public static function decompressDeflate(compressed:cpp.Star<cpp.Void>, compressedLen:Int, uncompressedLength:Int, framing:Int):Null<flight._cpp.NativeByteBuffer>;
	@:native("flight_decompress_lzma")
	public static function decompressLzma(compressed:cpp.Star<cpp.Void>, compressedLen:Int, uncompressedLength:Int, framing:Int):Null<flight._cpp.NativeByteBuffer>;
	@:native("flight_compress_lzma")
	public static function compressLzma(bytes:cpp.Star<cpp.Void>, bytesLen:Int):flight._cpp.NativeByteBuffer;
	@:native("flight_get_compression_string")
	public static function getCompressionString(value:Int):cpp.ConstCharStar;
	@:native("flight_parse_compression")
	public static function parseCompression(value:cpp.ConstCharStar):Int;
}
