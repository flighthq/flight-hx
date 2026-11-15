package flight;

#if hl

typedef KuwaharaEffect = flight._hl.KuwaharaEffect;

#elseif cpp

typedef KuwaharaEffect = flight._cpp.KuwaharaEffect;

#elseif (js && flight_esm)

typedef KuwaharaEffect = flight._js.KuwaharaEffect;

#elseif js

#error "flight.KuwaharaEffect on js requires flight_esm."

#else

#error "flight.KuwaharaEffect: no backend for this target."

#end
