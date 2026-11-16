package flight;

#if hl

typedef ParticleConfigIssue = flight._hl.ParticleConfigIssue;

#elseif cpp

typedef ParticleConfigIssue = flight._cpp.ParticleConfigIssue;

#elseif (js && flight_esm)

typedef ParticleConfigIssue = flight._js.ParticleConfigIssue;

#elseif js

#error "flight.ParticleConfigIssue on js requires flight_esm."

#else

#error "flight.ParticleConfigIssue: no backend for this target."

#end
