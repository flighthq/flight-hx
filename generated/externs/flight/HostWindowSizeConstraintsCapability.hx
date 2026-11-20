package flight;

#if hl

typedef HostWindowSizeConstraintsCapability = flight._hl.HostWindowSizeConstraintsCapability;

#elseif cpp

typedef HostWindowSizeConstraintsCapability = flight._cpp.HostWindowSizeConstraintsCapability;

#elseif (js && flight_esm)

typedef HostWindowSizeConstraintsCapability = flight._js.HostWindowSizeConstraintsCapability;

#elseif js

#error "flight.HostWindowSizeConstraintsCapability on js requires flight_esm."

#else

#error "flight.HostWindowSizeConstraintsCapability: no backend for this target."

#end
