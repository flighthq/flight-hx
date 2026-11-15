package flight;

#if hl

typedef VertexDisplaceModifierOptions = flight._hl.VertexDisplaceModifierOptions;

#elseif cpp

typedef VertexDisplaceModifierOptions = flight._cpp.VertexDisplaceModifierOptions;

#elseif (js && flight_esm)

typedef VertexDisplaceModifierOptions = flight._js.VertexDisplaceModifierOptions;

#elseif js

#error "flight.VertexDisplaceModifierOptions on js requires flight_esm."

#else

#error "flight.VertexDisplaceModifierOptions: no backend for this target."

#end
