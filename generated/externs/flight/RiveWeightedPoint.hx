package flight;

#if hl

typedef RiveWeightedPoint = flight._hl.RiveWeightedPoint;

#elseif cpp

typedef RiveWeightedPoint = flight._cpp.RiveWeightedPoint;

#elseif (js && flight_esm)

typedef RiveWeightedPoint = flight._js.RiveWeightedPoint;

#elseif js

#error "flight.RiveWeightedPoint on js requires flight_esm."

#else

#error "flight.RiveWeightedPoint: no backend for this target."

#end
