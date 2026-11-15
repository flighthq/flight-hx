package flight;

#if hl

typedef TexturePackerAtlasFrameTag = flight._hl.TexturePackerAtlasFrameTag;

#elseif cpp

typedef TexturePackerAtlasFrameTag = flight._cpp.TexturePackerAtlasFrameTag;

#elseif (js && flight_esm)

typedef TexturePackerAtlasFrameTag = flight._js.TexturePackerAtlasFrameTag;

#elseif js

#error "flight.TexturePackerAtlasFrameTag on js requires flight_esm."

#else

#error "flight.TexturePackerAtlasFrameTag: no backend for this target."

#end
