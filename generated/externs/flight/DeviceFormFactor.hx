package flight;

#if hl

typedef DeviceFormFactor = flight._hl.DeviceFormFactor;

#elseif cpp

typedef DeviceFormFactor = flight._cpp.DeviceFormFactor;

#elseif (js && flight_esm)

typedef DeviceFormFactor = flight._js.DeviceFormFactor;

#elseif js

#error "flight.DeviceFormFactor on js requires flight_esm."

#else

#error "flight.DeviceFormFactor: no backend for this target."

#end
