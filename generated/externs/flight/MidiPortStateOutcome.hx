package flight;

#if hl

typedef MidiPortStateOutcome = flight._hl.MidiPortStateOutcome;

#elseif cpp

typedef MidiPortStateOutcome = flight._cpp.MidiPortStateOutcome;

#elseif (js && flight_esm)

typedef MidiPortStateOutcome = flight._js.MidiPortStateOutcome;

#elseif js

#error "flight.MidiPortStateOutcome on js requires flight_esm."

#else

#error "flight.MidiPortStateOutcome: no backend for this target."

#end
