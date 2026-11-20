package flight;

#if hl

typedef HostAppLocaleCapability = flight._hl.HostAppLocaleCapability;

#elseif cpp

typedef HostAppLocaleCapability = flight._cpp.HostAppLocaleCapability;

#elseif (js && flight_esm)

typedef HostAppLocaleCapability = flight._js.HostAppLocaleCapability;

#elseif js

#error "flight.HostAppLocaleCapability on js requires flight_esm."

#else

#error "flight.HostAppLocaleCapability: no backend for this target."

#end
