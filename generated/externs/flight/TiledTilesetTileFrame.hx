package flight;

#if hl

typedef TiledTilesetTileFrame = flight._hl.TiledTilesetTileFrame;

#elseif cpp

typedef TiledTilesetTileFrame = flight._cpp.TiledTilesetTileFrame;

#elseif (js && flight_esm)

typedef TiledTilesetTileFrame = flight._js.TiledTilesetTileFrame;

#elseif js

#error "flight.TiledTilesetTileFrame on js requires flight_esm."

#else

#error "flight.TiledTilesetTileFrame: no backend for this target."

#end
