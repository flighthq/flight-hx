package flight;

#if hl

typedef SvgViewportOptions = flight._hl.SvgViewportOptions;

#elseif cpp

typedef SvgViewportOptions = flight._cpp.SvgViewportOptions;

#elseif (js && flight_esm)

typedef SvgViewportOptions = flight._js.SvgViewportOptions;

#elseif js

#error "flight.SvgViewportOptions on js requires flight_esm."

#else

#error "flight.SvgViewportOptions: no backend for this target."

#end
