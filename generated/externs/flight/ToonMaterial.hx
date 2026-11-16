package flight;

#if hl

typedef ToonMaterial = flight._hl.ToonMaterial;

#elseif cpp

typedef ToonMaterial = flight._cpp.ToonMaterial;

#elseif (js && flight_esm)

typedef ToonMaterial = flight._js.ToonMaterial;

#elseif js

#error "flight.ToonMaterial on js requires flight_esm."

#else

#error "flight.ToonMaterial: no backend for this target."

#end
