package flight;

#if hl

typedef TiledProperty = flight._hl.TiledProperty;

#elseif cpp

typedef TiledProperty = flight._cpp.TiledProperty;

#elseif (js && flight_esm)

typedef TiledProperty = flight._js.TiledProperty;

#elseif js

#error "flight.TiledProperty on js requires flight_esm."

#else

#error "flight.TiledProperty: no backend for this target."

#end
