package flight;

#if hl

typedef ParticleEmitterConfig = flight._hl.ParticleEmitterConfig;

#elseif cpp

typedef ParticleEmitterConfig = flight._cpp.ParticleEmitterConfig;

#elseif (js && flight_esm)

typedef ParticleEmitterConfig = flight._js.ParticleEmitterConfig;

#elseif js

#error "flight.ParticleEmitterConfig on js requires flight_esm."

#else

#error "flight.ParticleEmitterConfig: no backend for this target."

#end
