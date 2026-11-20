package flight;

#if hl

typedef MidiInputMessageSubscription = flight._hl.MidiInputMessageSubscription;

#elseif cpp

typedef MidiInputMessageSubscription = flight._cpp.MidiInputMessageSubscription;

#elseif (js && flight_esm)

typedef MidiInputMessageSubscription = flight._js.MidiInputMessageSubscription;

#elseif js

#error "flight.MidiInputMessageSubscription on js requires flight_esm."

#else

#error "flight.MidiInputMessageSubscription: no backend for this target."

#end
