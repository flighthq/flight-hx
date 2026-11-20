package flight;

#if hl

typedef MidiInputPort = flight._hl.MidiInputPort;

#elseif cpp

typedef MidiInputPort = flight._cpp.MidiInputPort;

#elseif (js && flight_esm)

typedef MidiInputPort = flight._js.MidiInputPort;

#elseif js

#error "flight.MidiInputPort on js requires flight_esm."

#else

#error "flight.MidiInputPort: no backend for this target."

#end
