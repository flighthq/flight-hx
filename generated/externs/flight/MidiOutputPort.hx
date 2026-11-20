package flight;

#if hl

typedef MidiOutputPort = flight._hl.MidiOutputPort;

#elseif cpp

typedef MidiOutputPort = flight._cpp.MidiOutputPort;

#elseif (js && flight_esm)

typedef MidiOutputPort = flight._js.MidiOutputPort;

#elseif js

#error "flight.MidiOutputPort on js requires flight_esm."

#else

#error "flight.MidiOutputPort: no backend for this target."

#end
