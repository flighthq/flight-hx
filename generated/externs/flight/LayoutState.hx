package flight;

#if hl

typedef LayoutState = flight._hl.LayoutState;

#elseif cpp

typedef LayoutState = flight._cpp.LayoutState;

#elseif (js && flight_esm)

typedef LayoutState = flight._js.LayoutState;

#elseif js

#error "flight.LayoutState on js requires flight_esm."

#else

#error "flight.LayoutState: no backend for this target."

#end
