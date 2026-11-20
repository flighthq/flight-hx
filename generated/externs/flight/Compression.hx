package flight;

#if (js && flight_esm)
extern inline function compressDeflate(bytes:Dynamic):ByteResult {
	return flight._js._fn.Compression.compressDeflate(bytes);
}
#else
extern inline function compressDeflate(bytes:Dynamic, bytesLen:Int):ByteResult {
#if hl
	return new flight._hl._fn.Compression.CompressDeflateByteResult(flight._hl._fn.Compression.compressDeflate(bytes, bytesLen));
#elseif cpp
	return new flight._cpp._fn.Compression.CompressDeflateByteResult(cpp.Pointer.fromStar(flight._cpp._fn.Compression.compressDeflate(bytes, bytesLen)));
#elseif (js && flight_esm)
	return flight._js._fn.Compression.compressDeflate(bytes, bytesLen);
#else
	#error "flight.Compression: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function compressDeflateZlib(bytes:Dynamic):ByteResult {
	return flight._js._fn.Compression.compressDeflateZlib(bytes);
}
#else
extern inline function compressDeflateZlib(bytes:Dynamic, bytesLen:Int):ByteResult {
#if hl
	return new flight._hl._fn.Compression.CompressDeflateZlibByteResult(flight._hl._fn.Compression.compressDeflateZlib(bytes, bytesLen));
#elseif cpp
	return new flight._cpp._fn.Compression.CompressDeflateZlibByteResult(cpp.Pointer.fromStar(flight._cpp._fn.Compression.compressDeflateZlib(bytes, bytesLen)));
#elseif (js && flight_esm)
	return flight._js._fn.Compression.compressDeflateZlib(bytes, bytesLen);
#else
	#error "flight.Compression: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function decompressDeflate(compressed:Dynamic, uncompressedLength:Int, framing:Dynamic):Null<ByteResult> {
	return flight._js._fn.Compression.decompressDeflate(compressed, uncompressedLength, framing);
}
#else
extern inline function decompressDeflate(compressed:Dynamic, compressedLen:Int, uncompressedLength:Int, framing:flight.CompressionFraming):Null<ByteResult> {
#if hl
	return flight._hl._fn.Compression.DecompressDeflateByteResult.wrapOptional(flight._hl._fn.Compression.decompressDeflate(compressed, compressedLen, uncompressedLength, framing));
#elseif cpp
	return flight._cpp._fn.Compression.DecompressDeflateByteResult.wrapOptional(flight._cpp._fn.Compression.decompressDeflate(compressed, compressedLen, uncompressedLength, framing));
#elseif (js && flight_esm)
	return flight._js._fn.Compression.decompressDeflate(compressed, compressedLen, uncompressedLength, framing);
#else
	#error "flight.Compression: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function decompressLzma(compressed:Dynamic, uncompressedLength:Int, framing:Dynamic):Null<ByteResult> {
	return flight._js._fn.Compression.decompressLzma(compressed, uncompressedLength, framing);
}
#else
extern inline function decompressLzma(compressed:Dynamic, compressedLen:Int, uncompressedLength:Int, framing:flight.CompressionFraming):Null<ByteResult> {
#if hl
	return flight._hl._fn.Compression.DecompressLzmaByteResult.wrapOptional(flight._hl._fn.Compression.decompressLzma(compressed, compressedLen, uncompressedLength, framing));
#elseif cpp
	return flight._cpp._fn.Compression.DecompressLzmaByteResult.wrapOptional(flight._cpp._fn.Compression.decompressLzma(compressed, compressedLen, uncompressedLength, framing));
#elseif (js && flight_esm)
	return flight._js._fn.Compression.decompressLzma(compressed, compressedLen, uncompressedLength, framing);
#else
	#error "flight.Compression: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function compressLzma(bytes:Dynamic):ByteResult {
	return flight._js._fn.Compression.compressLzma(bytes);
}
#else
extern inline function compressLzma(bytes:Dynamic, bytesLen:Int):ByteResult {
#if hl
	return new flight._hl._fn.Compression.CompressLzmaByteResult(flight._hl._fn.Compression.compressLzma(bytes, bytesLen));
#elseif cpp
	return new flight._cpp._fn.Compression.CompressLzmaByteResult(cpp.Pointer.fromStar(flight._cpp._fn.Compression.compressLzma(bytes, bytesLen)));
#elseif (js && flight_esm)
	return flight._js._fn.Compression.compressLzma(bytes, bytesLen);
#else
	#error "flight.Compression: no backend for this target."
#end
}
#end
