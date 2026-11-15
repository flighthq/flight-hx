package flight;

#if hl

typedef PathMeshTyped = flight._hl.PathMeshTyped;

#elseif cpp

typedef PathMeshTyped = flight._cpp.PathMeshTyped;

#elseif (js && flight_esm)

typedef PathMeshTyped = flight._js.PathMeshTyped;

#elseif js

#error "flight.PathMeshTyped on js requires flight_esm."

#else

#error "flight.PathMeshTyped: no backend for this target."

#end
