package flight;

#if hl

typedef ParticleDesignerDocument = flight._hl.ParticleDesignerDocument;

#elseif cpp

typedef ParticleDesignerDocument = flight._cpp.ParticleDesignerDocument;

#elseif (js && flight_esm)

typedef ParticleDesignerDocument = flight._js.ParticleDesignerDocument;

#elseif js

#error "flight.ParticleDesignerDocument on js requires flight_esm."

#else

#error "flight.ParticleDesignerDocument: no backend for this target."

#end
