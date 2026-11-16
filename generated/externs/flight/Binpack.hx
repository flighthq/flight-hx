package flight;

#if (js && flight_esm)
extern inline function explainUnpackedRectangles(out:Dynamic, rectangles:Dynamic, options:Null<BinPackOptions>):Void {
	flight._js._fn.Binpack.explainUnpackedRectangles(out, rectangles, options);
}
#else
extern inline function explainUnpackedRectangles(out:Dynamic, rectangles:Dynamic, rectanglesLen:Int, options:BinPackOptions):Void {
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
#end
#if (js && flight_esm)
extern inline function getPackResultOccupancy(result:PackResult):Float {
	return flight._js._fn.Binpack.getPackResultOccupancy(result);
}
#else
extern inline function getPackResultOccupancy(result:PackResult):Float {
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
#end
#if (js && flight_esm)
extern inline function packRectangles(rects:Dynamic, options:Null<BinPackOptions>):PackResult {
	return flight._js._fn.Binpack.packRectangles(rects, options);
}
#else
extern inline function packRectangles(rects:Dynamic, rectsLen:Int, options:BinPackOptions):PackResult {
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
#end
#if (js && flight_esm)
extern inline function freePackResult(ptr:PackResult):Void {
	flight._js._fn.Binpack.freePackResult(ptr);
}
#else
extern inline function freePackResult(ptr:PackResult):Void {
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
#end
