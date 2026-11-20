package flight;

#if hl

typedef HostAppVersionCapability = flight._hl.HostAppVersionCapability;

#elseif cpp

typedef HostAppVersionCapability = flight._cpp.HostAppVersionCapability;

#elseif (js && flight_esm)

typedef HostAppVersionCapability = flight._js.HostAppVersionCapability;

#elseif js

#error "flight.HostAppVersionCapability on js requires flight_esm."

#else

#error "flight.HostAppVersionCapability: no backend for this target."

#end
