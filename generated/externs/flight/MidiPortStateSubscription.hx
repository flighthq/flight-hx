package flight;

#if hl

typedef MidiPortStateSubscription = flight._hl.MidiPortStateSubscription;

#elseif cpp

typedef MidiPortStateSubscription = flight._cpp.MidiPortStateSubscription;

#elseif (js && flight_esm)

typedef MidiPortStateSubscription = flight._js.MidiPortStateSubscription;

#elseif js

#error "flight.MidiPortStateSubscription on js requires flight_esm."

#else

#error "flight.MidiPortStateSubscription: no backend for this target."

#end
