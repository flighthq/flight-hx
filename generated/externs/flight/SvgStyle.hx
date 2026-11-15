package flight;

#if hl

typedef SvgStyle = flight._hl.SvgStyle;

#elseif cpp

typedef SvgStyle = flight._cpp.SvgStyle;

#elseif (js && flight_esm)

typedef SvgStyle = flight._js.SvgStyle;

#elseif js

#error "flight.SvgStyle on js requires flight_esm."

#else

#error "flight.SvgStyle: no backend for this target."

#end
