package flight;

#if hl

typedef PointerEventData = flight._hl.PointerEventData;

#elseif cpp

typedef PointerEventData = flight._cpp.PointerEventData;

#elseif (js && flight_esm)

typedef PointerEventData = flight._js.PointerEventData;

#elseif js

#error "flight.PointerEventData on js requires flight_esm."

#else

#error "flight.PointerEventData: no backend for this target."

#end
