package flight._hl._fn;

extern class Compression {
	@:hlNative("flight", "flight_compress_deflate")
	public static function compressDeflate(bytes:hl.Bytes, bytesLen:Int):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_compress_deflate_zlib")
	public static function compressDeflateZlib(bytes:hl.Bytes, bytesLen:Int):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_decompress_deflate")
	public static function decompressDeflate(compressed:hl.Bytes, compressedLen:Int, uncompressedLength:Int, framing:Int):Null<flight._hl.NativeByteBuffer>;
	@:hlNative("flight", "flight_decompress_lzma")
	public static function decompressLzma(compressed:hl.Bytes, compressedLen:Int, uncompressedLength:Int, framing:Int):Null<flight._hl.NativeByteBuffer>;
	@:hlNative("flight", "flight_compress_lzma")
	public static function compressLzma(bytes:hl.Bytes, bytesLen:Int):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_get_compression_string")
	public static function getCompressionString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_compression")
	public static function parseCompression(value:hl.Bytes):Int;
}
