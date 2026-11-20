package flight;

#if hl

typedef HostSurfaceResizeCapability = flight._hl.HostSurfaceResizeCapability;

#elseif cpp

typedef HostSurfaceResizeCapability = flight._cpp.HostSurfaceResizeCapability;

#elseif (js && flight_esm)

typedef HostSurfaceResizeCapability = flight._js.HostSurfaceResizeCapability;

#elseif js

#error "flight.HostSurfaceResizeCapability on js requires flight_esm."

#else

#error "flight.HostSurfaceResizeCapability: no backend for this target."

#end
