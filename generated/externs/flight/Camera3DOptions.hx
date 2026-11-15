package flight;

#if hl

typedef Camera3DOptions = flight._hl.Camera3DOptions;

#elseif cpp

typedef Camera3DOptions = flight._cpp.Camera3DOptions;

#elseif (js && flight_esm)

typedef Camera3DOptions = flight._js.Camera3DOptions;

#elseif js

#error "flight.Camera3DOptions on js requires flight_esm."

#else

#error "flight.Camera3DOptions: no backend for this target."

#end
