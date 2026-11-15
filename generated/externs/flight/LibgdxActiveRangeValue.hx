package flight;

#if hl

typedef LibgdxActiveRangeValue = flight._hl.LibgdxActiveRangeValue;

#elseif cpp

typedef LibgdxActiveRangeValue = flight._cpp.LibgdxActiveRangeValue;

#elseif (js && flight_esm)

typedef LibgdxActiveRangeValue = flight._js.LibgdxActiveRangeValue;

#elseif js

#error "flight.LibgdxActiveRangeValue on js requires flight_esm."

#else

#error "flight.LibgdxActiveRangeValue: no backend for this target."

#end
