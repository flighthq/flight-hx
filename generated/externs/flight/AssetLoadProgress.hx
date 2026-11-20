package flight;

#if hl

typedef AssetLoadProgress = flight._hl.AssetLoadProgress;

#elseif cpp

typedef AssetLoadProgress = flight._cpp.AssetLoadProgress;

#elseif (js && flight_esm)

typedef AssetLoadProgress = flight._js.AssetLoadProgress;

#elseif js

#error "flight.AssetLoadProgress on js requires flight_esm."

#else

#error "flight.AssetLoadProgress: no backend for this target."

#end
