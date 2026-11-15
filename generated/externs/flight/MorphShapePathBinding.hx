package flight;

#if hl

typedef MorphShapePathBinding = flight._hl.MorphShapePathBinding;

#elseif cpp

typedef MorphShapePathBinding = flight._cpp.MorphShapePathBinding;

#elseif (js && flight_esm)

typedef MorphShapePathBinding = flight._js.MorphShapePathBinding;

#elseif js

#error "flight.MorphShapePathBinding on js requires flight_esm."

#else

#error "flight.MorphShapePathBinding: no backend for this target."

#end
