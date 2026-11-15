package flight;

#if hl

typedef SvgGradient = flight._hl.SvgGradient;

#elseif cpp

typedef SvgGradient = flight._cpp.SvgGradient;

#elseif (js && flight_esm)

typedef SvgGradient = flight._js.SvgGradient;

#elseif js

#error "flight.SvgGradient on js requires flight_esm."

#else

#error "flight.SvgGradient: no backend for this target."

#end
