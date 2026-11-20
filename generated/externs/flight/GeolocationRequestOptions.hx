package flight;

#if hl

typedef GeolocationRequestOptions = flight._hl.GeolocationRequestOptions;

#elseif cpp

typedef GeolocationRequestOptions = flight._cpp.GeolocationRequestOptions;

#elseif (js && flight_esm)

typedef GeolocationRequestOptions = flight._js.GeolocationRequestOptions;

#elseif js

#error "flight.GeolocationRequestOptions on js requires flight_esm."

#else

#error "flight.GeolocationRequestOptions: no backend for this target."

#end
