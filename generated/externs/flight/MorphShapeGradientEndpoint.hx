package flight;

#if hl

typedef MorphShapeGradientEndpoint = flight._hl.MorphShapeGradientEndpoint;

#elseif cpp

typedef MorphShapeGradientEndpoint = flight._cpp.MorphShapeGradientEndpoint;

#elseif (js && flight_esm)

typedef MorphShapeGradientEndpoint = flight._js.MorphShapeGradientEndpoint;

#elseif js

#error "flight.MorphShapeGradientEndpoint on js requires flight_esm."

#else

#error "flight.MorphShapeGradientEndpoint: no backend for this target."

#end
