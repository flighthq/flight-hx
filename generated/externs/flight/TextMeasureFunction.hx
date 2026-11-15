package flight;

#if hl

typedef TextMeasureFunction = flight._hl.TextMeasureFunction;

#elseif cpp

typedef TextMeasureFunction = flight._cpp.TextMeasureFunction;

#elseif (js && flight_esm)

typedef TextMeasureFunction = flight._js.TextMeasureFunction;

#elseif js

#error "flight.TextMeasureFunction on js requires flight_esm."

#else

#error "flight.TextMeasureFunction: no backend for this target."

#end
