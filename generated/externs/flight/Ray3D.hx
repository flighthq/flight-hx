package flight;

#if hl

typedef Ray3D = flight._hl.Ray3D;

#elseif cpp

typedef Ray3D = flight._cpp.Ray3D;

#elseif (js && flight_esm)

typedef Ray3D = flight._js.Ray3D;

#elseif js

#error "flight.Ray3D on js requires flight_esm."

#else

#error "flight.Ray3D: no backend for this target."

#end
