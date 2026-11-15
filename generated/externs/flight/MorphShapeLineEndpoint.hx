package flight;

#if hl

typedef MorphShapeLineEndpoint = flight._hl.MorphShapeLineEndpoint;

#elseif cpp

typedef MorphShapeLineEndpoint = flight._cpp.MorphShapeLineEndpoint;

#elseif (js && flight_esm)

typedef MorphShapeLineEndpoint = flight._js.MorphShapeLineEndpoint;

#elseif js

#error "flight.MorphShapeLineEndpoint on js requires flight_esm."

#else

#error "flight.MorphShapeLineEndpoint: no backend for this target."

#end
