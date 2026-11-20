package flight;

#if hl

typedef AudioSourceHandle = flight._hl.AudioSourceHandle;

#elseif cpp

typedef AudioSourceHandle = flight._cpp.AudioSourceHandle;

#elseif (js && flight_esm)

typedef AudioSourceHandle = flight._js.AudioSourceHandle;

#elseif js

#error "flight.AudioSourceHandle on js requires flight_esm."

#else

#error "flight.AudioSourceHandle: no backend for this target."

#end
