package flight;

#if hl

typedef TiledTileLayerData = flight._hl.TiledTileLayerData;

#elseif cpp

typedef TiledTileLayerData = flight._cpp.TiledTileLayerData;

#elseif (js && flight_esm)

typedef TiledTileLayerData = flight._js.TiledTileLayerData;

#elseif js

#error "flight.TiledTileLayerData on js requires flight_esm."

#else

#error "flight.TiledTileLayerData: no backend for this target."

#end
