package flight;

#if hl

typedef TextureContainerLevels = flight._hl.TextureContainerLevels;

#elseif cpp

typedef TextureContainerLevels = flight._cpp.TextureContainerLevels;

#elseif (js && flight_esm)

typedef TextureContainerLevels = flight._js.TextureContainerLevels;

#elseif js

#error "flight.TextureContainerLevels on js requires flight_esm."

#else

#error "flight.TextureContainerLevels: no backend for this target."

#end
