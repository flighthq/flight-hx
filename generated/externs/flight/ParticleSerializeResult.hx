package flight;

#if hl

typedef ParticleSerializeResult = flight._hl.ParticleSerializeResult;

#elseif cpp

typedef ParticleSerializeResult = flight._cpp.ParticleSerializeResult;

#elseif (js && flight_esm)

typedef ParticleSerializeResult = flight._js.ParticleSerializeResult;

#elseif js

#error "flight.ParticleSerializeResult on js requires flight_esm."

#else

#error "flight.ParticleSerializeResult: no backend for this target."

#end
