package flight;

#if hl

typedef ParticleDesignerParseResult = flight._hl.ParticleDesignerParseResult;

#elseif cpp

typedef ParticleDesignerParseResult = flight._cpp.ParticleDesignerParseResult;

#elseif (js && flight_esm)

typedef ParticleDesignerParseResult = flight._js.ParticleDesignerParseResult;

#elseif js

#error "flight.ParticleDesignerParseResult on js requires flight_esm."

#else

#error "flight.ParticleDesignerParseResult: no backend for this target."

#end
