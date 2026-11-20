package flight;

#if (js && flight_esm)
extern inline function decodeUtf8(bytes:Dynamic, offset:Null<Int>, length:Null<Int>):String {
	return flight._js._fn.Encoding.decodeUtf8(bytes, offset, length);
}
#else
extern inline function decodeUtf8(bytes:Dynamic, bytesLen:Int, offset:haxe.Int64, length:haxe.Int64):String {
#if hl
	return cast flight._hl._fn.Encoding.decodeUtf8(bytes, bytesLen, offset, length);
#elseif cpp
	return cast flight._cpp._fn.Encoding.decodeUtf8(bytes, bytesLen, offset, length);
#elseif (js && flight_esm)
	return cast flight._js._fn.Encoding.decodeUtf8(bytes, bytesLen, offset, length);
#else
	#error "flight.Encoding: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function encodeUtf8(text:String):ByteResult {
	return flight._js._fn.Encoding.encodeUtf8(text);
}
#else
extern inline function encodeUtf8(text:String):ByteResult {
#if hl
	return new flight._hl._fn.Encoding.EncodeUtf8ByteResult(flight._hl._fn.Encoding.encodeUtf8(cast text));
#elseif cpp
	return new flight._cpp._fn.Encoding.EncodeUtf8ByteResult(cpp.Pointer.fromStar(flight._cpp._fn.Encoding.encodeUtf8(cast text)));
#elseif (js && flight_esm)
	return flight._js._fn.Encoding.encodeUtf8(text);
#else
	#error "flight.Encoding: no backend for this target."
#end
}
#end
