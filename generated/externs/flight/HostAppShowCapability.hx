package flight;

#if hl

typedef HostAppShowCapability = flight._hl.HostAppShowCapability;

#elseif cpp

typedef HostAppShowCapability = flight._cpp.HostAppShowCapability;

#elseif (js && flight_esm)

typedef HostAppShowCapability = flight._js.HostAppShowCapability;

#elseif js

#error "flight.HostAppShowCapability on js requires flight_esm."

#else

#error "flight.HostAppShowCapability: no backend for this target."

#end
