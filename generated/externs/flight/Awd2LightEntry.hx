package flight;

#if hl

typedef Awd2LightEntry = flight._hl.Awd2LightEntry;

#elseif cpp

typedef Awd2LightEntry = flight._cpp.Awd2LightEntry;

#elseif (js && flight_esm)

typedef Awd2LightEntry = flight._js.Awd2LightEntry;

#elseif js

#error "flight.Awd2LightEntry on js requires flight_esm."

#else

#error "flight.Awd2LightEntry: no backend for this target."

#end
