package flight;

#if hl

typedef DebugOptions = flight._hl.DebugOptions;

#elseif cpp

typedef DebugOptions = flight._cpp.DebugOptions;

#elseif (js && flight_esm)

typedef DebugOptions = flight._js.DebugOptions;

#elseif js

#error "flight.DebugOptions on js requires flight_esm."

#else

#error "flight.DebugOptions: no backend for this target."

#end
