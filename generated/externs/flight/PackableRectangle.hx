package flight;

#if hl

typedef PackableRectangle = flight._hl.PackableRectangle;

#elseif cpp

typedef PackableRectangle = flight._cpp.PackableRectangle;

#elseif (js && flight_esm)

typedef PackableRectangle = flight._js.PackableRectangle;

#elseif js

#error "flight.PackableRectangle on js requires flight_esm."

#else

#error "flight.PackableRectangle: no backend for this target."

#end
