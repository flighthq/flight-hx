package flight;

#if hl

typedef HasTransform2DOptions = flight._hl.HasTransform2DOptions;

#elseif cpp

typedef HasTransform2DOptions = flight._cpp.HasTransform2DOptions;

#elseif (js && flight_esm)

typedef HasTransform2DOptions = flight._js.HasTransform2DOptions;

#elseif js

#error "flight.HasTransform2DOptions on js requires flight_esm."

#else

#error "flight.HasTransform2DOptions: no backend for this target."

#end
