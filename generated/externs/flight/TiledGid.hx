package flight;

#if hl

typedef TiledGid = flight._hl.TiledGid;

#elseif cpp

typedef TiledGid = flight._cpp.TiledGid;

#elseif (js && flight_esm)

typedef TiledGid = flight._js.TiledGid;

#elseif js

#error "flight.TiledGid on js requires flight_esm."

#else

#error "flight.TiledGid: no backend for this target."

#end
