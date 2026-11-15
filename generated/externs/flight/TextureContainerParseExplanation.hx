package flight;

#if hl

typedef TextureContainerParseExplanation = flight._hl.TextureContainerParseExplanation;

#elseif cpp

typedef TextureContainerParseExplanation = flight._cpp.TextureContainerParseExplanation;

#elseif (js && flight_esm)

typedef TextureContainerParseExplanation = flight._js.TextureContainerParseExplanation;

#elseif js

#error "flight.TextureContainerParseExplanation on js requires flight_esm."

#else

#error "flight.TextureContainerParseExplanation: no backend for this target."

#end
