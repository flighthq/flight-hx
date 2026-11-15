package flight;

#if hl

typedef HasTransform3D = flight._hl.HasTransform3D;

#elseif cpp

typedef HasTransform3D = flight._cpp.HasTransform3D;

#elseif (js && flight_esm)

typedef HasTransform3D = flight._js.HasTransform3D;

#elseif js

#error "flight.HasTransform3D on js requires flight_esm."

#else

#error "flight.HasTransform3D: no backend for this target."

#end
