package flight;

#if hl

typedef HasTransform3DRuntime = flight._hl.HasTransform3DRuntime;

#elseif cpp

typedef HasTransform3DRuntime = flight._cpp.HasTransform3DRuntime;

#elseif (js && flight_esm)

typedef HasTransform3DRuntime = flight._js.HasTransform3DRuntime;

#elseif js

#error "flight.HasTransform3DRuntime on js requires flight_esm."

#else

#error "flight.HasTransform3DRuntime: no backend for this target."

#end
