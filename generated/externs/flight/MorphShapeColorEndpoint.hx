package flight;

#if hl

typedef MorphShapeColorEndpoint = flight._hl.MorphShapeColorEndpoint;

#elseif cpp

typedef MorphShapeColorEndpoint = flight._cpp.MorphShapeColorEndpoint;

#elseif (js && flight_esm)

typedef MorphShapeColorEndpoint = flight._js.MorphShapeColorEndpoint;

#elseif js

#error "flight.MorphShapeColorEndpoint on js requires flight_esm."

#else

#error "flight.MorphShapeColorEndpoint: no backend for this target."

#end
