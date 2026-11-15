package flight;

#if hl

typedef SvgViewport = flight._hl.SvgViewport;

#elseif cpp

typedef SvgViewport = flight._cpp.SvgViewport;

#elseif (js && flight_esm)

typedef SvgViewport = flight._js.SvgViewport;

#elseif js

#error "flight.SvgViewport on js requires flight_esm."

#else

#error "flight.SvgViewport: no backend for this target."

#end
