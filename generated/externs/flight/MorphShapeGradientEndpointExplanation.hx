package flight;

#if hl

typedef MorphShapeGradientEndpointExplanation = flight._hl.MorphShapeGradientEndpointExplanation;

#elseif cpp

typedef MorphShapeGradientEndpointExplanation = flight._cpp.MorphShapeGradientEndpointExplanation;

#elseif (js && flight_esm)

typedef MorphShapeGradientEndpointExplanation = flight._js.MorphShapeGradientEndpointExplanation;

#elseif js

#error "flight.MorphShapeGradientEndpointExplanation on js requires flight_esm."

#else

#error "flight.MorphShapeGradientEndpointExplanation: no backend for this target."

#end
