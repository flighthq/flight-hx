package flight;

#if hl

typedef HostAppPathCapability = flight._hl.HostAppPathCapability;

#elseif cpp

typedef HostAppPathCapability = flight._cpp.HostAppPathCapability;

#elseif (js && flight_esm)

typedef HostAppPathCapability = flight._js.HostAppPathCapability;

#elseif js

#error "flight.HostAppPathCapability on js requires flight_esm."

#else

#error "flight.HostAppPathCapability: no backend for this target."

#end
