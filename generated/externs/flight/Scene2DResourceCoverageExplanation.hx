package flight;

#if hl

typedef Scene2DResourceCoverageExplanation = flight._hl.Scene2DResourceCoverageExplanation;

#elseif cpp

typedef Scene2DResourceCoverageExplanation = flight._cpp.Scene2DResourceCoverageExplanation;

#elseif (js && flight_esm)

typedef Scene2DResourceCoverageExplanation = flight._js.Scene2DResourceCoverageExplanation;

#elseif js

#error "flight.Scene2DResourceCoverageExplanation on js requires flight_esm."

#else

#error "flight.Scene2DResourceCoverageExplanation: no backend for this target."

#end
