package flight;

#if hl

typedef LassoSelection = flight._hl.LassoSelection;

#elseif cpp

typedef LassoSelection = flight._cpp.LassoSelection;

#elseif (js && flight_esm)

typedef LassoSelection = flight._js.LassoSelection;

#elseif js

#error "flight.LassoSelection on js requires flight_esm."

#else

#error "flight.LassoSelection: no backend for this target."

#end
