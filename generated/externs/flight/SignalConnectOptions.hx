package flight;

#if hl

typedef SignalConnectOptions = flight._hl.SignalConnectOptions;

#elseif cpp

typedef SignalConnectOptions = flight._cpp.SignalConnectOptions;

#elseif (js && flight_esm)

typedef SignalConnectOptions = flight._js.SignalConnectOptions;

#elseif js

#error "flight.SignalConnectOptions on js requires flight_esm."

#else

#error "flight.SignalConnectOptions: no backend for this target."

#end
