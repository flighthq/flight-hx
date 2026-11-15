package flight;

#if hl

typedef HostTextSegmenterCapability = flight._hl.HostTextSegmenterCapability;

#elseif cpp

typedef HostTextSegmenterCapability = flight._cpp.HostTextSegmenterCapability;

#elseif (js && flight_esm)

typedef HostTextSegmenterCapability = flight._js.HostTextSegmenterCapability;

#elseif js

#error "flight.HostTextSegmenterCapability on js requires flight_esm."

#else

#error "flight.HostTextSegmenterCapability: no backend for this target."

#end
