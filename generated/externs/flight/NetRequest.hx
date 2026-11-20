package flight;

#if hl

typedef NetRequest = flight._hl.NetRequest;

#elseif cpp

typedef NetRequest = flight._cpp.NetRequest;

#elseif (js && flight_esm)

typedef NetRequest = flight._js.NetRequest;

#elseif js

#error "flight.NetRequest on js requires flight_esm."

#else

#error "flight.NetRequest: no backend for this target."

#end
