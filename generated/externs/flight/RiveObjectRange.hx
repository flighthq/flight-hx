package flight;

#if hl

typedef RiveObjectRange = flight._hl.RiveObjectRange;

#elseif cpp

typedef RiveObjectRange = flight._cpp.RiveObjectRange;

#elseif (js && flight_esm)

typedef RiveObjectRange = flight._js.RiveObjectRange;

#elseif js

#error "flight.RiveObjectRange on js requires flight_esm."

#else

#error "flight.RiveObjectRange: no backend for this target."

#end
