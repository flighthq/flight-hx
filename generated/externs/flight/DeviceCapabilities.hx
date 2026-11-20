package flight;

#if hl

typedef DeviceCapabilities = flight._hl.DeviceCapabilities;

#elseif cpp

typedef DeviceCapabilities = flight._cpp.DeviceCapabilities;

#elseif (js && flight_esm)

typedef DeviceCapabilities = flight._js.DeviceCapabilities;

#elseif js

#error "flight.DeviceCapabilities on js requires flight_esm."

#else

#error "flight.DeviceCapabilities: no backend for this target."

#end
