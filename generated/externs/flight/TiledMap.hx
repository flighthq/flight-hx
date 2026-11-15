package flight;

#if hl

typedef TiledMap = flight._hl.TiledMap;

#elseif cpp

typedef TiledMap = flight._cpp.TiledMap;

#elseif (js && flight_esm)

typedef TiledMap = flight._js.TiledMap;

#elseif js

#error "flight.TiledMap on js requires flight_esm."

#else

#error "flight.TiledMap: no backend for this target."

#end
