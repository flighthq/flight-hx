package flight;

#if hl

typedef MorphShapeData = flight._hl.MorphShapeData;

#elseif cpp

typedef MorphShapeData = flight._cpp.MorphShapeData;

#elseif (js && flight_esm)

typedef MorphShapeData = flight._js.MorphShapeData;

#elseif js

#error "flight.MorphShapeData on js requires flight_esm."

#else

#error "flight.MorphShapeData: no backend for this target."

#end
