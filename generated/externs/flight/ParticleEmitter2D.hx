package flight;

#if hl

typedef ParticleEmitter2D = flight._hl.ParticleEmitter2D;

#elseif cpp

typedef ParticleEmitter2D = flight._cpp.ParticleEmitter2D;

#elseif (js && flight_esm)

typedef ParticleEmitter2D = flight._js.ParticleEmitter2D;

#elseif js

#error "flight.ParticleEmitter2D on js requires flight_esm."

#else

#error "flight.ParticleEmitter2D: no backend for this target."

#end
