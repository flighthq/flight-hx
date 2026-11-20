package flight;

#if hl

typedef AssetEntry = flight._hl.AssetEntry;

#elseif cpp

typedef AssetEntry = flight._cpp.AssetEntry;

#elseif (js && flight_esm)

typedef AssetEntry = flight._js.AssetEntry;

#elseif js

#error "flight.AssetEntry on js requires flight_esm."

#else

#error "flight.AssetEntry: no backend for this target."

#end
