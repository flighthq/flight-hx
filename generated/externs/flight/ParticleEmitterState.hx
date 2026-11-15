package flight;

#if hl

typedef ParticleEmitterState = flight._hl.ParticleEmitterState;

#elseif cpp

typedef ParticleEmitterState = flight._cpp.ParticleEmitterState;

#elseif (js && flight_esm)

typedef ParticleEmitterState = flight._js.ParticleEmitterState;

#elseif js

#error "flight.ParticleEmitterState on js requires flight_esm."

#else

#error "flight.ParticleEmitterState: no backend for this target."

#end
