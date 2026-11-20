package flight;

#if hl

typedef MidiPort = flight._hl.MidiPort;

#elseif cpp

typedef MidiPort = flight._cpp.MidiPort;

#elseif (js && flight_esm)

typedef MidiPort = flight._js.MidiPort;

#elseif js

#error "flight.MidiPort on js requires flight_esm."

#else

#error "flight.MidiPort: no backend for this target."

#end
