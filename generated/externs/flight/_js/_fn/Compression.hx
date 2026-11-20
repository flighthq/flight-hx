package flight._js._fn;

@:jsRequire("@flighthq/compression")
extern class Compression {
	@:native("compressDeflate")
	public static function compressDeflate(bytes:Dynamic):flight._js.ByteResult;
	@:native("compressDeflateZlib")
	public static function compressDeflateZlib(bytes:Dynamic):flight._js.ByteResult;
	@:native("decompressDeflate")
	public static function decompressDeflate(compressed:Dynamic, uncompressedLength:Int, framing:Dynamic):Null<flight._js.ByteResult>;
	@:native("decompressLzma")
	public static function decompressLzma(compressed:Dynamic, uncompressedLength:Int, framing:Dynamic):Null<flight._js.ByteResult>;
	@:native("compressLzma")
	public static function compressLzma(bytes:Dynamic):flight._js.ByteResult;
}
