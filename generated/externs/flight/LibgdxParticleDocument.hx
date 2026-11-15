package flight;

#if hl

typedef LibgdxParticleDocument = flight._hl.LibgdxParticleDocument;

#elseif cpp

typedef LibgdxParticleDocument = flight._cpp.LibgdxParticleDocument;

#elseif (js && flight_esm)

typedef LibgdxParticleDocument = flight._js.LibgdxParticleDocument;

#elseif js

#error "flight.LibgdxParticleDocument on js requires flight_esm."

#else

#error "flight.LibgdxParticleDocument: no backend for this target."

#end
