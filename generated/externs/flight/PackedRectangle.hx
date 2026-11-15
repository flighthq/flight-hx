package flight;

#if hl

typedef PackedRectangle = flight._hl.PackedRectangle;

#elseif cpp

typedef PackedRectangle = flight._cpp.PackedRectangle;

#elseif (js && flight_esm)

typedef PackedRectangle = flight._js.PackedRectangle;

#elseif js

#error "flight.PackedRectangle on js requires flight_esm."

#else

#error "flight.PackedRectangle: no backend for this target."

#end
