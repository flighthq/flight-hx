package flight;

#if hl

typedef Awd2StringRead = flight._hl.Awd2StringRead;

#elseif cpp

typedef Awd2StringRead = flight._cpp.Awd2StringRead;

#elseif (js && flight_esm)

typedef Awd2StringRead = flight._js.Awd2StringRead;

#elseif js

#error "flight.Awd2StringRead on js requires flight_esm."

#else

#error "flight.Awd2StringRead: no backend for this target."

#end
