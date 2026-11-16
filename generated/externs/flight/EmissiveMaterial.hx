package flight;

#if hl

typedef EmissiveMaterial = flight._hl.EmissiveMaterial;

#elseif cpp

typedef EmissiveMaterial = flight._cpp.EmissiveMaterial;

#elseif (js && flight_esm)

typedef EmissiveMaterial = flight._js.EmissiveMaterial;

#elseif js

#error "flight.EmissiveMaterial on js requires flight_esm."

#else

#error "flight.EmissiveMaterial: no backend for this target."

#end
