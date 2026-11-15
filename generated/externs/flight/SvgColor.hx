package flight;

#if hl

typedef SvgColor = flight._hl.SvgColor;

#elseif cpp

typedef SvgColor = flight._cpp.SvgColor;

#elseif (js && flight_esm)

typedef SvgColor = flight._js.SvgColor;

#elseif js

#error "flight.SvgColor on js requires flight_esm."

#else

#error "flight.SvgColor: no backend for this target."

#end
