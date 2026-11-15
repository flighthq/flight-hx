package flight;

#if hl

typedef AudioBuffer = flight._hl.AudioBuffer;

#elseif cpp

typedef AudioBuffer = flight._cpp.AudioBuffer;

#elseif (js && flight_esm)

typedef AudioBuffer = flight._js.AudioBuffer;

#elseif js

#error "flight.AudioBuffer on js requires flight_esm."

#else

#error "flight.AudioBuffer: no backend for this target."

#end
