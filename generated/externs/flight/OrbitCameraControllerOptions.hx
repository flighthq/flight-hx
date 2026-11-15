package flight;

#if hl

typedef OrbitCameraControllerOptions = flight._hl.OrbitCameraControllerOptions;

#elseif cpp

typedef OrbitCameraControllerOptions = flight._cpp.OrbitCameraControllerOptions;

#elseif (js && flight_esm)

typedef OrbitCameraControllerOptions = flight._js.OrbitCameraControllerOptions;

#elseif js

#error "flight.OrbitCameraControllerOptions on js requires flight_esm."

#else

#error "flight.OrbitCameraControllerOptions: no backend for this target."

#end
