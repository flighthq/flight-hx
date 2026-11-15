package flight;

#if hl

typedef SvgGradientStop = flight._hl.SvgGradientStop;

#elseif cpp

typedef SvgGradientStop = flight._cpp.SvgGradientStop;

#elseif (js && flight_esm)

typedef SvgGradientStop = flight._js.SvgGradientStop;

#elseif js

#error "flight.SvgGradientStop on js requires flight_esm."

#else

#error "flight.SvgGradientStop: no backend for this target."

#end
