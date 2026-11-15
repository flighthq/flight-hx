package flight;

#if hl

typedef ShapeData = flight._hl.ShapeData;

#elseif cpp

typedef ShapeData = flight._cpp.ShapeData;

#elseif (js && flight_esm)

typedef ShapeData = flight._js.ShapeData;

#elseif js

#error "flight.ShapeData on js requires flight_esm."

#else

#error "flight.ShapeData: no backend for this target."

#end
