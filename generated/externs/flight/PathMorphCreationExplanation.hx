package flight;

#if hl

typedef PathMorphCreationExplanation = flight._hl.PathMorphCreationExplanation;

#elseif cpp

typedef PathMorphCreationExplanation = flight._cpp.PathMorphCreationExplanation;

#elseif (js && flight_esm)

typedef PathMorphCreationExplanation = flight._js.PathMorphCreationExplanation;

#elseif js

#error "flight.PathMorphCreationExplanation on js requires flight_esm."

#else

#error "flight.PathMorphCreationExplanation: no backend for this target."

#end
