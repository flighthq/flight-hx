package flight;

#if hl

typedef SlotId = flight._hl.SlotId;

#elseif cpp

typedef SlotId = flight._cpp.SlotId;

#elseif (js && flight_esm)

typedef SlotId = flight._js.SlotId;

#elseif js

#error "flight.SlotId on js requires flight_esm."

#else

#error "flight.SlotId: no backend for this target."

#end
