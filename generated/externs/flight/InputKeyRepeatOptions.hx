package flight;

#if hl

typedef InputKeyRepeatOptions = flight._hl.InputKeyRepeatOptions;

#elseif cpp

typedef InputKeyRepeatOptions = flight._cpp.InputKeyRepeatOptions;

#elseif (js && flight_esm)

typedef InputKeyRepeatOptions = flight._js.InputKeyRepeatOptions;

#elseif js

#error "flight.InputKeyRepeatOptions on js requires flight_esm."

#else

#error "flight.InputKeyRepeatOptions: no backend for this target."

#end
