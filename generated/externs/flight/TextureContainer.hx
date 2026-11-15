package flight;

#if hl

typedef TextureContainer = flight._hl.TextureContainer;

#elseif cpp

typedef TextureContainer = flight._cpp.TextureContainer;

#elseif (js && flight_esm)

typedef TextureContainer = flight._js.TextureContainer;

#elseif js

#error "flight.TextureContainer on js requires flight_esm."

#else

#error "flight.TextureContainer: no backend for this target."

#end
