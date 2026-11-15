package flight;

#if hl

typedef SignalScope = flight._hl.SignalScope;

#elseif cpp

typedef SignalScope = flight._cpp.SignalScope;

#elseif (js && flight_esm)

typedef SignalScope = flight._js.SignalScope;

#elseif js

#error "flight.SignalScope on js requires flight_esm."

#else

#error "flight.SignalScope: no backend for this target."

#end
