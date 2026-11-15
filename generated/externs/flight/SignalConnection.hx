package flight;

#if hl

typedef SignalConnection = flight._hl.SignalConnection;

#elseif cpp

typedef SignalConnection = flight._cpp.SignalConnection;

#elseif (js && flight_esm)

typedef SignalConnection = flight._js.SignalConnection;

#elseif js

#error "flight.SignalConnection on js requires flight_esm."

#else

#error "flight.SignalConnection: no backend for this target."

#end
