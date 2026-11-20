package flight;

#if hl

typedef HandleTextInputKeyboardOptions = flight._hl.HandleTextInputKeyboardOptions;

#elseif cpp

typedef HandleTextInputKeyboardOptions = flight._cpp.HandleTextInputKeyboardOptions;

#elseif (js && flight_esm)

typedef HandleTextInputKeyboardOptions = flight._js.HandleTextInputKeyboardOptions;

#elseif js

#error "flight.HandleTextInputKeyboardOptions on js requires flight_esm."

#else

#error "flight.HandleTextInputKeyboardOptions: no backend for this target."

#end
