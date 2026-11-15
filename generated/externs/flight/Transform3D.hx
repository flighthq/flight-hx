package flight;

#if hl

typedef Transform3D = flight._hl.Transform3D;

#elseif cpp

typedef Transform3D = flight._cpp.Transform3D;

#elseif (js && flight_esm)

typedef Transform3D = flight._js.Transform3D;

#elseif js

#error "flight.Transform3D on js requires flight_esm."

#else

#error "flight.Transform3D: no backend for this target."

#end
