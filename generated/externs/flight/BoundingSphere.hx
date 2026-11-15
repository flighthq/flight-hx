package flight;

#if hl

typedef BoundingSphere = flight._hl.BoundingSphere;

#elseif cpp

typedef BoundingSphere = flight._cpp.BoundingSphere;

#elseif (js && flight_esm)

typedef BoundingSphere = flight._js.BoundingSphere;

#elseif js

#error "flight.BoundingSphere on js requires flight_esm."

#else

#error "flight.BoundingSphere: no backend for this target."

#end
