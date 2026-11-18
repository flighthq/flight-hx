package flight;

#if (js && flight_esm)
extern inline function createByteReader(bytes:Dynamic, offset:Null<Int>):ByteReader {
	return flight._js._fn.Buffer.createByteReader(bytes, offset);
}
#else
extern inline function createByteReader(bytes:Dynamic, bytesLen:Int, offset:haxe.Int64):ByteReader {
#if hl
	return flight._hl._fn.Buffer.createByteReader(bytes, bytesLen, offset);
#elseif cpp
	return flight._cpp._fn.Buffer.createByteReader(bytes, bytesLen, offset);
#elseif (js && flight_esm)
	return flight._js._fn.Buffer.createByteReader(bytes, bytesLen, offset);
#else
	#error "flight.Buffer: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasByteReaderBytes(reader:ByteReader, count:Int):Bool {
	return flight._js._fn.Buffer.hasByteReaderBytes(reader, count);
}
#else
extern inline function hasByteReaderBytes(reader:ByteReader, count:Int):Bool {
#if hl
	return flight._hl._fn.Buffer.hasByteReaderBytes(reader, count);
#elseif cpp
	return flight._cpp._fn.Buffer.hasByteReaderBytes(reader, count);
#elseif (js && flight_esm)
	return flight._js._fn.Buffer.hasByteReaderBytes(reader, count);
#else
	#error "flight.Buffer: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readByteReaderU16(reader:ByteReader):Int {
	return flight._js._fn.Buffer.readByteReaderU16(reader);
}
#else
extern inline function readByteReaderU16(reader:ByteReader):Int {
#if hl
	return flight._hl._fn.Buffer.readByteReaderU16(reader);
#elseif cpp
	return flight._cpp._fn.Buffer.readByteReaderU16(reader);
#elseif (js && flight_esm)
	return flight._js._fn.Buffer.readByteReaderU16(reader);
#else
	#error "flight.Buffer: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readByteReaderU24(reader:ByteReader):Int {
	return flight._js._fn.Buffer.readByteReaderU24(reader);
}
#else
extern inline function readByteReaderU24(reader:ByteReader):Int {
#if hl
	return flight._hl._fn.Buffer.readByteReaderU24(reader);
#elseif cpp
	return flight._cpp._fn.Buffer.readByteReaderU24(reader);
#elseif (js && flight_esm)
	return flight._js._fn.Buffer.readByteReaderU24(reader);
#else
	#error "flight.Buffer: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readByteReaderU24BigEndian(reader:ByteReader):Int {
	return flight._js._fn.Buffer.readByteReaderU24BigEndian(reader);
}
#else
extern inline function readByteReaderU24BigEndian(reader:ByteReader):Int {
#if hl
	return flight._hl._fn.Buffer.readByteReaderU24BigEndian(reader);
#elseif cpp
	return flight._cpp._fn.Buffer.readByteReaderU24BigEndian(reader);
#elseif (js && flight_esm)
	return flight._js._fn.Buffer.readByteReaderU24BigEndian(reader);
#else
	#error "flight.Buffer: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readByteReaderU32(reader:ByteReader):Int {
	return flight._js._fn.Buffer.readByteReaderU32(reader);
}
#else
extern inline function readByteReaderU32(reader:ByteReader):Int {
#if hl
	return flight._hl._fn.Buffer.readByteReaderU32(reader);
#elseif cpp
	return flight._cpp._fn.Buffer.readByteReaderU32(reader);
#elseif (js && flight_esm)
	return flight._js._fn.Buffer.readByteReaderU32(reader);
#else
	#error "flight.Buffer: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readByteReaderU32BigEndian(reader:ByteReader):Int {
	return flight._js._fn.Buffer.readByteReaderU32BigEndian(reader);
}
#else
extern inline function readByteReaderU32BigEndian(reader:ByteReader):Int {
#if hl
	return flight._hl._fn.Buffer.readByteReaderU32BigEndian(reader);
#elseif cpp
	return flight._cpp._fn.Buffer.readByteReaderU32BigEndian(reader);
#elseif (js && flight_esm)
	return flight._js._fn.Buffer.readByteReaderU32BigEndian(reader);
#else
	#error "flight.Buffer: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readByteReaderU64(reader:ByteReader):Float {
	return flight._js._fn.Buffer.readByteReaderU64(reader);
}
#else
extern inline function readByteReaderU64(reader:ByteReader):haxe.Int64 {
#if hl
	return flight._hl._fn.Buffer.readByteReaderU64(reader);
#elseif cpp
	return flight._cpp._fn.Buffer.readByteReaderU64(reader);
#elseif (js && flight_esm)
	return flight._js._fn.Buffer.readByteReaderU64(reader);
#else
	#error "flight.Buffer: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readByteReaderU8(reader:ByteReader):Int {
	return flight._js._fn.Buffer.readByteReaderU8(reader);
}
#else
extern inline function readByteReaderU8(reader:ByteReader):Int {
#if hl
	return flight._hl._fn.Buffer.readByteReaderU8(reader);
#elseif cpp
	return flight._cpp._fn.Buffer.readByteReaderU8(reader);
#elseif (js && flight_esm)
	return flight._js._fn.Buffer.readByteReaderU8(reader);
#else
	#error "flight.Buffer: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function skipByteReader(reader:ByteReader, count:Int):Void {
	flight._js._fn.Buffer.skipByteReader(reader, count);
}
#else
extern inline function skipByteReader(reader:ByteReader, count:Int):Void {
#if hl
	flight._hl._fn.Buffer.skipByteReader(reader, count);
#elseif cpp
	flight._cpp._fn.Buffer.skipByteReader(reader, count);
#elseif (js && flight_esm)
	flight._js._fn.Buffer.skipByteReader(reader, count);
#else
	#error "flight.Buffer: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeOwnedByteReader(ptr:ByteReader):Void {
	flight._js._fn.Buffer.freeOwnedByteReader(ptr);
}
#else
extern inline function freeOwnedByteReader(ptr:ByteReader):Void {
#if hl
	flight._hl._fn.Buffer.freeOwnedByteReader(ptr);
#elseif cpp
	flight._cpp._fn.Buffer.freeOwnedByteReader(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Buffer.freeOwnedByteReader(ptr);
#else
	#error "flight.Buffer: no backend for this target."
#end
}
#end
