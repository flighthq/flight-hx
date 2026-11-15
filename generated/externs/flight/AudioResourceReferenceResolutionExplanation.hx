package flight;

#if hl

typedef AudioResourceReferenceResolutionExplanation = flight._hl.AudioResourceReferenceResolutionExplanation;

#elseif cpp

typedef AudioResourceReferenceResolutionExplanation = flight._cpp.AudioResourceReferenceResolutionExplanation;

#elseif (js && flight_esm)

typedef AudioResourceReferenceResolutionExplanation = flight._js.AudioResourceReferenceResolutionExplanation;

#elseif js

#error "flight.AudioResourceReferenceResolutionExplanation on js requires flight_esm."

#else

#error "flight.AudioResourceReferenceResolutionExplanation: no backend for this target."

#end
