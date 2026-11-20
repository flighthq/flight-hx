package flight;

#if hl

typedef HostMenuSelectCapability = flight._hl.HostMenuSelectCapability;

#elseif cpp

typedef HostMenuSelectCapability = flight._cpp.HostMenuSelectCapability;

#elseif (js && flight_esm)

typedef HostMenuSelectCapability = flight._js.HostMenuSelectCapability;

#elseif js

#error "flight.HostMenuSelectCapability on js requires flight_esm."

#else

#error "flight.HostMenuSelectCapability: no backend for this target."

#end
