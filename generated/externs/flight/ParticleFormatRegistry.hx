package flight;

#if hl

typedef ParticleFormatRegistry = flight._hl.ParticleFormatRegistry;

#elseif cpp

typedef ParticleFormatRegistry = flight._cpp.ParticleFormatRegistry;

#elseif (js && flight_esm)

typedef ParticleFormatRegistry = flight._js.ParticleFormatRegistry;

#elseif js

#error "flight.ParticleFormatRegistry on js requires flight_esm."

#else

#error "flight.ParticleFormatRegistry: no backend for this target."

#end
