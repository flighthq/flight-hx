package flight;

#if hl

typedef ParticleFormatWarning = flight._hl.ParticleFormatWarning;

#elseif cpp

typedef ParticleFormatWarning = flight._cpp.ParticleFormatWarning;

#elseif (js && flight_esm)

typedef ParticleFormatWarning = flight._js.ParticleFormatWarning;

#elseif js

#error "flight.ParticleFormatWarning on js requires flight_esm."

#else

#error "flight.ParticleFormatWarning: no backend for this target."

#end
