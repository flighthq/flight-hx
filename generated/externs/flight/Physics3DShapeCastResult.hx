package flight;

#if hl

typedef Physics3DShapeCastResult = flight._hl.Physics3DShapeCastResult;

#elseif cpp

typedef Physics3DShapeCastResult = flight._cpp.Physics3DShapeCastResult;

#elseif (js && flight_esm)

typedef Physics3DShapeCastResult = flight._js.Physics3DShapeCastResult;

#elseif js

#error "flight.Physics3DShapeCastResult on js requires flight_esm."

#else

#error "flight.Physics3DShapeCastResult: no backend for this target."

#end
