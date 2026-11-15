package flight;

#if hl

typedef ParticleFormatKind = flight._hl.ParticleFormatKind;

#elseif cpp

typedef ParticleFormatKind = flight._cpp.ParticleFormatKind;

#elseif (js && flight_esm)

typedef ParticleFormatKind = flight._js.ParticleFormatKind;

#elseif js

#error "flight.ParticleFormatKind on js requires flight_esm."

#else

#error "flight.ParticleFormatKind: no backend for this target."

#end
