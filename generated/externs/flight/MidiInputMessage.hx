package flight;

#if hl

typedef MidiInputMessage = flight._hl.MidiInputMessage;

#elseif cpp

typedef MidiInputMessage = flight._cpp.MidiInputMessage;

#elseif (js && flight_esm)

typedef MidiInputMessage = flight._js.MidiInputMessage;

#elseif js

#error "flight.MidiInputMessage on js requires flight_esm."

#else

#error "flight.MidiInputMessage: no backend for this target."

#end
