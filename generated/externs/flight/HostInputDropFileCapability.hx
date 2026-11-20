package flight;

#if hl

typedef HostInputDropFileCapability = flight._hl.HostInputDropFileCapability;

#elseif cpp

typedef HostInputDropFileCapability = flight._cpp.HostInputDropFileCapability;

#elseif (js && flight_esm)

typedef HostInputDropFileCapability = flight._js.HostInputDropFileCapability;

#elseif js

#error "flight.HostInputDropFileCapability on js requires flight_esm."

#else

#error "flight.HostInputDropFileCapability: no backend for this target."

#end
