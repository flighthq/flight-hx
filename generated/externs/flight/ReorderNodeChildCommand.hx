package flight;

#if hl

typedef ReorderNodeChildCommand = flight._hl.ReorderNodeChildCommand;

#elseif cpp

typedef ReorderNodeChildCommand = flight._cpp.ReorderNodeChildCommand;

#elseif (js && flight_esm)

typedef ReorderNodeChildCommand = flight._js.ReorderNodeChildCommand;

#elseif js

#error "flight.ReorderNodeChildCommand on js requires flight_esm."

#else

#error "flight.ReorderNodeChildCommand: no backend for this target."

#end
