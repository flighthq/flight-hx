package flight;

#if hl

typedef FlyCameraControllerOptions = flight._hl.FlyCameraControllerOptions;

#elseif cpp

typedef FlyCameraControllerOptions = flight._cpp.FlyCameraControllerOptions;

#elseif (js && flight_esm)

typedef FlyCameraControllerOptions = flight._js.FlyCameraControllerOptions;

#elseif js

#error "flight.FlyCameraControllerOptions on js requires flight_esm."

#else

#error "flight.FlyCameraControllerOptions: no backend for this target."

#end
