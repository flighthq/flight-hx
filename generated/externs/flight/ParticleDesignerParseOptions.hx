package flight;

#if hl

typedef ParticleDesignerParseOptions = flight._hl.ParticleDesignerParseOptions;

#elseif cpp

typedef ParticleDesignerParseOptions = flight._cpp.ParticleDesignerParseOptions;

#elseif (js && flight_esm)

typedef ParticleDesignerParseOptions = flight._js.ParticleDesignerParseOptions;

#elseif js

#error "flight.ParticleDesignerParseOptions on js requires flight_esm."

#else

#error "flight.ParticleDesignerParseOptions: no backend for this target."

#end
