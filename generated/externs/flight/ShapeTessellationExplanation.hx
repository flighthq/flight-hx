package flight;

#if hl

typedef ShapeTessellationExplanation = flight._hl.ShapeTessellationExplanation;

#elseif cpp

typedef ShapeTessellationExplanation = flight._cpp.ShapeTessellationExplanation;

#elseif (js && flight_esm)

typedef ShapeTessellationExplanation = flight._js.ShapeTessellationExplanation;

#elseif js

#error "flight.ShapeTessellationExplanation on js requires flight_esm."

#else

#error "flight.ShapeTessellationExplanation: no backend for this target."

#end
