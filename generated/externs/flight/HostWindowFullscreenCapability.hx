package flight;

#if hl

typedef HostWindowFullscreenCapability = flight._hl.HostWindowFullscreenCapability;

#elseif cpp

typedef HostWindowFullscreenCapability = flight._cpp.HostWindowFullscreenCapability;

#elseif (js && flight_esm)

typedef HostWindowFullscreenCapability = flight._js.HostWindowFullscreenCapability;

#elseif js

#error "flight.HostWindowFullscreenCapability on js requires flight_esm."

#else

#error "flight.HostWindowFullscreenCapability: no backend for this target."

#end
