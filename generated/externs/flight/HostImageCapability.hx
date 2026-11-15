package flight;

#if hl

typedef HostImageCapability = flight._hl.HostImageCapability;

#elseif cpp

typedef HostImageCapability = flight._cpp.HostImageCapability;

#elseif (js && flight_esm)

typedef HostImageCapability = flight._js.HostImageCapability;

#elseif js

#error "flight.HostImageCapability on js requires flight_esm."

#else

#error "flight.HostImageCapability: no backend for this target."

#end
