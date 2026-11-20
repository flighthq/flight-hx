package flight;

#if hl

typedef HostAppSecondInstanceCapability = flight._hl.HostAppSecondInstanceCapability;

#elseif cpp

typedef HostAppSecondInstanceCapability = flight._cpp.HostAppSecondInstanceCapability;

#elseif (js && flight_esm)

typedef HostAppSecondInstanceCapability = flight._js.HostAppSecondInstanceCapability;

#elseif js

#error "flight.HostAppSecondInstanceCapability on js requires flight_esm."

#else

#error "flight.HostAppSecondInstanceCapability: no backend for this target."

#end
