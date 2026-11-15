package flight;

#if hl

typedef VertexDisplaceModifier = flight._hl.VertexDisplaceModifier;

#elseif cpp

typedef VertexDisplaceModifier = flight._cpp.VertexDisplaceModifier;

#elseif (js && flight_esm)

typedef VertexDisplaceModifier = flight._js.VertexDisplaceModifier;

#elseif js

#error "flight.VertexDisplaceModifier on js requires flight_esm."

#else

#error "flight.VertexDisplaceModifier: no backend for this target."

#end
