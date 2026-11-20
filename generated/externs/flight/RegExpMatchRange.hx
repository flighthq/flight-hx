package flight;

#if hl

typedef RegExpMatchRange = flight._hl.RegExpMatchRange;

#elseif cpp

typedef RegExpMatchRange = flight._cpp.RegExpMatchRange;

#elseif (js && flight_esm)

typedef RegExpMatchRange = flight._js.RegExpMatchRange;

#elseif js

#error "flight.RegExpMatchRange on js requires flight_esm."

#else

#error "flight.RegExpMatchRange: no backend for this target."

#end
