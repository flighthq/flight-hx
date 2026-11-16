package flight;

#if hl

typedef WireframeMaterial = flight._hl.WireframeMaterial;

#elseif cpp

typedef WireframeMaterial = flight._cpp.WireframeMaterial;

#elseif (js && flight_esm)

typedef WireframeMaterial = flight._js.WireframeMaterial;

#elseif js

#error "flight.WireframeMaterial on js requires flight_esm."

#else

#error "flight.WireframeMaterial: no backend for this target."

#end
