package flight;

#if hl

typedef HostWindowShadowCapability = flight._hl.HostWindowShadowCapability;

#elseif cpp

typedef HostWindowShadowCapability = flight._cpp.HostWindowShadowCapability;

#elseif (js && flight_esm)

typedef HostWindowShadowCapability = flight._js.HostWindowShadowCapability;

#elseif js

#error "flight.HostWindowShadowCapability on js requires flight_esm."

#else

#error "flight.HostWindowShadowCapability: no backend for this target."

#end
