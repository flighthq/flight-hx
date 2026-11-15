package flight;

#if hl

typedef ParticleObjectsUpdateOptions = flight._hl.ParticleObjectsUpdateOptions;

#elseif cpp

typedef ParticleObjectsUpdateOptions = flight._cpp.ParticleObjectsUpdateOptions;

#elseif (js && flight_esm)

typedef ParticleObjectsUpdateOptions = flight._js.ParticleObjectsUpdateOptions;

#elseif js

#error "flight.ParticleObjectsUpdateOptions on js requires flight_esm."

#else

#error "flight.ParticleObjectsUpdateOptions: no backend for this target."

#end
