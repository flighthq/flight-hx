package flight;

#if hl

typedef ParticleEmitter2DRuntime = flight._hl.ParticleEmitter2DRuntime;

#elseif cpp

typedef ParticleEmitter2DRuntime = flight._cpp.ParticleEmitter2DRuntime;

#elseif (js && flight_esm)

typedef ParticleEmitter2DRuntime = flight._js.ParticleEmitter2DRuntime;

#elseif js

#error "flight.ParticleEmitter2DRuntime on js requires flight_esm."

#else

#error "flight.ParticleEmitter2DRuntime: no backend for this target."

#end
