package flight;

#if hl

typedef HostCapabilityGroupExplanation = flight._hl.HostCapabilityGroupExplanation;

#elseif cpp

typedef HostCapabilityGroupExplanation = flight._cpp.HostCapabilityGroupExplanation;

#elseif (js && flight_esm)

typedef HostCapabilityGroupExplanation = flight._js.HostCapabilityGroupExplanation;

#elseif js

#error "flight.HostCapabilityGroupExplanation on js requires flight_esm."

#else

#error "flight.HostCapabilityGroupExplanation: no backend for this target."

#end
