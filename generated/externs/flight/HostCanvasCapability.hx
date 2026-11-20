package flight;

#if hl

typedef HostCanvasCapability = flight._hl.HostCanvasCapability;

#elseif cpp

typedef HostCanvasCapability = flight._cpp.HostCanvasCapability;

#elseif (js && flight_esm)

typedef HostCanvasCapability = flight._js.HostCanvasCapability;

#elseif js

#error "flight.HostCanvasCapability on js requires flight_esm."

#else

#error "flight.HostCanvasCapability: no backend for this target."

#end
