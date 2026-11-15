package flight;

#if hl

typedef ParticleSpawnEvent = flight._hl.ParticleSpawnEvent;

#elseif cpp

typedef ParticleSpawnEvent = flight._cpp.ParticleSpawnEvent;

#elseif (js && flight_esm)

typedef ParticleSpawnEvent = flight._js.ParticleSpawnEvent;

#elseif js

#error "flight.ParticleSpawnEvent on js requires flight_esm."

#else

#error "flight.ParticleSpawnEvent: no backend for this target."

#end
