package flight;

#if hl

typedef LayoutNode = flight._hl.LayoutNode;

#elseif cpp

typedef LayoutNode = flight._cpp.LayoutNode;

#elseif (js && flight_esm)

typedef LayoutNode = flight._js.LayoutNode;

#elseif js

#error "flight.LayoutNode on js requires flight_esm."

#else

#error "flight.LayoutNode: no backend for this target."

#end
