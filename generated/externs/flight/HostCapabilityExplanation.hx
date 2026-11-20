package flight;

#if hl

typedef HostCapabilityExplanation = flight._hl.HostCapabilityExplanation;

#elseif cpp

typedef HostCapabilityExplanation = flight._cpp.HostCapabilityExplanation;

#elseif (js && flight_esm)

typedef HostCapabilityExplanation = flight._js.HostCapabilityExplanation;

#elseif js

#error "flight.HostCapabilityExplanation on js requires flight_esm."

#else

#error "flight.HostCapabilityExplanation: no backend for this target."

#end
