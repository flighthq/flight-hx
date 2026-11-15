package flight;

#if hl

typedef TiledLayerBase = flight._hl.TiledLayerBase;

#elseif cpp

typedef TiledLayerBase = flight._cpp.TiledLayerBase;

#elseif (js && flight_esm)

typedef TiledLayerBase = flight._js.TiledLayerBase;

#elseif js

#error "flight.TiledLayerBase on js requires flight_esm."

#else

#error "flight.TiledLayerBase: no backend for this target."

#end
