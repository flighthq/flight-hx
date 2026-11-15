package flight;

#if hl

typedef LayoutResolutionExplanation = flight._hl.LayoutResolutionExplanation;

#elseif cpp

typedef LayoutResolutionExplanation = flight._cpp.LayoutResolutionExplanation;

#elseif (js && flight_esm)

typedef LayoutResolutionExplanation = flight._js.LayoutResolutionExplanation;

#elseif js

#error "flight.LayoutResolutionExplanation on js requires flight_esm."

#else

#error "flight.LayoutResolutionExplanation: no backend for this target."

#end
