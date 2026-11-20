package flight;

#if hl

typedef HostAppLoginItemCapability = flight._hl.HostAppLoginItemCapability;

#elseif cpp

typedef HostAppLoginItemCapability = flight._cpp.HostAppLoginItemCapability;

#elseif (js && flight_esm)

typedef HostAppLoginItemCapability = flight._js.HostAppLoginItemCapability;

#elseif js

#error "flight.HostAppLoginItemCapability on js requires flight_esm."

#else

#error "flight.HostAppLoginItemCapability: no backend for this target."

#end
