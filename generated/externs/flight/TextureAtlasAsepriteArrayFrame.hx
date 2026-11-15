package flight;

#if hl

typedef TextureAtlasAsepriteArrayFrame = flight._hl.TextureAtlasAsepriteArrayFrame;

#elseif cpp

typedef TextureAtlasAsepriteArrayFrame = flight._cpp.TextureAtlasAsepriteArrayFrame;

#elseif (js && flight_esm)

typedef TextureAtlasAsepriteArrayFrame = flight._js.TextureAtlasAsepriteArrayFrame;

#elseif js

#error "flight.TextureAtlasAsepriteArrayFrame on js requires flight_esm."

#else

#error "flight.TextureAtlasAsepriteArrayFrame: no backend for this target."

#end
