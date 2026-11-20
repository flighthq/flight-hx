package flight;

#if hl

typedef FocusManager = flight._hl.FocusManager;

#elseif cpp

typedef FocusManager = flight._cpp.FocusManager;

#elseif (js && flight_esm)

typedef FocusManager = flight._js.FocusManager;

#elseif js

#error "flight.FocusManager on js requires flight_esm."

#else

#error "flight.FocusManager: no backend for this target."

#end
