package flight;

#if hl

typedef ParticleObject = flight._hl.ParticleObject;

#elseif cpp

typedef ParticleObject = flight._cpp.ParticleObject;

#elseif (js && flight_esm)

typedef ParticleObject = flight._js.ParticleObject;

#elseif js

#error "flight.ParticleObject on js requires flight_esm."

#else

#error "flight.ParticleObject: no backend for this target."

#end
