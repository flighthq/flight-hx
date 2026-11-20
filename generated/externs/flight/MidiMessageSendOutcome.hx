package flight;

#if hl

typedef MidiMessageSendOutcome = flight._hl.MidiMessageSendOutcome;

#elseif cpp

typedef MidiMessageSendOutcome = flight._cpp.MidiMessageSendOutcome;

#elseif (js && flight_esm)

typedef MidiMessageSendOutcome = flight._js.MidiMessageSendOutcome;

#elseif js

#error "flight.MidiMessageSendOutcome on js requires flight_esm."

#else

#error "flight.MidiMessageSendOutcome: no backend for this target."

#end
