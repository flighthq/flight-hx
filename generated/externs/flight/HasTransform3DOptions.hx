package flight;

#if hl

typedef HasTransform3DOptions = flight._hl.HasTransform3DOptions;

#elseif cpp

typedef HasTransform3DOptions = flight._cpp.HasTransform3DOptions;

#elseif (js && flight_esm)

typedef HasTransform3DOptions = flight._js.HasTransform3DOptions;

#elseif js

#error "flight.HasTransform3DOptions on js requires flight_esm."

#else

#error "flight.HasTransform3DOptions: no backend for this target."

#end
