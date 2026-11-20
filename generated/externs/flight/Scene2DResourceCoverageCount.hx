package flight;

#if hl

typedef Scene2DResourceCoverageCount = flight._hl.Scene2DResourceCoverageCount;

#elseif cpp

typedef Scene2DResourceCoverageCount = flight._cpp.Scene2DResourceCoverageCount;

#elseif (js && flight_esm)

typedef Scene2DResourceCoverageCount = flight._js.Scene2DResourceCoverageCount;

#elseif js

#error "flight.Scene2DResourceCoverageCount on js requires flight_esm."

#else

#error "flight.Scene2DResourceCoverageCount: no backend for this target."

#end
