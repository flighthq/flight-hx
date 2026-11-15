package flight;

#if hl

typedef SvgRegistry = flight._hl.SvgRegistry;

#elseif cpp

typedef SvgRegistry = flight._cpp.SvgRegistry;

#elseif (js && flight_esm)

typedef SvgRegistry = flight._js.SvgRegistry;

#elseif js

#error "flight.SvgRegistry on js requires flight_esm."

#else

#error "flight.SvgRegistry: no backend for this target."

#end
