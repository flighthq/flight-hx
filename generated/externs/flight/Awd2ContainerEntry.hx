package flight;

#if hl

typedef Awd2ContainerEntry = flight._hl.Awd2ContainerEntry;

#elseif cpp

typedef Awd2ContainerEntry = flight._cpp.Awd2ContainerEntry;

#elseif (js && flight_esm)

typedef Awd2ContainerEntry = flight._js.Awd2ContainerEntry;

#elseif js

#error "flight.Awd2ContainerEntry on js requires flight_esm."

#else

#error "flight.Awd2ContainerEntry: no backend for this target."

#end
