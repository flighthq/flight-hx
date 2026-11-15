package flight;

#if hl

typedef Spring3D = flight._hl.Spring3D;

#elseif cpp

typedef Spring3D = flight._cpp.Spring3D;

#elseif (js && flight_esm)

typedef Spring3D = flight._js.Spring3D;

#elseif js

#error "flight.Spring3D on js requires flight_esm."

#else

#error "flight.Spring3D: no backend for this target."

#end
