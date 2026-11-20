package flight;

#if hl

typedef HostWindowVisibilityCapability = flight._hl.HostWindowVisibilityCapability;

#elseif cpp

typedef HostWindowVisibilityCapability = flight._cpp.HostWindowVisibilityCapability;

#elseif (js && flight_esm)

typedef HostWindowVisibilityCapability = flight._js.HostWindowVisibilityCapability;

#elseif js

#error "flight.HostWindowVisibilityCapability on js requires flight_esm."

#else

#error "flight.HostWindowVisibilityCapability: no backend for this target."

#end
