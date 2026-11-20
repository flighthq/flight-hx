package flight;

#if hl

typedef DebugState = flight._hl.DebugState;

#elseif cpp

typedef DebugState = flight._cpp.DebugState;

#elseif (js && flight_esm)

typedef DebugState = flight._js.DebugState;

#elseif js

#error "flight.DebugState on js requires flight_esm."

#else

#error "flight.DebugState: no backend for this target."

#end
