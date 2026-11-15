package flight;

#if hl

typedef ColorKeyframe = flight._hl.ColorKeyframe;

#elseif cpp

typedef ColorKeyframe = flight._cpp.ColorKeyframe;

#elseif (js && flight_esm)

typedef ColorKeyframe = flight._js.ColorKeyframe;

#elseif js

#error "flight.ColorKeyframe on js requires flight_esm."

#else

#error "flight.ColorKeyframe: no backend for this target."

#end
