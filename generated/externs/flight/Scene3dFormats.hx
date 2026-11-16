package flight;

#if (js && flight_esm)
extern inline function createAwd2ParseState():Awd2ParseState {
	return flight._js._fn.Scene3dFormats.createAwd2ParseState();
}
#else
extern inline function createAwd2ParseState():Awd2ParseState {
#if hl
	return flight._hl._fn.Scene3dFormats.createAwd2ParseState();
#elseif cpp
	return flight._cpp._fn.Scene3dFormats.createAwd2ParseState();
#elseif (js && flight_esm)
	return flight._js._fn.Scene3dFormats.createAwd2ParseState();
#else
	#error "flight.Scene3dFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAwd2ParseState(ptr:Awd2ParseState):Void {
	flight._js._fn.Scene3dFormats.freeAwd2ParseState(ptr);
}
#else
extern inline function freeAwd2ParseState(ptr:Awd2ParseState):Void {
#if hl
	flight._hl._fn.Scene3dFormats.freeAwd2ParseState(ptr);
#elseif cpp
	flight._cpp._fn.Scene3dFormats.freeAwd2ParseState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene3dFormats.freeAwd2ParseState(ptr);
#else
	#error "flight.Scene3dFormats: no backend for this target."
#end
}
#end
