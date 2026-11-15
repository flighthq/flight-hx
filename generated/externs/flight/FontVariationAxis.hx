package flight;

#if hl

typedef FontVariationAxis = flight._hl.FontVariationAxis;

#elseif cpp

typedef FontVariationAxis = flight._cpp.FontVariationAxis;

#elseif (js && flight_esm)

typedef FontVariationAxis = flight._js.FontVariationAxis;

#elseif js

#error "flight.FontVariationAxis on js requires flight_esm."

#else

#error "flight.FontVariationAxis: no backend for this target."

#end
