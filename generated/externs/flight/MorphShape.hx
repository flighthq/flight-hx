package flight;

#if hl

typedef MorphShape = flight._hl.MorphShape;

#elseif cpp

typedef MorphShape = flight._cpp.MorphShape;

#elseif (js && flight_esm)

typedef MorphShape = flight._js.MorphShape;

#elseif js

#error "flight.MorphShape on js requires flight_esm."

#else

#error "flight.MorphShape: no backend for this target."

#end
