package flight;

#if hl

typedef HostAppActivateCapability = flight._hl.HostAppActivateCapability;

#elseif cpp

typedef HostAppActivateCapability = flight._cpp.HostAppActivateCapability;

#elseif (js && flight_esm)

typedef HostAppActivateCapability = flight._js.HostAppActivateCapability;

#elseif js

#error "flight.HostAppActivateCapability on js requires flight_esm."

#else

#error "flight.HostAppActivateCapability: no backend for this target."

#end
