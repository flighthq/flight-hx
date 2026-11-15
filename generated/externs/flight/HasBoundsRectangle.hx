package flight;

#if hl

typedef HasBoundsRectangle = flight._hl.HasBoundsRectangle;

#elseif cpp

typedef HasBoundsRectangle = flight._cpp.HasBoundsRectangle;

#elseif (js && flight_esm)

typedef HasBoundsRectangle = flight._js.HasBoundsRectangle;

#elseif js

#error "flight.HasBoundsRectangle on js requires flight_esm."

#else

#error "flight.HasBoundsRectangle: no backend for this target."

#end
