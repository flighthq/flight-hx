package flight;

#if hl

typedef ParticleDeathEvent = flight._hl.ParticleDeathEvent;

#elseif cpp

typedef ParticleDeathEvent = flight._cpp.ParticleDeathEvent;

#elseif (js && flight_esm)

typedef ParticleDeathEvent = flight._js.ParticleDeathEvent;

#elseif js

#error "flight.ParticleDeathEvent on js requires flight_esm."

#else

#error "flight.ParticleDeathEvent: no backend for this target."

#end
