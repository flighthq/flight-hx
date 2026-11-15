package flight;

#if hl

typedef HostBitmapEncodeCapability = flight._hl.HostBitmapEncodeCapability;

#elseif cpp

typedef HostBitmapEncodeCapability = flight._cpp.HostBitmapEncodeCapability;

#elseif (js && flight_esm)

typedef HostBitmapEncodeCapability = flight._js.HostBitmapEncodeCapability;

#elseif js

#error "flight.HostBitmapEncodeCapability on js requires flight_esm."

#else

#error "flight.HostBitmapEncodeCapability: no backend for this target."

#end
