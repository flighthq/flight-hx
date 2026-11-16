package flight;

#if hl

typedef Physics3DMaterial = flight._hl.Physics3DMaterial;

#elseif cpp

typedef Physics3DMaterial = flight._cpp.Physics3DMaterial;

#elseif (js && flight_esm)

typedef Physics3DMaterial = flight._js.Physics3DMaterial;

#elseif js

#error "flight.Physics3DMaterial on js requires flight_esm."

#else

#error "flight.Physics3DMaterial: no backend for this target."

#end
