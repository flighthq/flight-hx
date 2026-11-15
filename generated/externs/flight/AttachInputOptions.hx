package flight;

#if hl

typedef AttachInputOptions = flight._hl.AttachInputOptions;

#elseif cpp

typedef AttachInputOptions = flight._cpp.AttachInputOptions;

#elseif (js && flight_esm)

typedef AttachInputOptions = flight._js.AttachInputOptions;

#elseif js

#error "flight.AttachInputOptions on js requires flight_esm."

#else

#error "flight.AttachInputOptions: no backend for this target."

#end
