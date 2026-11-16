package flight;

#if hl

typedef Awd2Header = flight._hl.Awd2Header;

#elseif cpp

typedef Awd2Header = flight._cpp.Awd2Header;

#elseif (js && flight_esm)

typedef Awd2Header = flight._js.Awd2Header;

#elseif js

#error "flight.Awd2Header on js requires flight_esm."

#else

#error "flight.Awd2Header: no backend for this target."

#end
