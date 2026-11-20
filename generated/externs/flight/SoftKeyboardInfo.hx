package flight;

#if hl

typedef SoftKeyboardInfo = flight._hl.SoftKeyboardInfo;

#elseif cpp

typedef SoftKeyboardInfo = flight._cpp.SoftKeyboardInfo;

#elseif (js && flight_esm)

typedef SoftKeyboardInfo = flight._js.SoftKeyboardInfo;

#elseif js

#error "flight.SoftKeyboardInfo on js requires flight_esm."

#else

#error "flight.SoftKeyboardInfo: no backend for this target."

#end
