package flight;

#if hl

typedef Camera2D = flight._hl.Camera2D;

#elseif cpp

typedef Camera2D = flight._cpp.Camera2D;

#elseif (js && flight_esm)

typedef Camera2D = flight._js.Camera2D;

#elseif js

#error "flight.Camera2D on js requires flight_esm."

#else

#error "flight.Camera2D: no backend for this target."

#end
