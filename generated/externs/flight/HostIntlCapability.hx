package flight;

#if hl

typedef HostIntlCapability = flight._hl.HostIntlCapability;

#elseif cpp

typedef HostIntlCapability = flight._cpp.HostIntlCapability;

#elseif (js && flight_esm)

typedef HostIntlCapability = flight._js.HostIntlCapability;

#elseif js

#error "flight.HostIntlCapability on js requires flight_esm."

#else

#error "flight.HostIntlCapability: no backend for this target."

#end
