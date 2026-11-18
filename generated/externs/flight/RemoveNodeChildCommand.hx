package flight;

#if hl

typedef RemoveNodeChildCommand = flight._hl.RemoveNodeChildCommand;

#elseif cpp

typedef RemoveNodeChildCommand = flight._cpp.RemoveNodeChildCommand;

#elseif (js && flight_esm)

typedef RemoveNodeChildCommand = flight._js.RemoveNodeChildCommand;

#elseif js

#error "flight.RemoveNodeChildCommand on js requires flight_esm."

#else

#error "flight.RemoveNodeChildCommand: no backend for this target."

#end
