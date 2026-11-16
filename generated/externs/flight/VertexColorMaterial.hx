package flight;

#if hl

typedef VertexColorMaterial = flight._hl.VertexColorMaterial;

#elseif cpp

typedef VertexColorMaterial = flight._cpp.VertexColorMaterial;

#elseif (js && flight_esm)

typedef VertexColorMaterial = flight._js.VertexColorMaterial;

#elseif js

#error "flight.VertexColorMaterial on js requires flight_esm."

#else

#error "flight.VertexColorMaterial: no backend for this target."

#end
