package flight;

#if hl

typedef MorphShapeLinePaintBinding = flight._hl.MorphShapeLinePaintBinding;

#elseif cpp

typedef MorphShapeLinePaintBinding = flight._cpp.MorphShapeLinePaintBinding;

#elseif (js && flight_esm)

typedef MorphShapeLinePaintBinding = flight._js.MorphShapeLinePaintBinding;

#elseif js

#error "flight.MorphShapeLinePaintBinding on js requires flight_esm."

#else

#error "flight.MorphShapeLinePaintBinding: no backend for this target."

#end
