package flight;

#if hl

typedef HasTransform2DRuntime = flight._hl.HasTransform2DRuntime;

#elseif cpp

typedef HasTransform2DRuntime = flight._cpp.HasTransform2DRuntime;

#elseif (js && flight_esm)

typedef HasTransform2DRuntime = flight._js.HasTransform2DRuntime;

#elseif js

#error "flight.HasTransform2DRuntime on js requires flight_esm."

#else

#error "flight.HasTransform2DRuntime: no backend for this target."

#end
