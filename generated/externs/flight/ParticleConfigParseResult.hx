package flight;

#if hl

typedef ParticleConfigParseResult = flight._hl.ParticleConfigParseResult;

#elseif cpp

typedef ParticleConfigParseResult = flight._cpp.ParticleConfigParseResult;

#elseif (js && flight_esm)

typedef ParticleConfigParseResult = flight._js.ParticleConfigParseResult;

#elseif js

#error "flight.ParticleConfigParseResult on js requires flight_esm."

#else

#error "flight.ParticleConfigParseResult: no backend for this target."

#end
