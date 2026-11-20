package flight;

#if hl

typedef HostScreenChangeCapability = flight._hl.HostScreenChangeCapability;

#elseif cpp

typedef HostScreenChangeCapability = flight._cpp.HostScreenChangeCapability;

#elseif (js && flight_esm)

typedef HostScreenChangeCapability = flight._js.HostScreenChangeCapability;

#elseif js

#error "flight.HostScreenChangeCapability on js requires flight_esm."

#else

#error "flight.HostScreenChangeCapability: no backend for this target."

#end
