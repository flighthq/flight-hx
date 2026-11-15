package flight;

#if hl

typedef HostBitmapReadbackCapability = flight._hl.HostBitmapReadbackCapability;

#elseif cpp

typedef HostBitmapReadbackCapability = flight._cpp.HostBitmapReadbackCapability;

#elseif (js && flight_esm)

typedef HostBitmapReadbackCapability = flight._js.HostBitmapReadbackCapability;

#elseif js

#error "flight.HostBitmapReadbackCapability on js requires flight_esm."

#else

#error "flight.HostBitmapReadbackCapability: no backend for this target."

#end
