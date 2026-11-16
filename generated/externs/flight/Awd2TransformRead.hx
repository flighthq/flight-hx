package flight;

#if hl

typedef Awd2TransformRead = flight._hl.Awd2TransformRead;

#elseif cpp

typedef Awd2TransformRead = flight._cpp.Awd2TransformRead;

#elseif (js && flight_esm)

typedef Awd2TransformRead = flight._js.Awd2TransformRead;

#elseif js

#error "flight.Awd2TransformRead on js requires flight_esm."

#else

#error "flight.Awd2TransformRead: no backend for this target."

#end
