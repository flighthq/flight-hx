package flight;

#if hl

typedef LayoutTree = flight._hl.LayoutTree;

#elseif cpp

typedef LayoutTree = flight._cpp.LayoutTree;

#elseif (js && flight_esm)

typedef LayoutTree = flight._js.LayoutTree;

#elseif js

#error "flight.LayoutTree on js requires flight_esm."

#else

#error "flight.LayoutTree: no backend for this target."

#end
