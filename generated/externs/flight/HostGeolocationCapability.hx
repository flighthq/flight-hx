package flight;

#if hl

typedef HostGeolocationCapability = flight._hl.HostGeolocationCapability;

#elseif cpp

typedef HostGeolocationCapability = flight._cpp.HostGeolocationCapability;

#elseif (js && flight_esm)

typedef HostGeolocationCapability = flight._js.HostGeolocationCapability;

#elseif js

#error "flight.HostGeolocationCapability on js requires flight_esm."

#else

#error "flight.HostGeolocationCapability: no backend for this target."

#end
