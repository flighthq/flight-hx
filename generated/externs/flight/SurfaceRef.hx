package flight;

#if hl

typedef SurfaceRef = flight._hl.SurfaceRef;

#elseif cpp

typedef SurfaceRef = flight._cpp.SurfaceRef;

#elseif (js && flight_esm)

typedef SurfaceRef = flight._js.SurfaceRef;

#elseif js

#error "flight.SurfaceRef on js requires flight_esm."

#else

#error "flight.SurfaceRef: no backend for this target."

#end
