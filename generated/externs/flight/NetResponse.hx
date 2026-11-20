package flight;

#if hl

typedef NetResponse = flight._hl.NetResponse;

#elseif cpp

typedef NetResponse = flight._cpp.NetResponse;

#elseif (js && flight_esm)

typedef NetResponse = flight._js.NetResponse;

#elseif js

#error "flight.NetResponse on js requires flight_esm."

#else

#error "flight.NetResponse: no backend for this target."

#end
