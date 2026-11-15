package flight;

#if hl

typedef TextLabelData = flight._hl.TextLabelData;

#elseif cpp

typedef TextLabelData = flight._cpp.TextLabelData;

#elseif (js && flight_esm)

typedef TextLabelData = flight._js.TextLabelData;

#elseif js

#error "flight.TextLabelData on js requires flight_esm."

#else

#error "flight.TextLabelData: no backend for this target."

#end
