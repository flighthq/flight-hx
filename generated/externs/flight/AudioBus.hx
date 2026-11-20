package flight;

#if hl

typedef AudioBus = flight._hl.AudioBus;

#elseif cpp

typedef AudioBus = flight._cpp.AudioBus;

#elseif (js && flight_esm)

typedef AudioBus = flight._js.AudioBus;

#elseif js

#error "flight.AudioBus on js requires flight_esm."

#else

#error "flight.AudioBus: no backend for this target."

#end
