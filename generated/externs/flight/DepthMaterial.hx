package flight;

#if hl

typedef DepthMaterial = flight._hl.DepthMaterial;

#elseif cpp

typedef DepthMaterial = flight._cpp.DepthMaterial;

#elseif (js && flight_esm)

typedef DepthMaterial = flight._js.DepthMaterial;

#elseif js

#error "flight.DepthMaterial on js requires flight_esm."

#else

#error "flight.DepthMaterial: no backend for this target."

#end
