package flight;

#if hl

typedef Sampler = flight._hl.Sampler;

#elseif cpp

typedef Sampler = flight._cpp.Sampler;

#elseif (js && flight_esm)

typedef Sampler = flight._js.Sampler;

#elseif js

#error "flight.Sampler on js requires flight_esm."

#else

#error "flight.Sampler: no backend for this target."

#end
