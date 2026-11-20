package flight;

#if hl

typedef HostAppDockCapability = flight._hl.HostAppDockCapability;

#elseif cpp

typedef HostAppDockCapability = flight._cpp.HostAppDockCapability;

#elseif (js && flight_esm)

typedef HostAppDockCapability = flight._js.HostAppDockCapability;

#elseif js

#error "flight.HostAppDockCapability on js requires flight_esm."

#else

#error "flight.HostAppDockCapability: no backend for this target."

#end
