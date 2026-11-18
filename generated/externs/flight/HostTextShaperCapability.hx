package flight;

#if hl

typedef HostTextShaperCapability = flight._hl.HostTextShaperCapability;

#elseif cpp

typedef HostTextShaperCapability = flight._cpp.HostTextShaperCapability;

#elseif (js && flight_esm)

typedef HostTextShaperCapability = flight._js.HostTextShaperCapability;

#elseif js

#error "flight.HostTextShaperCapability on js requires flight_esm."

#else

#error "flight.HostTextShaperCapability: no backend for this target."

#end
