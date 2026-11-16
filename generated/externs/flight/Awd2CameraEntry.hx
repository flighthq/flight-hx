package flight;

#if hl

typedef Awd2CameraEntry = flight._hl.Awd2CameraEntry;

#elseif cpp

typedef Awd2CameraEntry = flight._cpp.Awd2CameraEntry;

#elseif (js && flight_esm)

typedef Awd2CameraEntry = flight._js.Awd2CameraEntry;

#elseif js

#error "flight.Awd2CameraEntry on js requires flight_esm."

#else

#error "flight.Awd2CameraEntry: no backend for this target."

#end
