package flight;

#if hl

typedef Physics3DQueryFilter = flight._hl.Physics3DQueryFilter;

#elseif cpp

typedef Physics3DQueryFilter = flight._cpp.Physics3DQueryFilter;

#elseif (js && flight_esm)

typedef Physics3DQueryFilter = flight._js.Physics3DQueryFilter;

#elseif js

#error "flight.Physics3DQueryFilter on js requires flight_esm."

#else

#error "flight.Physics3DQueryFilter: no backend for this target."

#end
