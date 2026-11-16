package flight;

#if hl

typedef ColladaFeatureElements = flight._hl.ColladaFeatureElements;

#elseif cpp

typedef ColladaFeatureElements = flight._cpp.ColladaFeatureElements;

#elseif (js && flight_esm)

typedef ColladaFeatureElements = flight._js.ColladaFeatureElements;

#elseif js

#error "flight.ColladaFeatureElements on js requires flight_esm."

#else

#error "flight.ColladaFeatureElements: no backend for this target."

#end
