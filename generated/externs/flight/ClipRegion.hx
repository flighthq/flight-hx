package flight;

#if hl

typedef ClipRegion = flight._hl.ClipRegion;

#elseif cpp

typedef ClipRegion = flight._cpp.ClipRegion;

#elseif (js && flight_esm)

typedef ClipRegion = flight._js.ClipRegion;

#elseif js

#error "flight.ClipRegion on js requires flight_esm."

#else

#error "flight.ClipRegion: no backend for this target."

#end
