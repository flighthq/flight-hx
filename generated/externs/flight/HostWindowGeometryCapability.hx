package flight;

#if hl

typedef HostWindowGeometryCapability = flight._hl.HostWindowGeometryCapability;

#elseif cpp

typedef HostWindowGeometryCapability = flight._cpp.HostWindowGeometryCapability;

#elseif (js && flight_esm)

typedef HostWindowGeometryCapability = flight._js.HostWindowGeometryCapability;

#elseif js

#error "flight.HostWindowGeometryCapability on js requires flight_esm."

#else

#error "flight.HostWindowGeometryCapability: no backend for this target."

#end
