package flight;

#if hl

typedef TilemapSignals = flight._hl.TilemapSignals;

#elseif cpp

typedef TilemapSignals = flight._cpp.TilemapSignals;

#elseif (js && flight_esm)

typedef TilemapSignals = flight._js.TilemapSignals;

#elseif js

#error "flight.TilemapSignals on js requires flight_esm."

#else

#error "flight.TilemapSignals: no backend for this target."

#end
