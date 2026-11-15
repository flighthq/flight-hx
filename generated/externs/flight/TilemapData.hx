package flight;

#if hl

typedef TilemapData = flight._hl.TilemapData;

#elseif cpp

typedef TilemapData = flight._cpp.TilemapData;

#elseif (js && flight_esm)

typedef TilemapData = flight._js.TilemapData;

#elseif js

#error "flight.TilemapData on js requires flight_esm."

#else

#error "flight.TilemapData: no backend for this target."

#end
