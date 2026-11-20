package flight;

#if hl

typedef DeviceInfo = flight._hl.DeviceInfo;

#elseif cpp

typedef DeviceInfo = flight._cpp.DeviceInfo;

#elseif (js && flight_esm)

typedef DeviceInfo = flight._js.DeviceInfo;

#elseif js

#error "flight.DeviceInfo on js requires flight_esm."

#else

#error "flight.DeviceInfo: no backend for this target."

#end
