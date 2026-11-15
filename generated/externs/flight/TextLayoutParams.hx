package flight;

#if hl

typedef TextLayoutParams = flight._hl.TextLayoutParams;

#elseif cpp

typedef TextLayoutParams = flight._cpp.TextLayoutParams;

#elseif (js && flight_esm)

typedef TextLayoutParams = flight._js.TextLayoutParams;

#elseif js

#error "flight.TextLayoutParams on js requires flight_esm."

#else

#error "flight.TextLayoutParams: no backend for this target."

#end
