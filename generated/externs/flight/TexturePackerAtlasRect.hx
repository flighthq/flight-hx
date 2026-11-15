package flight;

#if hl

typedef TexturePackerAtlasRect = flight._hl.TexturePackerAtlasRect;

#elseif cpp

typedef TexturePackerAtlasRect = flight._cpp.TexturePackerAtlasRect;

#elseif (js && flight_esm)

typedef TexturePackerAtlasRect = flight._js.TexturePackerAtlasRect;

#elseif js

#error "flight.TexturePackerAtlasRect on js requires flight_esm."

#else

#error "flight.TexturePackerAtlasRect: no backend for this target."

#end
