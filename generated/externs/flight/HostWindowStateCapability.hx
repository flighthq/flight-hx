package flight;

#if hl

typedef HostWindowStateCapability = flight._hl.HostWindowStateCapability;

#elseif cpp

typedef HostWindowStateCapability = flight._cpp.HostWindowStateCapability;

#elseif (js && flight_esm)

typedef HostWindowStateCapability = flight._js.HostWindowStateCapability;

#elseif js

#error "flight.HostWindowStateCapability on js requires flight_esm."

#else

#error "flight.HostWindowStateCapability: no backend for this target."

#end
