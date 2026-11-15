package flight;

#if hl

typedef MorphShapeTexturePaintBinding = flight._hl.MorphShapeTexturePaintBinding;

#elseif cpp

typedef MorphShapeTexturePaintBinding = flight._cpp.MorphShapeTexturePaintBinding;

#elseif (js && flight_esm)

typedef MorphShapeTexturePaintBinding = flight._js.MorphShapeTexturePaintBinding;

#elseif js

#error "flight.MorphShapeTexturePaintBinding on js requires flight_esm."

#else

#error "flight.MorphShapeTexturePaintBinding: no backend for this target."

#end
