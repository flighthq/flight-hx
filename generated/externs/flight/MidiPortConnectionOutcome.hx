package flight;

#if hl

typedef MidiPortConnectionOutcome = flight._hl.MidiPortConnectionOutcome;

#elseif cpp

typedef MidiPortConnectionOutcome = flight._cpp.MidiPortConnectionOutcome;

#elseif (js && flight_esm)

typedef MidiPortConnectionOutcome = flight._js.MidiPortConnectionOutcome;

#elseif js

#error "flight.MidiPortConnectionOutcome on js requires flight_esm."

#else

#error "flight.MidiPortConnectionOutcome: no backend for this target."

#end
