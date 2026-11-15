package flight;

#if hl

typedef SvgPathDataExplanation = flight._hl.SvgPathDataExplanation;

#elseif cpp

typedef SvgPathDataExplanation = flight._cpp.SvgPathDataExplanation;

#elseif (js && flight_esm)

typedef SvgPathDataExplanation = flight._js.SvgPathDataExplanation;

#elseif js

#error "flight.SvgPathDataExplanation on js requires flight_esm."

#else

#error "flight.SvgPathDataExplanation: no backend for this target."

#end
