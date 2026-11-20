package flight;

#if hl

typedef CompositeCommand = flight._hl.CompositeCommand;

#elseif cpp

typedef CompositeCommand = flight._cpp.CompositeCommand;

#elseif (js && flight_esm)

typedef CompositeCommand = flight._js.CompositeCommand;

#elseif js

#error "flight.CompositeCommand on js requires flight_esm."

#else

#error "flight.CompositeCommand: no backend for this target."

#end
