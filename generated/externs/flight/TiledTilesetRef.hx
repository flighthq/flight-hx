package flight;

#if hl

typedef TiledTilesetRef = flight._hl.TiledTilesetRef;

#elseif cpp

typedef TiledTilesetRef = flight._cpp.TiledTilesetRef;

#elseif (js && flight_esm)

typedef TiledTilesetRef = flight._js.TiledTilesetRef;

#elseif js

#error "flight.TiledTilesetRef on js requires flight_esm."

#else

#error "flight.TiledTilesetRef: no backend for this target."

#end
