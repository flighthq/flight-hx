package flight;

#if hl

typedef HostCapabilityBackend = flight._hl.HostCapabilityBackend;

#elseif cpp

typedef HostCapabilityBackend = flight._cpp.HostCapabilityBackend;

#elseif (js && flight_esm)

typedef HostCapabilityBackend = flight._js.HostCapabilityBackend;

#elseif js

#error "flight.HostCapabilityBackend on js requires flight_esm."

#else

#error "flight.HostCapabilityBackend: no backend for this target."

#end
