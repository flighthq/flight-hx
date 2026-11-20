package flight;

#if hl

typedef ConnectivityStatus = flight._hl.ConnectivityStatus;

#elseif cpp

typedef ConnectivityStatus = flight._cpp.ConnectivityStatus;

#elseif (js && flight_esm)

typedef ConnectivityStatus = flight._js.ConnectivityStatus;

#elseif js

#error "flight.ConnectivityStatus on js requires flight_esm."

#else

#error "flight.ConnectivityStatus: no backend for this target."

#end
