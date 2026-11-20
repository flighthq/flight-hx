package flight;

#if hl

typedef ShortcutState = flight._hl.ShortcutState;

#elseif cpp

typedef ShortcutState = flight._cpp.ShortcutState;

#elseif (js && flight_esm)

typedef ShortcutState = flight._js.ShortcutState;

#elseif js

#error "flight.ShortcutState on js requires flight_esm."

#else

#error "flight.ShortcutState: no backend for this target."

#end
