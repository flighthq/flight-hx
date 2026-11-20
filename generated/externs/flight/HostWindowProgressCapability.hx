package flight;

#if hl

typedef HostWindowProgressCapability = flight._hl.HostWindowProgressCapability;

#elseif cpp

typedef HostWindowProgressCapability = flight._cpp.HostWindowProgressCapability;

#elseif (js && flight_esm)

typedef HostWindowProgressCapability = flight._js.HostWindowProgressCapability;

#elseif js

#error "flight.HostWindowProgressCapability on js requires flight_esm."

#else

#error "flight.HostWindowProgressCapability: no backend for this target."

#end
