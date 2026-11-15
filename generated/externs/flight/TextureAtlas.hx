package flight;

#if hl

typedef TextureAtlas = flight._hl.TextureAtlas;

#elseif cpp

typedef TextureAtlas = flight._cpp.TextureAtlas;

#elseif (js && flight_esm)

typedef TextureAtlas = flight._js.TextureAtlas;

#elseif js

#error "flight.TextureAtlas on js requires flight_esm."

#else

#error "flight.TextureAtlas: no backend for this target."

#end
