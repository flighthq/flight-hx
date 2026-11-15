package flight;

#if hl

typedef Camera3D = flight._hl.Camera3D;

#elseif cpp

typedef Camera3D = flight._cpp.Camera3D;

#elseif (js && flight_esm)

typedef Camera3D = flight._js.Camera3D;

#elseif js

#error "flight.Camera3D on js requires flight_esm."

#else

#error "flight.Camera3D: no backend for this target."

#end
