package flight;

#if hl

typedef AssetLoadExplanation = flight._hl.AssetLoadExplanation;

#elseif cpp

typedef AssetLoadExplanation = flight._cpp.AssetLoadExplanation;

#elseif (js && flight_esm)

typedef AssetLoadExplanation = flight._js.AssetLoadExplanation;

#elseif js

#error "flight.AssetLoadExplanation on js requires flight_esm."

#else

#error "flight.AssetLoadExplanation: no backend for this target."

#end
