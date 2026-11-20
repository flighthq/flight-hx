package flight;

#if hl

typedef HostWindowAttachCapability = flight._hl.HostWindowAttachCapability;

#elseif cpp

typedef HostWindowAttachCapability = flight._cpp.HostWindowAttachCapability;

#elseif (js && flight_esm)

typedef HostWindowAttachCapability = flight._js.HostWindowAttachCapability;

#elseif js

#error "flight.HostWindowAttachCapability on js requires flight_esm."

#else

#error "flight.HostWindowAttachCapability: no backend for this target."

#end
