package flight;

#if hl

typedef ParticleEmitterConfigOptions = flight._hl.ParticleEmitterConfigOptions;

#elseif cpp

typedef ParticleEmitterConfigOptions = flight._cpp.ParticleEmitterConfigOptions;

#elseif (js && flight_esm)

typedef ParticleEmitterConfigOptions = flight._js.ParticleEmitterConfigOptions;

#elseif js

#error "flight.ParticleEmitterConfigOptions on js requires flight_esm."

#else

#error "flight.ParticleEmitterConfigOptions: no backend for this target."

#end
