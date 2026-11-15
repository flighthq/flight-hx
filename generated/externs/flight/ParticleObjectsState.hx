package flight;

#if hl

typedef ParticleObjectsState = flight._hl.ParticleObjectsState;

#elseif cpp

typedef ParticleObjectsState = flight._cpp.ParticleObjectsState;

#elseif (js && flight_esm)

typedef ParticleObjectsState = flight._js.ParticleObjectsState;

#elseif js

#error "flight.ParticleObjectsState on js requires flight_esm."

#else

#error "flight.ParticleObjectsState: no backend for this target."

#end
