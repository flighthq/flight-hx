package flight;

#if hl

typedef InputRepeatCallback = flight._hl.InputRepeatCallback;

#elseif cpp

typedef InputRepeatCallback = flight._cpp.InputRepeatCallback;

#elseif (js && flight_esm)

typedef InputRepeatCallback = flight._js.InputRepeatCallback;

#elseif js

#error "flight.InputRepeatCallback on js requires flight_esm."

#else

#error "flight.InputRepeatCallback: no backend for this target."

#end
