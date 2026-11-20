package flight;

#if hl

typedef MidiAccessStateSubscription = flight._hl.MidiAccessStateSubscription;

#elseif cpp

typedef MidiAccessStateSubscription = flight._cpp.MidiAccessStateSubscription;

#elseif (js && flight_esm)

typedef MidiAccessStateSubscription = flight._js.MidiAccessStateSubscription;

#elseif js

#error "flight.MidiAccessStateSubscription on js requires flight_esm."

#else

#error "flight.MidiAccessStateSubscription: no backend for this target."

#end
