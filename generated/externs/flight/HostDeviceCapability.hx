package flight;

#if hl

typedef HostDeviceCapability = flight._hl.HostDeviceCapability;

#elseif cpp

typedef HostDeviceCapability = flight._cpp.HostDeviceCapability;

#elseif (js && flight_esm)

typedef HostDeviceCapability = flight._js.HostDeviceCapability;

#elseif js

#error "flight.HostDeviceCapability on js requires flight_esm."

#else

#error "flight.HostDeviceCapability: no backend for this target."

#end
