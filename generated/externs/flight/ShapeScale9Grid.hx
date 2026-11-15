package flight;

#if hl

typedef ShapeScale9Grid = flight._hl.ShapeScale9Grid;

#elseif cpp

typedef ShapeScale9Grid = flight._cpp.ShapeScale9Grid;

#elseif (js && flight_esm)

typedef ShapeScale9Grid = flight._js.ShapeScale9Grid;

#elseif js

#error "flight.ShapeScale9Grid on js requires flight_esm."

#else

#error "flight.ShapeScale9Grid: no backend for this target."

#end
