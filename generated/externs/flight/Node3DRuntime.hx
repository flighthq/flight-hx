package flight;

#if hl

typedef Node3DRuntime = flight._hl.Node3DRuntime;

#elseif cpp

typedef Node3DRuntime = flight._cpp.Node3DRuntime;

#elseif (js && flight_esm)

typedef Node3DRuntime = flight._js.Node3DRuntime;

#elseif js

#error "flight.Node3DRuntime on js requires flight_esm."

#else

#error "flight.Node3DRuntime: no backend for this target."

#end
