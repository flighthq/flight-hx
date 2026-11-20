package flight;

#if hl

typedef HostAppUserModelIdCapability = flight._hl.HostAppUserModelIdCapability;

#elseif cpp

typedef HostAppUserModelIdCapability = flight._cpp.HostAppUserModelIdCapability;

#elseif (js && flight_esm)

typedef HostAppUserModelIdCapability = flight._js.HostAppUserModelIdCapability;

#elseif js

#error "flight.HostAppUserModelIdCapability on js requires flight_esm."

#else

#error "flight.HostAppUserModelIdCapability: no backend for this target."

#end
