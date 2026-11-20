package flight._cpp._fn;

extern class Compression {
	@:native("flight_compress_deflate")
	public static function compressDeflate(bytes:cpp.Star<cpp.Void>, bytesLen:Int):cpp.Star<cpp.Void>;
	@:native("flight_compress_deflate_result_len")
	public static function compressDeflateResultLen(result:cpp.Star<cpp.Void>):Int;
	@:native("flight_compress_deflate_result_get")
	public static function compressDeflateResultGet(result:cpp.Star<cpp.Void>, index:Int):cpp.Star<cpp.Void>;
	@:native("flight_compress_deflate_result_free")
	public static function compressDeflateResultFree(result:cpp.Star<cpp.Void>):Void;
	@:native("flight_compress_deflate_zlib")
	public static function compressDeflateZlib(bytes:cpp.Star<cpp.Void>, bytesLen:Int):cpp.Star<cpp.Void>;
	@:native("flight_compress_deflate_zlib_result_len")
	public static function compressDeflateZlibResultLen(result:cpp.Star<cpp.Void>):Int;
	@:native("flight_compress_deflate_zlib_result_get")
	public static function compressDeflateZlibResultGet(result:cpp.Star<cpp.Void>, index:Int):cpp.Star<cpp.Void>;
	@:native("flight_compress_deflate_zlib_result_free")
	public static function compressDeflateZlibResultFree(result:cpp.Star<cpp.Void>):Void;
	@:native("flight_decompress_deflate")
	public static function decompressDeflate(compressed:cpp.Star<cpp.Void>, compressedLen:Int, uncompressedLength:Int, framing:Int):cpp.Star<cpp.Void>;
	@:native("flight_decompress_deflate_result_len")
	public static function decompressDeflateResultLen(result:cpp.Star<cpp.Void>):Int;
	@:native("flight_decompress_deflate_result_get")
	public static function decompressDeflateResultGet(result:cpp.Star<cpp.Void>, index:Int):cpp.Star<cpp.Void>;
	@:native("flight_decompress_deflate_result_free")
	public static function decompressDeflateResultFree(result:cpp.Star<cpp.Void>):Void;
	@:native("flight_decompress_lzma")
	public static function decompressLzma(compressed:cpp.Star<cpp.Void>, compressedLen:Int, uncompressedLength:Int, framing:Int):cpp.Star<cpp.Void>;
	@:native("flight_decompress_lzma_result_len")
	public static function decompressLzmaResultLen(result:cpp.Star<cpp.Void>):Int;
	@:native("flight_decompress_lzma_result_get")
	public static function decompressLzmaResultGet(result:cpp.Star<cpp.Void>, index:Int):cpp.Star<cpp.Void>;
	@:native("flight_decompress_lzma_result_free")
	public static function decompressLzmaResultFree(result:cpp.Star<cpp.Void>):Void;
	@:native("flight_compress_lzma")
	public static function compressLzma(bytes:cpp.Star<cpp.Void>, bytesLen:Int):cpp.Star<cpp.Void>;
	@:native("flight_compress_lzma_result_len")
	public static function compressLzmaResultLen(result:cpp.Star<cpp.Void>):Int;
	@:native("flight_compress_lzma_result_get")
	public static function compressLzmaResultGet(result:cpp.Star<cpp.Void>, index:Int):cpp.Star<cpp.Void>;
	@:native("flight_compress_lzma_result_free")
	public static function compressLzmaResultFree(result:cpp.Star<cpp.Void>):Void;
}

final class CompressDeflateByteResult extends flight._cpp.ByteResult {
	var handle:cpp.Pointer<cpp.Void>;

	public function new(handle:cpp.Pointer<cpp.Void>) {
		super(Compression.compressDeflateResultLen(handle.ptr));
		this.handle = handle;
	}

	override function freeNative():Void {
		Compression.compressDeflateResultFree(handle.ptr);
	}

	override function readNative(index:Int):Int {
		return untyped __cpp__("(int)*(const unsigned char *)({0})", Compression.compressDeflateResultGet(handle.ptr, index));
	}
}

final class CompressDeflateZlibByteResult extends flight._cpp.ByteResult {
	var handle:cpp.Pointer<cpp.Void>;

	public function new(handle:cpp.Pointer<cpp.Void>) {
		super(Compression.compressDeflateZlibResultLen(handle.ptr));
		this.handle = handle;
	}

	override function freeNative():Void {
		Compression.compressDeflateZlibResultFree(handle.ptr);
	}

	override function readNative(index:Int):Int {
		return untyped __cpp__("(int)*(const unsigned char *)({0})", Compression.compressDeflateZlibResultGet(handle.ptr, index));
	}
}

final class DecompressDeflateByteResult extends flight._cpp.ByteResult {
	var handle:cpp.Pointer<cpp.Void>;

	public function new(handle:cpp.Pointer<cpp.Void>) {
		super(Compression.decompressDeflateResultLen(handle.ptr));
		this.handle = handle;
	}

	public static function wrapOptional(handle:cpp.Star<cpp.Void>):Null<flight._cpp.ByteResult> {
		return untyped __cpp__("{0} == NULL", handle) ? null : new DecompressDeflateByteResult(cpp.Pointer.fromStar(handle));
	}

	override function freeNative():Void {
		Compression.decompressDeflateResultFree(handle.ptr);
	}

	override function readNative(index:Int):Int {
		return untyped __cpp__("(int)*(const unsigned char *)({0})", Compression.decompressDeflateResultGet(handle.ptr, index));
	}
}

final class DecompressLzmaByteResult extends flight._cpp.ByteResult {
	var handle:cpp.Pointer<cpp.Void>;

	public function new(handle:cpp.Pointer<cpp.Void>) {
		super(Compression.decompressLzmaResultLen(handle.ptr));
		this.handle = handle;
	}

	public static function wrapOptional(handle:cpp.Star<cpp.Void>):Null<flight._cpp.ByteResult> {
		return untyped __cpp__("{0} == NULL", handle) ? null : new DecompressLzmaByteResult(cpp.Pointer.fromStar(handle));
	}

	override function freeNative():Void {
		Compression.decompressLzmaResultFree(handle.ptr);
	}

	override function readNative(index:Int):Int {
		return untyped __cpp__("(int)*(const unsigned char *)({0})", Compression.decompressLzmaResultGet(handle.ptr, index));
	}
}

final class CompressLzmaByteResult extends flight._cpp.ByteResult {
	var handle:cpp.Pointer<cpp.Void>;

	public function new(handle:cpp.Pointer<cpp.Void>) {
		super(Compression.compressLzmaResultLen(handle.ptr));
		this.handle = handle;
	}

	override function freeNative():Void {
		Compression.compressLzmaResultFree(handle.ptr);
	}

	override function readNative(index:Int):Int {
		return untyped __cpp__("(int)*(const unsigned char *)({0})", Compression.compressLzmaResultGet(handle.ptr, index));
	}
}
