package flight;

#if hl

typedef TextureContainerLevel = flight._hl.TextureContainerLevel;

#elseif cpp

typedef TextureContainerLevel = flight._cpp.TextureContainerLevel;

#elseif (js && flight_esm)

typedef TextureContainerLevel = flight._js.TextureContainerLevel;

#elseif js

#error "flight.TextureContainerLevel on js requires flight_esm."

#else

#error "flight.TextureContainerLevel: no backend for this target."

#end
