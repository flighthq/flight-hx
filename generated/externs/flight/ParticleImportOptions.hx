package flight;

#if hl

typedef ParticleImportOptions = flight._hl.ParticleImportOptions;

#elseif cpp

typedef ParticleImportOptions = flight._cpp.ParticleImportOptions;

#elseif (js && flight_esm)

typedef ParticleImportOptions = flight._js.ParticleImportOptions;

#elseif js

#error "flight.ParticleImportOptions on js requires flight_esm."

#else

#error "flight.ParticleImportOptions: no backend for this target."

#end
