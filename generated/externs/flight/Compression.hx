package flight;

#if (js && flight_esm)
extern inline function compressDeflate(bytes:Dynamic):Dynamic {
	return flight._js._fn.Compression.compressDeflate(bytes);
}
#else
extern inline function compressDeflate(bytes:Dynamic, bytesLen:Int):flight.NativeByteBuffer {
#if hl
	return flight._hl._fn.Compression.compressDeflate(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.Compression.compressDeflate(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.Compression.compressDeflate(bytes, bytesLen);
#else
	#error "flight.Compression: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function compressDeflateZlib(bytes:Dynamic):Dynamic {
	return flight._js._fn.Compression.compressDeflateZlib(bytes);
}
#else
extern inline function compressDeflateZlib(bytes:Dynamic, bytesLen:Int):flight.NativeByteBuffer {
#if hl
	return flight._hl._fn.Compression.compressDeflateZlib(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.Compression.compressDeflateZlib(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.Compression.compressDeflateZlib(bytes, bytesLen);
#else
	#error "flight.Compression: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function decompressDeflate(compressed:Dynamic, uncompressedLength:Int, framing:Dynamic):Null<Dynamic> {
	return flight._js._fn.Compression.decompressDeflate(compressed, uncompressedLength, framing);
}
#else
extern inline function decompressDeflate(compressed:Dynamic, compressedLen:Int, uncompressedLength:Int, framing:flight.CompressionFraming):Null<flight.NativeByteBuffer> {
#if hl
	return flight._hl._fn.Compression.decompressDeflate(compressed, compressedLen, uncompressedLength, framing);
#elseif cpp
	return flight._cpp._fn.Compression.decompressDeflate(compressed, compressedLen, uncompressedLength, framing);
#elseif (js && flight_esm)
	return flight._js._fn.Compression.decompressDeflate(compressed, compressedLen, uncompressedLength, framing);
#else
	#error "flight.Compression: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function decompressLzma(compressed:Dynamic, uncompressedLength:Int, framing:Dynamic):Null<Dynamic> {
	return flight._js._fn.Compression.decompressLzma(compressed, uncompressedLength, framing);
}
#else
extern inline function decompressLzma(compressed:Dynamic, compressedLen:Int, uncompressedLength:Int, framing:flight.CompressionFraming):Null<flight.NativeByteBuffer> {
#if hl
	return flight._hl._fn.Compression.decompressLzma(compressed, compressedLen, uncompressedLength, framing);
#elseif cpp
	return flight._cpp._fn.Compression.decompressLzma(compressed, compressedLen, uncompressedLength, framing);
#elseif (js && flight_esm)
	return flight._js._fn.Compression.decompressLzma(compressed, compressedLen, uncompressedLength, framing);
#else
	#error "flight.Compression: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function compressLzma(bytes:Dynamic):Dynamic {
	return flight._js._fn.Compression.compressLzma(bytes);
}
#else
extern inline function compressLzma(bytes:Dynamic, bytesLen:Int):flight.NativeByteBuffer {
#if hl
	return flight._hl._fn.Compression.compressLzma(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.Compression.compressLzma(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.Compression.compressLzma(bytes, bytesLen);
#else
	#error "flight.Compression: no backend for this target."
#end
}
#end
