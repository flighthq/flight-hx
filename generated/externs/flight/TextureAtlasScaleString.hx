package flight;

#if hl

typedef TextureAtlasScaleString = flight._hl.TextureAtlasScaleString;

#elseif cpp

typedef TextureAtlasScaleString = flight._cpp.TextureAtlasScaleString;

#elseif (js && flight_esm)

typedef TextureAtlasScaleString = flight._js.TextureAtlasScaleString;

#elseif js

#error "flight.TextureAtlasScaleString on js requires flight_esm."

#else

#error "flight.TextureAtlasScaleString: no backend for this target."

#end
