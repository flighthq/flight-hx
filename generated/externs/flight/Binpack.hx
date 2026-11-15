package flight;

inline function explainUnpackedRectangles(out:Dynamic, rectangles:Dynamic, rectanglesLen:Int, options:BinPackOptions):Void {
#if hl
	flight._hl._fn.Binpack.explainUnpackedRectangles(out, rectangles, rectanglesLen, options);
#elseif cpp
	flight._cpp._fn.Binpack.explainUnpackedRectangles(out, rectangles, rectanglesLen, options);
#elseif (js && flight_esm)
	flight._js._fn.Binpack.explainUnpackedRectangles(out, rectangles, rectanglesLen, options);
#else
	#error "flight.Binpack: no backend for this target."
#end
}
inline function getPackResultOccupancy(result:PackResult):Float {
#if hl
	return flight._hl._fn.Binpack.getPackResultOccupancy(result);
#elseif cpp
	return flight._cpp._fn.Binpack.getPackResultOccupancy(result);
#elseif (js && flight_esm)
	return flight._js._fn.Binpack.getPackResultOccupancy(result);
#else
	#error "flight.Binpack: no backend for this target."
#end
}
inline function packRectangles(rects:Dynamic, rectsLen:Int, options:BinPackOptions):PackResult {
#if hl
	return flight._hl._fn.Binpack.packRectangles(rects, rectsLen, options);
#elseif cpp
	return flight._cpp._fn.Binpack.packRectangles(rects, rectsLen, options);
#elseif (js && flight_esm)
	return flight._js._fn.Binpack.packRectangles(rects, rectsLen, options);
#else
	#error "flight.Binpack: no backend for this target."
#end
}
inline function freePackResult(ptr:PackResult):Void {
#if hl
	flight._hl._fn.Binpack.freePackResult(ptr);
#elseif cpp
	flight._cpp._fn.Binpack.freePackResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Binpack.freePackResult(ptr);
#else
	#error "flight.Binpack: no backend for this target."
#end
}
