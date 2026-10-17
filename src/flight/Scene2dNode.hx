package flight;

#if flight_hx
typedef Scene2dNode = flight._hx.Node2D;
#elseif (js && flight_esm)
typedef Scene2dNode = flight._js.Node2D;
#elseif cpp
typedef Scene2dNode = flight._cpp.Scene2dNode;
#elseif js
#error "flight.Scene2dNode on js requires flight_esm or flight_hx."
#else
#error "flight.Scene2dNode: no backend for this target."
#end
