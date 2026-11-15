package flight;

#if hl

typedef Physics2DShapeCastResult = flight._hl.Physics2DShapeCastResult;

#elseif cpp

typedef Physics2DShapeCastResult = flight._cpp.Physics2DShapeCastResult;

#elseif (js && flight_esm)

typedef Physics2DShapeCastResult = flight._js.Physics2DShapeCastResult;

#elseif js

#error "flight.Physics2DShapeCastResult on js requires flight_esm."

#else

#error "flight.Physics2DShapeCastResult: no backend for this target."

#end
