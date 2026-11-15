package flight;

#if hl

typedef ParticleEmitterCallbacks = flight._hl.ParticleEmitterCallbacks;

#elseif cpp

typedef ParticleEmitterCallbacks = flight._cpp.ParticleEmitterCallbacks;

#elseif (js && flight_esm)

typedef ParticleEmitterCallbacks = flight._js.ParticleEmitterCallbacks;

#elseif js

#error "flight.ParticleEmitterCallbacks on js requires flight_esm."

#else

#error "flight.ParticleEmitterCallbacks: no backend for this target."

#end
