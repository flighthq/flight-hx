package flight;

#if hl

typedef ClipRegionContoursExplanation = flight._hl.ClipRegionContoursExplanation;

#elseif cpp

typedef ClipRegionContoursExplanation = flight._cpp.ClipRegionContoursExplanation;

#elseif (js && flight_esm)

typedef ClipRegionContoursExplanation = flight._js.ClipRegionContoursExplanation;

#elseif js

#error "flight.ClipRegionContoursExplanation on js requires flight_esm."

#else

#error "flight.ClipRegionContoursExplanation: no backend for this target."

#end
