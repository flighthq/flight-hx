package flight;

#if hl

typedef HueSaturationAdjustment = flight._hl.HueSaturationAdjustment;

#elseif cpp

typedef HueSaturationAdjustment = flight._cpp.HueSaturationAdjustment;

#elseif (js && flight_esm)

typedef HueSaturationAdjustment = flight._js.HueSaturationAdjustment;

#elseif js

#error "flight.HueSaturationAdjustment on js requires flight_esm."

#else

#error "flight.HueSaturationAdjustment: no backend for this target."

#end
