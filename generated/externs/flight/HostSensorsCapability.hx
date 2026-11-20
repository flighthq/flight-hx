package flight;

#if hl

typedef HostSensorsCapability = flight._hl.HostSensorsCapability;

#elseif cpp

typedef HostSensorsCapability = flight._cpp.HostSensorsCapability;

#elseif (js && flight_esm)

typedef HostSensorsCapability = flight._js.HostSensorsCapability;

#elseif js

#error "flight.HostSensorsCapability on js requires flight_esm."

#else

#error "flight.HostSensorsCapability: no backend for this target."

#end
