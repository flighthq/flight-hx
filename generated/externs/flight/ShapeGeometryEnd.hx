package flight;

#if hl

typedef ShapeGeometryEnd = flight._hl.ShapeGeometryEnd;

#elseif cpp

typedef ShapeGeometryEnd = flight._cpp.ShapeGeometryEnd;

#elseif (js && flight_esm)

typedef ShapeGeometryEnd = flight._js.ShapeGeometryEnd;

#elseif js

#error "flight.ShapeGeometryEnd on js requires flight_esm."

#else

#error "flight.ShapeGeometryEnd: no backend for this target."

#end
