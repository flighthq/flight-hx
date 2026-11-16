package flight;

#if hl

typedef SfntTableRange = flight._hl.SfntTableRange;

#elseif cpp

typedef SfntTableRange = flight._cpp.SfntTableRange;

#elseif (js && flight_esm)

typedef SfntTableRange = flight._js.SfntTableRange;

#elseif js

#error "flight.SfntTableRange on js requires flight_esm."

#else

#error "flight.SfntTableRange: no backend for this target."

#end
