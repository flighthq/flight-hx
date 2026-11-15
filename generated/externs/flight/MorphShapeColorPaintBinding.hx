package flight;

#if hl

typedef MorphShapeColorPaintBinding = flight._hl.MorphShapeColorPaintBinding;

#elseif cpp

typedef MorphShapeColorPaintBinding = flight._cpp.MorphShapeColorPaintBinding;

#elseif (js && flight_esm)

typedef MorphShapeColorPaintBinding = flight._js.MorphShapeColorPaintBinding;

#elseif js

#error "flight.MorphShapeColorPaintBinding on js requires flight_esm."

#else

#error "flight.MorphShapeColorPaintBinding: no backend for this target."

#end
