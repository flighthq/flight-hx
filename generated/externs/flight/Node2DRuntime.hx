package flight;

#if hl

typedef Node2DRuntime = flight._hl.Node2DRuntime;

#elseif cpp

typedef Node2DRuntime = flight._cpp.Node2DRuntime;

#elseif (js && flight_esm)

typedef Node2DRuntime = flight._js.Node2DRuntime;

#elseif js

#error "flight.Node2DRuntime on js requires flight_esm."

#else

#error "flight.Node2DRuntime: no backend for this target."

#end
