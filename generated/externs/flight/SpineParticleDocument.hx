package flight;

#if hl

typedef SpineParticleDocument = flight._hl.SpineParticleDocument;

#elseif cpp

typedef SpineParticleDocument = flight._cpp.SpineParticleDocument;

#elseif (js && flight_esm)

typedef SpineParticleDocument = flight._js.SpineParticleDocument;

#elseif js

#error "flight.SpineParticleDocument on js requires flight_esm."

#else

#error "flight.SpineParticleDocument: no backend for this target."

#end
