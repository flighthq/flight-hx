package flight;

#if hl

typedef PathMesh = flight._hl.PathMesh;

#elseif cpp

typedef PathMesh = flight._cpp.PathMesh;

#elseif (js && flight_esm)

typedef PathMesh = flight._js.PathMesh;

#elseif js

#error "flight.PathMesh on js requires flight_esm."

#else

#error "flight.PathMesh: no backend for this target."

#end
