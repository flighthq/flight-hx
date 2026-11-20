package flight;

#if hl

typedef AudioPlayOptions = flight._hl.AudioPlayOptions;

#elseif cpp

typedef AudioPlayOptions = flight._cpp.AudioPlayOptions;

#elseif (js && flight_esm)

typedef AudioPlayOptions = flight._js.AudioPlayOptions;

#elseif js

#error "flight.AudioPlayOptions on js requires flight_esm."

#else

#error "flight.AudioPlayOptions: no backend for this target."

#end
