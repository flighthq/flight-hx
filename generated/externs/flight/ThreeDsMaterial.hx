package flight;

#if hl

typedef ThreeDsMaterial = flight._hl.ThreeDsMaterial;

#elseif cpp

typedef ThreeDsMaterial = flight._cpp.ThreeDsMaterial;

#elseif (js && flight_esm)

typedef ThreeDsMaterial = flight._js.ThreeDsMaterial;

#elseif js

#error "flight.ThreeDsMaterial on js requires flight_esm."

#else

#error "flight.ThreeDsMaterial: no backend for this target."

#end
