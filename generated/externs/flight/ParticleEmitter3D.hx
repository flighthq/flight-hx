package flight;

#if hl

typedef ParticleEmitter3D = flight._hl.ParticleEmitter3D;

#elseif cpp

typedef ParticleEmitter3D = flight._cpp.ParticleEmitter3D;

#elseif (js && flight_esm)

typedef ParticleEmitter3D = flight._js.ParticleEmitter3D;

#elseif js

#error "flight.ParticleEmitter3D on js requires flight_esm."

#else

#error "flight.ParticleEmitter3D: no backend for this target."

#end
