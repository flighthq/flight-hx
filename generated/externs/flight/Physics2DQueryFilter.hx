package flight;

#if hl

typedef Physics2DQueryFilter = flight._hl.Physics2DQueryFilter;

#elseif cpp

typedef Physics2DQueryFilter = flight._cpp.Physics2DQueryFilter;

#elseif (js && flight_esm)

typedef Physics2DQueryFilter = flight._js.Physics2DQueryFilter;

#elseif js

#error "flight.Physics2DQueryFilter on js requires flight_esm."

#else

#error "flight.Physics2DQueryFilter: no backend for this target."

#end
