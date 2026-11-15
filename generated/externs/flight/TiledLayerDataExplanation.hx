package flight;

#if hl

typedef TiledLayerDataExplanation = flight._hl.TiledLayerDataExplanation;

#elseif cpp

typedef TiledLayerDataExplanation = flight._cpp.TiledLayerDataExplanation;

#elseif (js && flight_esm)

typedef TiledLayerDataExplanation = flight._js.TiledLayerDataExplanation;

#elseif js

#error "flight.TiledLayerDataExplanation on js requires flight_esm."

#else

#error "flight.TiledLayerDataExplanation: no backend for this target."

#end
