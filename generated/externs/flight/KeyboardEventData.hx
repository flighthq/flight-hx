package flight;

#if hl

typedef KeyboardEventData = flight._hl.KeyboardEventData;

#elseif cpp

typedef KeyboardEventData = flight._cpp.KeyboardEventData;

#elseif (js && flight_esm)

typedef KeyboardEventData = flight._js.KeyboardEventData;

#elseif js

#error "flight.KeyboardEventData on js requires flight_esm."

#else

#error "flight.KeyboardEventData: no backend for this target."

#end
