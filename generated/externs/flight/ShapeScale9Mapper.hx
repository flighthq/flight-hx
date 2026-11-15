package flight;

#if hl

typedef ShapeScale9Mapper = flight._hl.ShapeScale9Mapper;

#elseif cpp

typedef ShapeScale9Mapper = flight._cpp.ShapeScale9Mapper;

#elseif (js && flight_esm)

typedef ShapeScale9Mapper = flight._js.ShapeScale9Mapper;

#elseif js

#error "flight.ShapeScale9Mapper on js requires flight_esm."

#else

#error "flight.ShapeScale9Mapper: no backend for this target."

#end
