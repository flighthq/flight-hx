package flight;

#if hl

typedef AnyInteractionSignalSlot = flight._hl.AnyInteractionSignalSlot;

#elseif cpp

typedef AnyInteractionSignalSlot = flight._cpp.AnyInteractionSignalSlot;

#elseif (js && flight_esm)

typedef AnyInteractionSignalSlot = flight._js.AnyInteractionSignalSlot;

#elseif js

#error "flight.AnyInteractionSignalSlot on js requires flight_esm."

#else

#error "flight.AnyInteractionSignalSlot: no backend for this target."

#end
