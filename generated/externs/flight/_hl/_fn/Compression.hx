package flight._hl._fn;

extern class Compression {
	@:hlNative("flight", "flight_compress_deflate")
	public static function compressDeflate(bytes:hl.Bytes, bytesLen:Int):hl.Bytes;
	@:hlNative("flight", "flight_compress_deflate_result_len")
	public static function compressDeflateResultLen(result:hl.Bytes):Int;
	@:hlNative("flight", "flight_compress_deflate_result_get")
	public static function compressDeflateResultGet(result:hl.Bytes, index:Int):hl.Bytes;
	@:hlNative("flight", "flight_compress_deflate_result_free")
	public static function compressDeflateResultFree(result:hl.Bytes):Void;
	@:hlNative("flight", "flight_compress_deflate_zlib")
	public static function compressDeflateZlib(bytes:hl.Bytes, bytesLen:Int):hl.Bytes;
	@:hlNative("flight", "flight_compress_deflate_zlib_result_len")
	public static function compressDeflateZlibResultLen(result:hl.Bytes):Int;
	@:hlNative("flight", "flight_compress_deflate_zlib_result_get")
	public static function compressDeflateZlibResultGet(result:hl.Bytes, index:Int):hl.Bytes;
	@:hlNative("flight", "flight_compress_deflate_zlib_result_free")
	public static function compressDeflateZlibResultFree(result:hl.Bytes):Void;
	@:hlNative("flight", "flight_decompress_deflate")
	public static function decompressDeflate(compressed:hl.Bytes, compressedLen:Int, uncompressedLength:Int, framing:Int):hl.Bytes;
	@:hlNative("flight", "flight_decompress_deflate_result_len")
	public static function decompressDeflateResultLen(result:hl.Bytes):Int;
	@:hlNative("flight", "flight_decompress_deflate_result_get")
	public static function decompressDeflateResultGet(result:hl.Bytes, index:Int):hl.Bytes;
	@:hlNative("flight", "flight_decompress_deflate_result_free")
	public static function decompressDeflateResultFree(result:hl.Bytes):Void;
	@:hlNative("flight", "flight_decompress_lzma")
	public static function decompressLzma(compressed:hl.Bytes, compressedLen:Int, uncompressedLength:Int, framing:Int):hl.Bytes;
	@:hlNative("flight", "flight_decompress_lzma_result_len")
	public static function decompressLzmaResultLen(result:hl.Bytes):Int;
	@:hlNative("flight", "flight_decompress_lzma_result_get")
	public static function decompressLzmaResultGet(result:hl.Bytes, index:Int):hl.Bytes;
	@:hlNative("flight", "flight_decompress_lzma_result_free")
	public static function decompressLzmaResultFree(result:hl.Bytes):Void;
	@:hlNative("flight", "flight_compress_lzma")
	public static function compressLzma(bytes:hl.Bytes, bytesLen:Int):hl.Bytes;
	@:hlNative("flight", "flight_compress_lzma_result_len")
	public static function compressLzmaResultLen(result:hl.Bytes):Int;
	@:hlNative("flight", "flight_compress_lzma_result_get")
	public static function compressLzmaResultGet(result:hl.Bytes, index:Int):hl.Bytes;
	@:hlNative("flight", "flight_compress_lzma_result_free")
	public static function compressLzmaResultFree(result:hl.Bytes):Void;
}

final class CompressDeflateByteResult extends flight._hl.ByteResult {
	var handle:hl.Bytes;

	public function new(handle:hl.Bytes) {
		super(Compression.compressDeflateResultLen(handle));
		this.handle = handle;
	}

	override function freeNative():Void {
		Compression.compressDeflateResultFree(handle);
	}

	override function readNative(index:Int):Int {
		return Compression.compressDeflateResultGet(handle, index).getUI8(0);
	}
}

final class CompressDeflateZlibByteResult extends flight._hl.ByteResult {
	var handle:hl.Bytes;

	public function new(handle:hl.Bytes) {
		super(Compression.compressDeflateZlibResultLen(handle));
		this.handle = handle;
	}

	override function freeNative():Void {
		Compression.compressDeflateZlibResultFree(handle);
	}

	override function readNative(index:Int):Int {
		return Compression.compressDeflateZlibResultGet(handle, index).getUI8(0);
	}
}

final class DecompressDeflateByteResult extends flight._hl.ByteResult {
	var handle:hl.Bytes;

	public function new(handle:hl.Bytes) {
		super(Compression.decompressDeflateResultLen(handle));
		this.handle = handle;
	}

	public static function wrapOptional(handle:hl.Bytes):Null<flight._hl.ByteResult> {
		return handle == null ? null : new DecompressDeflateByteResult(handle);
	}

	override function freeNative():Void {
		Compression.decompressDeflateResultFree(handle);
	}

	override function readNative(index:Int):Int {
		return Compression.decompressDeflateResultGet(handle, index).getUI8(0);
	}
}

final class DecompressLzmaByteResult extends flight._hl.ByteResult {
	var handle:hl.Bytes;

	public function new(handle:hl.Bytes) {
		super(Compression.decompressLzmaResultLen(handle));
		this.handle = handle;
	}

	public static function wrapOptional(handle:hl.Bytes):Null<flight._hl.ByteResult> {
		return handle == null ? null : new DecompressLzmaByteResult(handle);
	}

	override function freeNative():Void {
		Compression.decompressLzmaResultFree(handle);
	}

	override function readNative(index:Int):Int {
		return Compression.decompressLzmaResultGet(handle, index).getUI8(0);
	}
}

final class CompressLzmaByteResult extends flight._hl.ByteResult {
	var handle:hl.Bytes;

	public function new(handle:hl.Bytes) {
		super(Compression.compressLzmaResultLen(handle));
		this.handle = handle;
	}

	override function freeNative():Void {
		Compression.compressLzmaResultFree(handle);
	}

	override function readNative(index:Int):Int {
		return Compression.compressLzmaResultGet(handle, index).getUI8(0);
	}
}
