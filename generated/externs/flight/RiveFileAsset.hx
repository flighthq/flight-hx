package flight;

#if hl

typedef RiveFileAsset = flight._hl.RiveFileAsset;

#elseif cpp

typedef RiveFileAsset = flight._cpp.RiveFileAsset;

#elseif (js && flight_esm)

typedef RiveFileAsset = flight._js.RiveFileAsset;

#elseif js

#error "flight.RiveFileAsset on js requires flight_esm."

#else

#error "flight.RiveFileAsset: no backend for this target."

#end
