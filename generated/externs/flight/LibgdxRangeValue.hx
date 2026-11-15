package flight;

#if hl

typedef LibgdxRangeValue = flight._hl.LibgdxRangeValue;

#elseif cpp

typedef LibgdxRangeValue = flight._cpp.LibgdxRangeValue;

#elseif (js && flight_esm)

typedef LibgdxRangeValue = flight._js.LibgdxRangeValue;

#elseif js

#error "flight.LibgdxRangeValue on js requires flight_esm."

#else

#error "flight.LibgdxRangeValue: no backend for this target."

#end
