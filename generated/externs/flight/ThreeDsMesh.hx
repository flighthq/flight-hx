package flight;

#if hl

typedef ThreeDsMesh = flight._hl.ThreeDsMesh;

#elseif cpp

typedef ThreeDsMesh = flight._cpp.ThreeDsMesh;

#elseif (js && flight_esm)

typedef ThreeDsMesh = flight._js.ThreeDsMesh;

#elseif js

#error "flight.ThreeDsMesh on js requires flight_esm."

#else

#error "flight.ThreeDsMesh: no backend for this target."

#end
