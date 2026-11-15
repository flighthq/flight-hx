package flight;

#if hl

typedef TilemapRuntime = flight._hl.TilemapRuntime;

#elseif cpp

typedef TilemapRuntime = flight._cpp.TilemapRuntime;

#elseif (js && flight_esm)

typedef TilemapRuntime = flight._js.TilemapRuntime;

#elseif js

#error "flight.TilemapRuntime on js requires flight_esm."

#else

#error "flight.TilemapRuntime: no backend for this target."

#end
