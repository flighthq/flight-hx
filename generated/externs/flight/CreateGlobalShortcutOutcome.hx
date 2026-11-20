package flight;

#if hl

typedef CreateGlobalShortcutOutcome = flight._hl.CreateGlobalShortcutOutcome;

#elseif cpp

typedef CreateGlobalShortcutOutcome = flight._cpp.CreateGlobalShortcutOutcome;

#elseif (js && flight_esm)

typedef CreateGlobalShortcutOutcome = flight._js.CreateGlobalShortcutOutcome;

#elseif js

#error "flight.CreateGlobalShortcutOutcome on js requires flight_esm."

#else

#error "flight.CreateGlobalShortcutOutcome: no backend for this target."

#end
