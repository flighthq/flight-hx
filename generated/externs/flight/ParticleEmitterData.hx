package flight;

#if hl

typedef ParticleEmitterData = flight._hl.ParticleEmitterData;

#elseif cpp

typedef ParticleEmitterData = flight._cpp.ParticleEmitterData;

#elseif (js && flight_esm)

typedef ParticleEmitterData = flight._js.ParticleEmitterData;

#elseif js

#error "flight.ParticleEmitterData on js requires flight_esm."

#else

#error "flight.ParticleEmitterData: no backend for this target."

#end
