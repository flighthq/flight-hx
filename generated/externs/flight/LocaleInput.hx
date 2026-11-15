package flight;

#if hl

typedef LocaleInput = flight._hl.LocaleInput;

#elseif cpp

typedef LocaleInput = flight._cpp.LocaleInput;

#elseif (js && flight_esm)

typedef LocaleInput = flight._js.LocaleInput;

#elseif js

#error "flight.LocaleInput on js requires flight_esm."

#else

#error "flight.LocaleInput: no backend for this target."

#end
