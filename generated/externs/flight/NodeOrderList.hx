package flight;

#if hl

typedef NodeOrderList = flight._hl.NodeOrderList;

#elseif cpp

typedef NodeOrderList = flight._cpp.NodeOrderList;

#elseif (js && flight_esm)

typedef NodeOrderList = flight._js.NodeOrderList;

#elseif js

#error "flight.NodeOrderList on js requires flight_esm."

#else

#error "flight.NodeOrderList: no backend for this target."

#end
