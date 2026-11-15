package flight;

#if hl

typedef Camera3DViewExplanation = flight._hl.Camera3DViewExplanation;

#elseif cpp

typedef Camera3DViewExplanation = flight._cpp.Camera3DViewExplanation;

#elseif (js && flight_esm)

typedef Camera3DViewExplanation = flight._js.Camera3DViewExplanation;

#elseif js

#error "flight.Camera3DViewExplanation on js requires flight_esm."

#else

#error "flight.Camera3DViewExplanation: no backend for this target."

#end
