package flight;

#if hl

typedef DeviceDisplayMetrics = flight._hl.DeviceDisplayMetrics;

#elseif cpp

typedef DeviceDisplayMetrics = flight._cpp.DeviceDisplayMetrics;

#elseif (js && flight_esm)

typedef DeviceDisplayMetrics = flight._js.DeviceDisplayMetrics;

#elseif js

#error "flight.DeviceDisplayMetrics on js requires flight_esm."

#else

#error "flight.DeviceDisplayMetrics: no backend for this target."

#end
