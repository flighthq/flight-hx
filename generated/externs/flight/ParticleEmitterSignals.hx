package flight;

#if hl

typedef ParticleEmitterSignals = flight._hl.ParticleEmitterSignals;

#elseif cpp

typedef ParticleEmitterSignals = flight._cpp.ParticleEmitterSignals;

#elseif (js && flight_esm)

typedef ParticleEmitterSignals = flight._js.ParticleEmitterSignals;

#elseif js

#error "flight.ParticleEmitterSignals on js requires flight_esm."

#else

#error "flight.ParticleEmitterSignals: no backend for this target."

#end
