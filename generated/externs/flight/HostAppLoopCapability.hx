package flight;

#if hl

typedef HostAppLoopCapability = flight._hl.HostAppLoopCapability;

#elseif cpp

typedef HostAppLoopCapability = flight._cpp.HostAppLoopCapability;

#elseif (js && flight_esm)

typedef HostAppLoopCapability = flight._js.HostAppLoopCapability;

#elseif js

#error "flight.HostAppLoopCapability on js requires flight_esm."

#else

#error "flight.HostAppLoopCapability: no backend for this target."

#end
