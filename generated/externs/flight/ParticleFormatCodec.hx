package flight;

#if hl

typedef ParticleFormatCodec = flight._hl.ParticleFormatCodec;

#elseif cpp

typedef ParticleFormatCodec = flight._cpp.ParticleFormatCodec;

#elseif (js && flight_esm)

typedef ParticleFormatCodec = flight._js.ParticleFormatCodec;

#elseif js

#error "flight.ParticleFormatCodec on js requires flight_esm."

#else

#error "flight.ParticleFormatCodec: no backend for this target."

#end
