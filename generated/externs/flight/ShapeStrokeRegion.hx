package flight;

#if hl

typedef ShapeStrokeRegion = flight._hl.ShapeStrokeRegion;

#elseif cpp

typedef ShapeStrokeRegion = flight._cpp.ShapeStrokeRegion;

#elseif (js && flight_esm)

typedef ShapeStrokeRegion = flight._js.ShapeStrokeRegion;

#elseif js

#error "flight.ShapeStrokeRegion on js requires flight_esm."

#else

#error "flight.ShapeStrokeRegion: no backend for this target."

#end
