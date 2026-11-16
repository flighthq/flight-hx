package flight;

#if hl

typedef Md2SectionHandler = flight._hl.Md2SectionHandler;

#elseif cpp

typedef Md2SectionHandler = flight._cpp.Md2SectionHandler;

#elseif (js && flight_esm)

typedef Md2SectionHandler = flight._js.Md2SectionHandler;

#elseif js

#error "flight.Md2SectionHandler on js requires flight_esm."

#else

#error "flight.Md2SectionHandler: no backend for this target."

#end
