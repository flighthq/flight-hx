package flight;

#if hl

typedef Awd2ParsedTexture = flight._hl.Awd2ParsedTexture;

#elseif cpp

typedef Awd2ParsedTexture = flight._cpp.Awd2ParsedTexture;

#elseif (js && flight_esm)

typedef Awd2ParsedTexture = flight._js.Awd2ParsedTexture;

#elseif js

#error "flight.Awd2ParsedTexture on js requires flight_esm."

#else

#error "flight.Awd2ParsedTexture: no backend for this target."

#end
