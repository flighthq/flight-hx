package flight;

#if hl

typedef TransmissionVolumePbrExtension = flight._hl.TransmissionVolumePbrExtension;

#elseif cpp

typedef TransmissionVolumePbrExtension = flight._cpp.TransmissionVolumePbrExtension;

#elseif (js && flight_esm)

typedef TransmissionVolumePbrExtension = flight._js.TransmissionVolumePbrExtension;

#elseif js

#error "flight.TransmissionVolumePbrExtension on js requires flight_esm."

#else

#error "flight.TransmissionVolumePbrExtension: no backend for this target."

#end
