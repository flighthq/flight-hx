package flight;

#if hl

typedef ShapeBoundsExplanation = flight._hl.ShapeBoundsExplanation;

#elseif cpp

typedef ShapeBoundsExplanation = flight._cpp.ShapeBoundsExplanation;

#elseif (js && flight_esm)

typedef ShapeBoundsExplanation = flight._js.ShapeBoundsExplanation;

#elseif js

#error "flight.ShapeBoundsExplanation on js requires flight_esm."

#else

#error "flight.ShapeBoundsExplanation: no backend for this target."

#end
