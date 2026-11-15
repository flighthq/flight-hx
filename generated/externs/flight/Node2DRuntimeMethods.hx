package flight;

#if hl

typedef Node2DRuntimeMethods = flight._hl.Node2DRuntimeMethods;

#elseif cpp

typedef Node2DRuntimeMethods = flight._cpp.Node2DRuntimeMethods;

#elseif (js && flight_esm)

typedef Node2DRuntimeMethods = flight._js.Node2DRuntimeMethods;

#elseif js

#error "flight.Node2DRuntimeMethods on js requires flight_esm."

#else

#error "flight.Node2DRuntimeMethods: no backend for this target."

#end
