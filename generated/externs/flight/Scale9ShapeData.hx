package flight;

#if hl

typedef Scale9ShapeData = flight._hl.Scale9ShapeData;

#elseif cpp

typedef Scale9ShapeData = flight._cpp.Scale9ShapeData;

#elseif (js && flight_esm)

typedef Scale9ShapeData = flight._js.Scale9ShapeData;

#elseif js

#error "flight.Scale9ShapeData on js requires flight_esm."

#else

#error "flight.Scale9ShapeData: no backend for this target."

#end
