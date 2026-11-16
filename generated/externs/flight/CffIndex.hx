package flight;

#if hl

typedef CffIndex = flight._hl.CffIndex;

#elseif cpp

typedef CffIndex = flight._cpp.CffIndex;

#elseif (js && flight_esm)

typedef CffIndex = flight._js.CffIndex;

#elseif js

#error "flight.CffIndex on js requires flight_esm."

#else

#error "flight.CffIndex: no backend for this target."

#end
