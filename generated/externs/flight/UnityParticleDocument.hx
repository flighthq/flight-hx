package flight;

#if hl

typedef UnityParticleDocument = flight._hl.UnityParticleDocument;

#elseif cpp

typedef UnityParticleDocument = flight._cpp.UnityParticleDocument;

#elseif (js && flight_esm)

typedef UnityParticleDocument = flight._js.UnityParticleDocument;

#elseif js

#error "flight.UnityParticleDocument on js requires flight_esm."

#else

#error "flight.UnityParticleDocument: no backend for this target."

#end
