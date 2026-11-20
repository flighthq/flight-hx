package flight;

#if hl

typedef ShellShortcutLink = flight._hl.ShellShortcutLink;

#elseif cpp

typedef ShellShortcutLink = flight._cpp.ShellShortcutLink;

#elseif (js && flight_esm)

typedef ShellShortcutLink = flight._js.ShellShortcutLink;

#elseif js

#error "flight.ShellShortcutLink on js requires flight_esm."

#else

#error "flight.ShellShortcutLink: no backend for this target."

#end
