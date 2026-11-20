package flight;

#if hl

typedef AudioDeviceHandle = flight._hl.AudioDeviceHandle;

#elseif cpp

typedef AudioDeviceHandle = flight._cpp.AudioDeviceHandle;

#elseif (js && flight_esm)

typedef AudioDeviceHandle = flight._js.AudioDeviceHandle;

#elseif js

#error "flight.AudioDeviceHandle on js requires flight_esm."

#else

#error "flight.AudioDeviceHandle: no backend for this target."

#end
