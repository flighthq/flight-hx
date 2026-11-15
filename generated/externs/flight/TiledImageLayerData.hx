package flight;

#if hl

typedef TiledImageLayerData = flight._hl.TiledImageLayerData;

#elseif cpp

typedef TiledImageLayerData = flight._cpp.TiledImageLayerData;

#elseif (js && flight_esm)

typedef TiledImageLayerData = flight._js.TiledImageLayerData;

#elseif js

#error "flight.TiledImageLayerData on js requires flight_esm."

#else

#error "flight.TiledImageLayerData: no backend for this target."

#end
