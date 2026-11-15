package flight;

#if hl

typedef TiledTilesetTile = flight._hl.TiledTilesetTile;

#elseif cpp

typedef TiledTilesetTile = flight._cpp.TiledTilesetTile;

#elseif (js && flight_esm)

typedef TiledTilesetTile = flight._js.TiledTilesetTile;

#elseif js

#error "flight.TiledTilesetTile on js requires flight_esm."

#else

#error "flight.TiledTilesetTile: no backend for this target."

#end
