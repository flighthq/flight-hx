package flight;

#if hl

typedef MorphShapeGradientPaintBinding = flight._hl.MorphShapeGradientPaintBinding;

#elseif cpp

typedef MorphShapeGradientPaintBinding = flight._cpp.MorphShapeGradientPaintBinding;

#elseif (js && flight_esm)

typedef MorphShapeGradientPaintBinding = flight._js.MorphShapeGradientPaintBinding;

#elseif js

#error "flight.MorphShapeGradientPaintBinding on js requires flight_esm."

#else

#error "flight.MorphShapeGradientPaintBinding: no backend for this target."

#end
