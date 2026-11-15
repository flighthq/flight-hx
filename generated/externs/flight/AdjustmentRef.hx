package flight;

#if hl

typedef AdjustmentRef = flight._hl.AdjustmentRef;

#elseif cpp

typedef AdjustmentRef = flight._cpp.AdjustmentRef;

#elseif (js && flight_esm)

typedef AdjustmentRef = flight._js.AdjustmentRef;

#elseif js

#error "flight.AdjustmentRef on js requires flight_esm."

#else

#error "flight.AdjustmentRef: no backend for this target."

#end
