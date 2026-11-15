package flight;

#if hl

typedef ImageResourceReferenceResolutionExplanation = flight._hl.ImageResourceReferenceResolutionExplanation;

#elseif cpp

typedef ImageResourceReferenceResolutionExplanation = flight._cpp.ImageResourceReferenceResolutionExplanation;

#elseif (js && flight_esm)

typedef ImageResourceReferenceResolutionExplanation = flight._js.ImageResourceReferenceResolutionExplanation;

#elseif js

#error "flight.ImageResourceReferenceResolutionExplanation on js requires flight_esm."

#else

#error "flight.ImageResourceReferenceResolutionExplanation: no backend for this target."

#end
