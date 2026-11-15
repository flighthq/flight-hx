package flight;

#if hl

typedef TiledTilesetLayout = flight._hl.TiledTilesetLayout;

#elseif cpp

typedef TiledTilesetLayout = flight._cpp.TiledTilesetLayout;

#elseif (js && flight_esm)

typedef TiledTilesetLayout = flight._js.TiledTilesetLayout;

#elseif js

#error "flight.TiledTilesetLayout on js requires flight_esm."

#else

#error "flight.TiledTilesetLayout: no backend for this target."

#end
