package flight;

#if hl

typedef SpineAlphaKeyframe = flight._hl.SpineAlphaKeyframe;

#elseif cpp

typedef SpineAlphaKeyframe = flight._cpp.SpineAlphaKeyframe;

#elseif (js && flight_esm)

typedef SpineAlphaKeyframe = flight._js.SpineAlphaKeyframe;

#elseif js

#error "flight.SpineAlphaKeyframe on js requires flight_esm."

#else

#error "flight.SpineAlphaKeyframe: no backend for this target."

#end
