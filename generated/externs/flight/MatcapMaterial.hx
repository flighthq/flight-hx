package flight;

#if hl

typedef MatcapMaterial = flight._hl.MatcapMaterial;

#elseif cpp

typedef MatcapMaterial = flight._cpp.MatcapMaterial;

#elseif (js && flight_esm)

typedef MatcapMaterial = flight._js.MatcapMaterial;

#elseif js

#error "flight.MatcapMaterial on js requires flight_esm."

#else

#error "flight.MatcapMaterial: no backend for this target."

#end
