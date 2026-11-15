package flight;

#if hl

typedef Frustum = flight._hl.Frustum;

#elseif cpp

typedef Frustum = flight._cpp.Frustum;

#elseif (js && flight_esm)

typedef Frustum = flight._js.Frustum;

#elseif js

#error "flight.Frustum on js requires flight_esm."

#else

#error "flight.Frustum: no backend for this target."

#end
