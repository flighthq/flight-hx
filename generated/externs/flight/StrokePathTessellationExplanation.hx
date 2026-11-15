package flight;

#if hl

typedef StrokePathTessellationExplanation = flight._hl.StrokePathTessellationExplanation;

#elseif cpp

typedef StrokePathTessellationExplanation = flight._cpp.StrokePathTessellationExplanation;

#elseif (js && flight_esm)

typedef StrokePathTessellationExplanation = flight._js.StrokePathTessellationExplanation;

#elseif js

#error "flight.StrokePathTessellationExplanation on js requires flight_esm."

#else

#error "flight.StrokePathTessellationExplanation: no backend for this target."

#end
