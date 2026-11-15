package flight;

#if hl

typedef TiledObject = flight._hl.TiledObject;

#elseif cpp

typedef TiledObject = flight._cpp.TiledObject;

#elseif (js && flight_esm)

typedef TiledObject = flight._js.TiledObject;

#elseif js

#error "flight.TiledObject on js requires flight_esm."

#else

#error "flight.TiledObject: no backend for this target."

#end
