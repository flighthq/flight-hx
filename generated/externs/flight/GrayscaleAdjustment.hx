package flight;

#if hl

typedef GrayscaleAdjustment = flight._hl.GrayscaleAdjustment;

#elseif cpp

typedef GrayscaleAdjustment = flight._cpp.GrayscaleAdjustment;

#elseif (js && flight_esm)

typedef GrayscaleAdjustment = flight._js.GrayscaleAdjustment;

#elseif js

#error "flight.GrayscaleAdjustment on js requires flight_esm."

#else

#error "flight.GrayscaleAdjustment: no backend for this target."

#end
