package flight;

#if hl

typedef OrbitCameraController = flight._hl.OrbitCameraController;

#elseif cpp

typedef OrbitCameraController = flight._cpp.OrbitCameraController;

#elseif (js && flight_esm)

typedef OrbitCameraController = flight._js.OrbitCameraController;

#elseif js

#error "flight.OrbitCameraController on js requires flight_esm."

#else

#error "flight.OrbitCameraController: no backend for this target."

#end
