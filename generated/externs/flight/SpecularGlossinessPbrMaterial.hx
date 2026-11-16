package flight;

#if hl

typedef SpecularGlossinessPbrMaterial = flight._hl.SpecularGlossinessPbrMaterial;

#elseif cpp

typedef SpecularGlossinessPbrMaterial = flight._cpp.SpecularGlossinessPbrMaterial;

#elseif (js && flight_esm)

typedef SpecularGlossinessPbrMaterial = flight._js.SpecularGlossinessPbrMaterial;

#elseif js

#error "flight.SpecularGlossinessPbrMaterial on js requires flight_esm."

#else

#error "flight.SpecularGlossinessPbrMaterial: no backend for this target."

#end
