package flight;

#if (js && flight_esm)
extern inline function detectImageMimeType(data:Dynamic):Null<String> {
	return flight._js._fn.ImageCodec.detectImageMimeType(data);
}
#else
extern inline function detectImageMimeType(data:Dynamic, dataLen:Int):String {
#if hl
	return cast flight._hl._fn.ImageCodec.detectImageMimeType(data, dataLen);
#elseif cpp
	return cast flight._cpp._fn.ImageCodec.detectImageMimeType(data, dataLen);
#elseif (js && flight_esm)
	return cast flight._js._fn.ImageCodec.detectImageMimeType(data, dataLen);
#else
	#error "flight.ImageCodec: no backend for this target."
#end
}
#end
