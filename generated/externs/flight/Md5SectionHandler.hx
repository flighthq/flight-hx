package flight;

#if hl

typedef Md5SectionHandler = flight._hl.Md5SectionHandler;

#elseif cpp

typedef Md5SectionHandler = flight._cpp.Md5SectionHandler;

#elseif (js && flight_esm)

typedef Md5SectionHandler = flight._js.Md5SectionHandler;

#elseif js

#error "flight.Md5SectionHandler on js requires flight_esm."

#else

#error "flight.Md5SectionHandler: no backend for this target."

#end
