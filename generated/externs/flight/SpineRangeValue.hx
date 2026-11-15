package flight;

#if hl

typedef SpineRangeValue = flight._hl.SpineRangeValue;

#elseif cpp

typedef SpineRangeValue = flight._cpp.SpineRangeValue;

#elseif (js && flight_esm)

typedef SpineRangeValue = flight._js.SpineRangeValue;

#elseif js

#error "flight.SpineRangeValue on js requires flight_esm."

#else

#error "flight.SpineRangeValue: no backend for this target."

#end
