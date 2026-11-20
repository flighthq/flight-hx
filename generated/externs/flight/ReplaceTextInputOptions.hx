package flight;

#if hl

typedef ReplaceTextInputOptions = flight._hl.ReplaceTextInputOptions;

#elseif cpp

typedef ReplaceTextInputOptions = flight._cpp.ReplaceTextInputOptions;

#elseif (js && flight_esm)

typedef ReplaceTextInputOptions = flight._js.ReplaceTextInputOptions;

#elseif js

#error "flight.ReplaceTextInputOptions on js requires flight_esm."

#else

#error "flight.ReplaceTextInputOptions: no backend for this target."

#end
