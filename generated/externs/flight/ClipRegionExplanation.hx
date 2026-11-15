package flight;

#if hl

typedef ClipRegionExplanation = flight._hl.ClipRegionExplanation;

#elseif cpp

typedef ClipRegionExplanation = flight._cpp.ClipRegionExplanation;

#elseif (js && flight_esm)

typedef ClipRegionExplanation = flight._js.ClipRegionExplanation;

#elseif js

#error "flight.ClipRegionExplanation on js requires flight_esm."

#else

#error "flight.ClipRegionExplanation: no backend for this target."

#end
