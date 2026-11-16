package flight;

#if hl

typedef Awd2PropertySpan = flight._hl.Awd2PropertySpan;

#elseif cpp

typedef Awd2PropertySpan = flight._cpp.Awd2PropertySpan;

#elseif (js && flight_esm)

typedef Awd2PropertySpan = flight._js.Awd2PropertySpan;

#elseif js

#error "flight.Awd2PropertySpan on js requires flight_esm."

#else

#error "flight.Awd2PropertySpan: no backend for this target."

#end
