package flight;

#if hl

typedef PlatformInfo = flight._hl.PlatformInfo;

#elseif cpp

typedef PlatformInfo = flight._cpp.PlatformInfo;

#elseif (js && flight_esm)

typedef PlatformInfo = flight._js.PlatformInfo;

#elseif js

#error "flight.PlatformInfo on js requires flight_esm."

#else

#error "flight.PlatformInfo: no backend for this target."

#end
