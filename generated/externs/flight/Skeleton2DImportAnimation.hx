package flight;

#if hl

typedef Skeleton2DImportAnimation = flight._hl.Skeleton2DImportAnimation;

#elseif cpp

typedef Skeleton2DImportAnimation = flight._cpp.Skeleton2DImportAnimation;

#elseif (js && flight_esm)

typedef Skeleton2DImportAnimation = flight._js.Skeleton2DImportAnimation;

#elseif js

#error "flight.Skeleton2DImportAnimation on js requires flight_esm."

#else

#error "flight.Skeleton2DImportAnimation: no backend for this target."

#end
