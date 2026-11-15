package flight;

#if hl

typedef HostFontLoadingCapability = flight._hl.HostFontLoadingCapability;

#elseif cpp

typedef HostFontLoadingCapability = flight._cpp.HostFontLoadingCapability;

#elseif (js && flight_esm)

typedef HostFontLoadingCapability = flight._js.HostFontLoadingCapability;

#elseif js

#error "flight.HostFontLoadingCapability on js requires flight_esm."

#else

#error "flight.HostFontLoadingCapability: no backend for this target."

#end
