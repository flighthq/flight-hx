package flight;

#if hl

typedef HostImageDimensions = flight._hl.HostImageDimensions;

#elseif cpp

typedef HostImageDimensions = flight._cpp.HostImageDimensions;

#elseif (js && flight_esm)

typedef HostImageDimensions = flight._js.HostImageDimensions;

#elseif js

#error "flight.HostImageDimensions on js requires flight_esm."

#else

#error "flight.HostImageDimensions: no backend for this target."

#end
