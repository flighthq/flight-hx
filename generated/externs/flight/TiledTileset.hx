package flight;

#if hl

typedef TiledTileset = flight._hl.TiledTileset;

#elseif cpp

typedef TiledTileset = flight._cpp.TiledTileset;

#elseif (js && flight_esm)

typedef TiledTileset = flight._js.TiledTileset;

#elseif js

#error "flight.TiledTileset on js requires flight_esm."

#else

#error "flight.TiledTileset: no backend for this target."

#end
