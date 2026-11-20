package flight;

#if hl

typedef HostSurfaceDisplayCapability = flight._hl.HostSurfaceDisplayCapability;

#elseif cpp

typedef HostSurfaceDisplayCapability = flight._cpp.HostSurfaceDisplayCapability;

#elseif (js && flight_esm)

typedef HostSurfaceDisplayCapability = flight._js.HostSurfaceDisplayCapability;

#elseif js

#error "flight.HostSurfaceDisplayCapability on js requires flight_esm."

#else

#error "flight.HostSurfaceDisplayCapability: no backend for this target."

#end
