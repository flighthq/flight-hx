package flight;

#if hl

typedef SvgClipHandler = flight._hl.SvgClipHandler;

#elseif cpp

typedef SvgClipHandler = flight._cpp.SvgClipHandler;

#elseif (js && flight_esm)

typedef SvgClipHandler = flight._js.SvgClipHandler;

#elseif js

#error "flight.SvgClipHandler on js requires flight_esm."

#else

#error "flight.SvgClipHandler: no backend for this target."

#end
