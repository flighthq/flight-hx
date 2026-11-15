package flight;

#if hl

typedef ShapeFillRegion = flight._hl.ShapeFillRegion;

#elseif cpp

typedef ShapeFillRegion = flight._cpp.ShapeFillRegion;

#elseif (js && flight_esm)

typedef ShapeFillRegion = flight._js.ShapeFillRegion;

#elseif js

#error "flight.ShapeFillRegion on js requires flight_esm."

#else

#error "flight.ShapeFillRegion: no backend for this target."

#end
