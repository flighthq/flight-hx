package flight;

#if hl

typedef BlinnPhongMaterial = flight._hl.BlinnPhongMaterial;

#elseif cpp

typedef BlinnPhongMaterial = flight._cpp.BlinnPhongMaterial;

#elseif (js && flight_esm)

typedef BlinnPhongMaterial = flight._js.BlinnPhongMaterial;

#elseif js

#error "flight.BlinnPhongMaterial on js requires flight_esm."

#else

#error "flight.BlinnPhongMaterial: no backend for this target."

#end
