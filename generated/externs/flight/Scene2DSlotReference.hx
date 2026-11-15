package flight;

#if hl

typedef Scene2DSlotReference = flight._hl.Scene2DSlotReference;

#elseif cpp

typedef Scene2DSlotReference = flight._cpp.Scene2DSlotReference;

#elseif (js && flight_esm)

typedef Scene2DSlotReference = flight._js.Scene2DSlotReference;

#elseif js

#error "flight.Scene2DSlotReference on js requires flight_esm."

#else

#error "flight.Scene2DSlotReference: no backend for this target."

#end
