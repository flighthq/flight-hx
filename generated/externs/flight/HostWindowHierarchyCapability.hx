package flight;

#if hl

typedef HostWindowHierarchyCapability = flight._hl.HostWindowHierarchyCapability;

#elseif cpp

typedef HostWindowHierarchyCapability = flight._cpp.HostWindowHierarchyCapability;

#elseif (js && flight_esm)

typedef HostWindowHierarchyCapability = flight._js.HostWindowHierarchyCapability;

#elseif js

#error "flight.HostWindowHierarchyCapability on js requires flight_esm."

#else

#error "flight.HostWindowHierarchyCapability: no backend for this target."

#end
