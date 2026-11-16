package flight;

extern inline function compressDeflate(bytes:Dynamic, bytesLen:Int):Dynamic {
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
extern inline function compressDeflateZlib(bytes:Dynamic, bytesLen:Int):Dynamic {
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
extern inline function decompressDeflate(compressed:Dynamic, compressedLen:Int, uncompressedLength:Int, framing:flight.CompressionFraming):Dynamic {
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
extern inline function decompressLzma(compressed:Dynamic, compressedLen:Int, uncompressedLength:Int, framing:flight.CompressionFraming):Dynamic {
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
extern inline function compressLzma(bytes:Dynamic, bytesLen:Int):Dynamic {
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
extern inline function getCompressionString(value:Int):String {
#if hl
	return cast flight._hl._fn.Compression.getCompressionString(value);
#elseif cpp
	return cast flight._cpp._fn.Compression.getCompressionString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Compression.getCompressionString(value);
#else
	#error "flight.Compression: no backend for this target."
#end
}
extern inline function parseCompression(value:String):Int {
#if hl
	return flight._hl._fn.Compression.parseCompression(cast value);
#elseif cpp
	return flight._cpp._fn.Compression.parseCompression(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Compression.parseCompression(value);
#else
	#error "flight.Compression: no backend for this target."
#end
}
