package flight;

#if hl

typedef ParseParticleConfigOptions = flight._hl.ParseParticleConfigOptions;

#elseif cpp

typedef ParseParticleConfigOptions = flight._cpp.ParseParticleConfigOptions;

#elseif (js && flight_esm)

typedef ParseParticleConfigOptions = flight._js.ParseParticleConfigOptions;

#elseif js

#error "flight.ParseParticleConfigOptions on js requires flight_esm."

#else

#error "flight.ParseParticleConfigOptions: no backend for this target."

#end
