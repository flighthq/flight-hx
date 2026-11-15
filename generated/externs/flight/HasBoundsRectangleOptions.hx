package flight;

#if hl

typedef HasBoundsRectangleOptions = flight._hl.HasBoundsRectangleOptions;

#elseif cpp

typedef HasBoundsRectangleOptions = flight._cpp.HasBoundsRectangleOptions;

#elseif (js && flight_esm)

typedef HasBoundsRectangleOptions = flight._js.HasBoundsRectangleOptions;

#elseif js

#error "flight.HasBoundsRectangleOptions on js requires flight_esm."

#else

#error "flight.HasBoundsRectangleOptions: no backend for this target."

#end
