package flight;

#if hl

typedef Physics3DQueryResult = flight._hl.Physics3DQueryResult;

#elseif cpp

typedef Physics3DQueryResult = flight._cpp.Physics3DQueryResult;

#elseif (js && flight_esm)

typedef Physics3DQueryResult = flight._js.Physics3DQueryResult;

#elseif js

#error "flight.Physics3DQueryResult on js requires flight_esm."

#else

#error "flight.Physics3DQueryResult: no backend for this target."

#end
