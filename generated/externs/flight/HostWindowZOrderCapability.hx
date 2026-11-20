package flight;

#if hl

typedef HostWindowZOrderCapability = flight._hl.HostWindowZOrderCapability;

#elseif cpp

typedef HostWindowZOrderCapability = flight._cpp.HostWindowZOrderCapability;

#elseif (js && flight_esm)

typedef HostWindowZOrderCapability = flight._js.HostWindowZOrderCapability;

#elseif js

#error "flight.HostWindowZOrderCapability on js requires flight_esm."

#else

#error "flight.HostWindowZOrderCapability: no backend for this target."

#end
