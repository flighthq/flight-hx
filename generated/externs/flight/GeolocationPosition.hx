package flight;

#if hl

typedef GeolocationPosition = flight._hl.GeolocationPosition;

#elseif cpp

typedef GeolocationPosition = flight._cpp.GeolocationPosition;

#elseif (js && flight_esm)

typedef GeolocationPosition = flight._js.GeolocationPosition;

#elseif js

#error "flight.GeolocationPosition on js requires flight_esm."

#else

#error "flight.GeolocationPosition: no backend for this target."

#end
