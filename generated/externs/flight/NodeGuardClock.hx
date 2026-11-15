package flight;

#if hl

typedef NodeGuardClock = flight._hl.NodeGuardClock;

#elseif cpp

typedef NodeGuardClock = flight._cpp.NodeGuardClock;

#elseif (js && flight_esm)

typedef NodeGuardClock = flight._js.NodeGuardClock;

#elseif js

#error "flight.NodeGuardClock on js requires flight_esm."

#else

#error "flight.NodeGuardClock: no backend for this target."

#end
