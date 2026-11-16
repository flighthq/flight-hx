package flight;

#if hl

typedef LambertMaterial = flight._hl.LambertMaterial;

#elseif cpp

typedef LambertMaterial = flight._cpp.LambertMaterial;

#elseif (js && flight_esm)

typedef LambertMaterial = flight._js.LambertMaterial;

#elseif js

#error "flight.LambertMaterial on js requires flight_esm."

#else

#error "flight.LambertMaterial: no backend for this target."

#end
