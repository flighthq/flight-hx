package flight;

#if hl

typedef SvgElementHandler = flight._hl.SvgElementHandler;

#elseif cpp

typedef SvgElementHandler = flight._cpp.SvgElementHandler;

#elseif (js && flight_esm)

typedef SvgElementHandler = flight._js.SvgElementHandler;

#elseif js

#error "flight.SvgElementHandler on js requires flight_esm."

#else

#error "flight.SvgElementHandler: no backend for this target."

#end
