package flight;

#if hl

typedef Physics2DQueryResult = flight._hl.Physics2DQueryResult;

#elseif cpp

typedef Physics2DQueryResult = flight._cpp.Physics2DQueryResult;

#elseif (js && flight_esm)

typedef Physics2DQueryResult = flight._js.Physics2DQueryResult;

#elseif js

#error "flight.Physics2DQueryResult on js requires flight_esm."

#else

#error "flight.Physics2DQueryResult: no backend for this target."

#end
