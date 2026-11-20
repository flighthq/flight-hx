package flight;

#if hl

typedef HostElementFullscreenCapability = flight._hl.HostElementFullscreenCapability;

#elseif cpp

typedef HostElementFullscreenCapability = flight._cpp.HostElementFullscreenCapability;

#elseif (js && flight_esm)

typedef HostElementFullscreenCapability = flight._js.HostElementFullscreenCapability;

#elseif js

#error "flight.HostElementFullscreenCapability on js requires flight_esm."

#else

#error "flight.HostElementFullscreenCapability: no backend for this target."

#end
