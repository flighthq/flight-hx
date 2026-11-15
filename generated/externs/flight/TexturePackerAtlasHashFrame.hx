package flight;

#if hl

typedef TexturePackerAtlasHashFrame = flight._hl.TexturePackerAtlasHashFrame;

#elseif cpp

typedef TexturePackerAtlasHashFrame = flight._cpp.TexturePackerAtlasHashFrame;

#elseif (js && flight_esm)

typedef TexturePackerAtlasHashFrame = flight._js.TexturePackerAtlasHashFrame;

#elseif js

#error "flight.TexturePackerAtlasHashFrame on js requires flight_esm."

#else

#error "flight.TexturePackerAtlasHashFrame: no backend for this target."

#end
