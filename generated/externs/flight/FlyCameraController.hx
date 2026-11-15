package flight;

#if hl

typedef FlyCameraController = flight._hl.FlyCameraController;

#elseif cpp

typedef FlyCameraController = flight._cpp.FlyCameraController;

#elseif (js && flight_esm)

typedef FlyCameraController = flight._js.FlyCameraController;

#elseif js

#error "flight.FlyCameraController on js requires flight_esm."

#else

#error "flight.FlyCameraController: no backend for this target."

#end
