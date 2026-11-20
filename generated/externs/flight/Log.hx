package flight;

#if (js && flight_esm)
extern inline function freeLogTimer(ptr:LogTimer):Void {
	flight._js._fn.Log.freeLogTimer(ptr);
}
#else
extern inline function freeLogTimer(ptr:LogTimer):Void {
#if hl
	flight._hl._fn.Log.freeLogTimer(ptr);
#elseif cpp
	flight._cpp._fn.Log.freeLogTimer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Log.freeLogTimer(ptr);
#else
	#error "flight.Log: no backend for this target."
#end
}
#end
